import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app_providers.dart';
import '../../core/money.dart';
import '../../data/db/app_database.dart';
import '../../data/services/purchase_service.dart';

class PurchaseScreen extends ConsumerStatefulWidget {
  final int shopId;
  const PurchaseScreen({super.key, required this.shopId});

  @override
  ConsumerState<PurchaseScreen> createState() => _PurchaseScreenState();
}

class _PurchaseLine {
  final int productId;
  final String name;
  final int unitCost;
  int qty;
  int? taxRateId; // input VAT rate

  _PurchaseLine({
    required this.productId,
    required this.name,
    required this.unitCost,
    required this.taxRateId,
    this.qty = 1,
  });
}

class _PurchaseScreenState extends ConsumerState<PurchaseScreen> {
  final _lines = <_PurchaseLine>[];
  int? _supplierId;
  int? _methodAccountId;
  bool _onCredit = false;
  bool _busy = false;
  int? _inputVatId;

  @override
  Widget build(BuildContext context) {
    final parties = ref.watch(partiesProvider(widget.shopId));
    final products = ref.watch(productsProvider(widget.shopId));
    final methods = ref.watch(paymentMethodsProvider(widget.shopId));
    final rates = ref.watch(taxRatesProvider);

    if (_inputVatId == null && rates.value != null) {
      for (final r in rates.value!) {
        if (r.name == 'VAT Input') {
          _inputVatId = r.id;
          break;
        }
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('New purchase')),
      body: parties.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (partyList) => methods.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('Error: $e')),
          data: (methodList) => products.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Error: $e')),
            data: (productList) => _buildForm(
                context, partyList, productList, methodList),
          ),
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context, List<Party> parties,
      List<Product> products, List<PaymentMethod> methods) {
    final suppliers = parties.toList();
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        DropdownButtonFormField<int>(
          key: const Key('supplier'),
          initialValue: _supplierId,
          decoration: const InputDecoration(
            labelText: 'Supplier',
            border: OutlineInputBorder(),
          ),
          items: [
            for (final s in suppliers)
              DropdownMenuItem<int>(value: s.id, child: Text(s.name)),
          ],
          onChanged: (v) => setState(() => _supplierId = v),
        ),
        const SizedBox(height: 16),
        Text('Items', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        if (_lines.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text('No items yet.'),
          ),
        for (var i = 0; i < _lines.length; i++)
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(_lines[i].name),
            subtitle: Text(Money(_lines[i].unitCost).format()),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: () => setState(() {
                    if (_lines[i].qty > 1) {
                      _lines[i].qty--;
                    } else {
                      _lines.removeAt(i);
                    }
                  }),
                ),
                Text('${_lines[i].qty}'),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: () => setState(() => _lines[i].qty++),
                ),
              ],
            ),
          ),
        OutlinedButton.icon(
          key: const Key('addPurchaseItem'),
          icon: const Icon(Icons.add),
          label: const Text('Add item'),
          onPressed: products.isEmpty
              ? null
              : () => _pickProduct(context, products),
        ),
        const SizedBox(height: 16),
        SwitchListTile(
          key: const Key('purchaseOnCredit'),
          contentPadding: EdgeInsets.zero,
          title: const Text('Buy on credit'),
          value: _onCredit,
          onChanged: (v) => setState(() => _onCredit = v),
        ),
        if (!_onCredit)
          DropdownButtonFormField<int>(
            key: const Key('purchaseMethod'),
            initialValue: _methodAccountId,
            decoration: const InputDecoration(
              labelText: 'Pay with',
              border: OutlineInputBorder(),
            ),
            items: [
              for (final m in methods)
                DropdownMenuItem<int>(
                    value: m.accountId, child: Text(m.name)),
            ],
            onChanged: (v) => setState(() => _methodAccountId = v),
          ),
        const SizedBox(height: 24),
        FilledButton(
          key: const Key('savePurchase'),
          onPressed: _busy ||
                  _lines.isEmpty ||
                  _supplierId == null ||
                  (!_onCredit && _methodAccountId == null)
              ? null
              : _submit,
          child: const Text('Complete purchase'),
        ),
      ],
    );
  }

  Future<void> _pickProduct(
      BuildContext context, List<Product> products) async {
    final picked = await showModalBottomSheet<_PurchaseLine>(
      context: context,
      isScrollControlled: true,
      builder: (_) => _PickPurchaseProduct(
          products: products, inputVatId: _inputVatId),
    );
    if (picked != null) setState(() => _lines.add(picked));
  }

  Future<void> _submit() async {
    setState(() => _busy = true);
    try {
      final lines = [
        for (final l in _lines)
          PurchaseLineInput(
            productId: l.productId,
            description: l.name,
            qtyThousandths: l.qty * 1000,
            unitCostPesewas: l.unitCost,
            taxRateId: l.taxRateId,
          ),
      ];
      final purchase = ref.read(purchaseServiceProvider);
      if (_onCredit) {
        await purchase.recordCreditPurchase(
          shopId: widget.shopId,
          supplierId: _supplierId!,
          date: DateTime.now(),
          lines: lines,
        );
      } else {
        await purchase.recordCashPurchase(
          shopId: widget.shopId,
          supplierId: _supplierId!,
          methodAccountId: _methodAccountId!,
          date: DateTime.now(),
          lines: lines,
        );
      }
      if (mounted) {
        setState(() {
          _lines.clear();
          _supplierId = null;
          _methodAccountId = null;
          _onCredit = false;
        });
        ref.invalidate(dashboardProvider(widget.shopId));
        ref.invalidate(productsProvider(widget.shopId));
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Purchase recorded')));
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }
}

class _PickPurchaseProduct extends StatefulWidget {
  final List<Product> products;
  final int? inputVatId;
  const _PickPurchaseProduct({required this.products, this.inputVatId});

  @override
  State<_PickPurchaseProduct> createState() => _PickPurchaseProductState();
}

class _PickPurchaseProductState extends State<_PickPurchaseProduct> {
  int? _productId;
  final _qty = TextEditingController(text: '1');

  @override
  void dispose() {
    _qty.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Add item', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          DropdownButtonFormField<int>(
            key: const Key('pickPurchaseProduct'),
            initialValue: _productId,
            decoration: const InputDecoration(labelText: 'Product'),
            items: [
              for (final p in widget.products)
                DropdownMenuItem<int>(
                  value: p.id,
                  child: Text('${p.name} — ${Money(p.cost).format()}'),
                ),
            ],
            onChanged: (v) => setState(() => _productId = v),
          ),
          const SizedBox(height: 8),
          TextField(
            key: const Key('pickPurchaseQty'),
            controller: _qty,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Quantity'),
          ),
          const SizedBox(height: 16),
          FilledButton(
            key: const Key('confirmPurchaseItem'),
            onPressed: _productId == null
                ? null
                : () {
                    final p = widget.products
                        .firstWhere((x) => x.id == _productId);
                    Navigator.of(context).pop(_PurchaseLine(
                      productId: p.id,
                      name: p.name,
                      unitCost: p.cost,
                      taxRateId: widget.inputVatId,
                      qty: int.tryParse(_qty.text.trim()) ?? 1,
                    ));
                  },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
