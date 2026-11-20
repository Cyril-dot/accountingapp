import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app_providers.dart';
import '../../core/money.dart';

class InventoryScreen extends ConsumerWidget {
  final int shopId;
  const InventoryScreen({super.key, required this.shopId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productsProvider(shopId));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory'),
        actions: [
          IconButton(
            key: const Key('addProduct'),
            icon: const Icon(Icons.add),
            onPressed: () => _showAddProduct(context, ref),
          ),
        ],
      ),
      body: products.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (items) {
          if (items.isEmpty) {
            return const Center(child: Text('No products yet. Tap + to add.'));
          }
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, i) {
              final p = items[i];
              final low = p.reorderLevel > 0 && p.stockOnHand <= p.reorderLevel;
              return ListTile(
                title: Text(p.name),
                subtitle: Text('Stock: ${_qty(p.stockOnHand)}'),
                trailing: Text(
                  Money(p.price).format(),
                  style: TextStyle(
                    color: low
                        ? Theme.of(context).colorScheme.error
                        : Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _showAddProduct(BuildContext context, WidgetRef ref) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => _AddProductSheet(shopId: shopId),
    );
    ref.invalidate(productsProvider(shopId));
  }

  static String _qty(int thousandths) {
    final whole = thousandths ~/ 1000;
    final frac = thousandths % 1000;
    if (frac == 0) return '$whole';
    final s = frac.toString().padLeft(3, '0').replaceAll(RegExp(r'0+$'), '');
    return '$whole.$s';
  }
}

class _AddProductSheet extends ConsumerStatefulWidget {
  final int shopId;
  const _AddProductSheet({required this.shopId});

  @override
  ConsumerState<_AddProductSheet> createState() => _AddProductSheetState();
}

class _AddProductSheetState extends ConsumerState<_AddProductSheet> {
  final _name = TextEditingController();
  final _unit = TextEditingController(text: 'each');
  final _cost = TextEditingController();
  final _price = TextEditingController();
  bool _busy = false;

  @override
  void dispose() {
    _name.dispose();
    _unit.dispose();
    _cost.dispose();
    _price.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (_name.text.trim().isEmpty) return;
    setState(() => _busy = true);
    try {
      await ref.read(catalogRepositoryProvider).addProduct(
            shopId: widget.shopId,
            name: _name.text.trim(),
            unit: _unit.text.trim().isEmpty ? 'each' : _unit.text.trim(),
            cost: _cost.text.trim().isEmpty ? 0 : Money.parse(_cost.text).pesewas,
            price: _price.text.trim().isEmpty ? 0 : Money.parse(_price.text).pesewas,
          );
      if (mounted) Navigator.of(context).pop();
    } finally {
      if (mounted) setState(() => _busy = false);
    }
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
          Text('Add product', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          TextField(
            key: const Key('productName'),
            controller: _name,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          const SizedBox(height: 8),
          TextField(
            key: const Key('productUnit'),
            controller: _unit,
            decoration: const InputDecoration(labelText: 'Unit'),
          ),
          const SizedBox(height: 8),
          TextField(
            key: const Key('productCost'),
            controller: _cost,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Cost (GH₵)'),
          ),
          const SizedBox(height: 8),
          TextField(
            key: const Key('productPrice'),
            controller: _price,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Price (GH₵)'),
          ),
          const SizedBox(height: 16),
          FilledButton(
            key: const Key('saveProduct'),
            onPressed: _busy ? null : _save,
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
