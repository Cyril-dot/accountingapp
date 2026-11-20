import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app_providers.dart';
import '../../core/money.dart';
import '../../data/db/app_database.dart';
import '../../data/services/sale_service.dart';
import '../../domain/engine/tax.dart';
import '../../domain/models/enums.dart';

class SalesScreen extends ConsumerStatefulWidget {
  final int shopId;
  const SalesScreen({super.key, required this.shopId});

  @override
  ConsumerState<SalesScreen> createState() => _SalesScreenState();
}

class _Line {
  final int productId;
  final String name;
  final int unitPrice;
  final int? taxRateId;
  int qty; // whole units

  _Line({
    required this.productId,
    required this.name,
    required this.unitPrice,
    required this.taxRateId,
    this.qty = 1,
  });
}

class _SalesScreenState extends ConsumerState<SalesScreen> {
  final _lines = <_Line>[];
  int? _partyId; // null = walk-in
  int? _methodAccountId;
  bool _onCredit = false;
  bool _busy = false;

  @override
  Widget build(BuildContext context) {
    final parties = ref.watch(partiesProvider(widget.shopId));
    final products = ref.watch(productsProvider(widget.shopId));
    final methods = ref.watch(paymentMethodsProvider(widget.shopId));
    final rates = ref.watch(taxRatesProvider);

    final total = _totalPesewas(rates.value ?? const []);

    return Scaffold(
      appBar: AppBar(title: const Text('New sale')),
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
              context,
              partyList,
              productList,
              methodList,
              total,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm(
    BuildContext context,
    List<Party> parties,
    List<Product> products,
    List<PaymentMethod> methods,
    int total,
  ) {
    final customers =
        parties.where((p) => p.partyKind != PartyKind.supplier).toList();
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        DropdownButtonFormField<int?>(
          key: const Key('customer'),
          initialValue: _partyId,
          decoration: const InputDecoration(
            labelText: 'Customer',
            border: OutlineInputBorder(),
          ),
          items: [
            const DropdownMenuItem<int?>(value: null, child: Text('Walk-in')),
            for (final c in customers)
              DropdownMenuItem<int?>(value: c.id, child: Text(c.name)),
          ],
          onChanged: (v) => setState(() => _partyId = v),
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
            subtitle: Text(Money(_lines[i].unitPrice).format()),
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
                Text('${_lines[i].qty}',
                    key: Key('lineQty-$i')),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: () => setState(() => _lines[i].qty++),
                ),
              ],
            ),
          ),
        OutlinedButton.icon(
          key: const Key('addItem'),
          icon: const Icon(Icons.add),
          label: const Text('Add item'),
          onPressed: products.isEmpty
              ? null
              : () => _pickProduct(context, products),
        ),
        const SizedBox(height: 16),
        SwitchListTile(
          key: const Key('onCredit'),
          contentPadding: EdgeInsets.zero,
          title: const Text('Sell on credit'),
          value: _onCredit,
          onChanged: (v) => setState(() => _onCredit = v),
        ),
        if (!_onCredit)
          DropdownButtonFormField<int>(
            key: const Key('method'),
            initialValue: _methodAccountId,
            decoration: const InputDecoration(
              labelText: 'Payment method',
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
        Text('Total: ${Money(total).format()}',
            key: const Key('saleTotal'),
            style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        FilledButton(
          key: const Key('saveSale'),
          onPressed: _busy || _lines.isEmpty || (!_onCredit && _methodAccountId == null)
              ? null
              : _submit,
          child: const Text('Complete sale'),
        ),
      ],
    );
  }

  int _totalPesewas(List<TaxRateRow> rates) {
    final byId = {for (final r in rates) r.id: TaxRate(name: r.name, rateBp: r.rateBp)};
    var total = 0;
    for (final l in _lines) {
      final r = l.taxRateId == null ? null : byId[l.taxRateId];
      total += computeLine(
        unitPricePesewas: l.unitPrice,
        qtyThousandths: l.qty * 1000,
        taxRate: r,
      ).totalPesewas;
    }
    return total;
  }

  Future<void> _pickProduct(BuildContext context, List<Product> products) async {
    final picked = await showModalBottomSheet<_Line>(
      context: context,
      isScrollControlled: true,
      builder: (_) => _PickProductSheet(products: products),
    );
    if (picked != null) setState(() => _lines.add(picked));
  }

  Future<void> _submit() async {
    setState(() => _busy = true);
    try {
      var partyId = _partyId;
      partyId ??= await ref
          .read(catalogRepositoryProvider)
          .findOrCreateWalkInCustomer(widget.shopId);
      final lines = [
        for (final l in _lines)
          SaleLineInput(
            productId: l.productId,
            description: l.name,
            qtyThousandths: l.qty * 1000,
            unitPricePesewas: l.unitPrice,
            taxRateId: l.taxRateId,
          ),
      ];
      final sale = ref.read(saleServiceProvider);
      if (_onCredit) {
        await sale.recordCreditSale(
            shopId: widget.shopId, partyId: partyId, date: DateTime.now(), lines: lines);
      } else {
        await sale.recordCashSale(
          shopId: widget.shopId,
          partyId: partyId,
          methodAccountId: _methodAccountId!,
          date: DateTime.now(),
          lines: lines,
        );
      }
      if (mounted) {
        setState(() {
          _lines.clear();
          _partyId = null;
          _methodAccountId = null;
          _onCredit = false;
        });
        ref.invalidate(dashboardProvider(widget.shopId));
        ref.invalidate(productsProvider(widget.shopId));
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Sale recorded')));
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }
}

class _PickProductSheet extends StatefulWidget {
  final List<Product> products;
  const _PickProductSheet({required this.products});

  @override
  State<_PickProductSheet> createState() => _PickProductSheetState();
}

class _PickProductSheetState extends State<_PickProductSheet> {
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
            key: const Key('pickProduct'),
            initialValue: _productId,
            decoration: const InputDecoration(labelText: 'Product'),
            items: [
              for (final p in widget.products)
                DropdownMenuItem<int>(
                  value: p.id,
                  child: Text('${p.name} — ${Money(p.price).format()}'),
                ),
            ],
            onChanged: (v) => setState(() => _productId = v),
          ),
          const SizedBox(height: 8),
          TextField(
            key: const Key('pickQty'),
            controller: _qty,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Quantity'),
          ),
          const SizedBox(height: 16),
          FilledButton(
            key: const Key('confirmItem'),
            onPressed: _productId == null
                ? null
                : () {
                    final p = widget.products
                        .firstWhere((x) => x.id == _productId);
                    Navigator.of(context).pop(_Line(
                      productId: p.id,
                      name: p.name,
                      unitPrice: p.price,
                      taxRateId: p.taxRateId,
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
