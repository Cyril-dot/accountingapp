import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app_providers.dart';
import '../../domain/models/enums.dart';

class PartiesScreen extends ConsumerWidget {
  final int shopId;
  const PartiesScreen({super.key, required this.shopId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final parties = ref.watch(partiesProvider(shopId));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customers & Suppliers'),
        actions: [
          IconButton(
            key: const Key('addParty'),
            icon: const Icon(Icons.add),
            onPressed: () => _showAdd(context, ref),
          ),
        ],
      ),
      body: parties.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (items) {
          if (items.isEmpty) {
            return const Center(child: Text('No customers or suppliers yet.'));
          }
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, i) {
              final p = items[i];
              return ListTile(
                title: Text(p.name),
                subtitle: Text(p.partyKind.name),
                trailing: p.phone == null ? null : Text(p.phone!),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _showAdd(BuildContext context, WidgetRef ref) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => _AddPartySheet(shopId: shopId),
    );
    ref.invalidate(partiesProvider(shopId));
  }
}

class _AddPartySheet extends ConsumerStatefulWidget {
  final int shopId;
  const _AddPartySheet({required this.shopId});

  @override
  ConsumerState<_AddPartySheet> createState() => _AddPartySheetState();
}

class _AddPartySheetState extends ConsumerState<_AddPartySheet> {
  final _name = TextEditingController();
  final _phone = TextEditingController();
  PartyKind _kind = PartyKind.customer;
  bool _busy = false;

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (_name.text.trim().isEmpty) return;
    setState(() => _busy = true);
    try {
      await ref.read(catalogRepositoryProvider).addParty(
            shopId: widget.shopId,
            name: _name.text.trim(),
            kind: _kind,
            phone: _phone.text.trim().isEmpty ? null : _phone.text.trim(),
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
          Text('Add contact', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          SegmentedButton<PartyKind>(
            segments: const [
              ButtonSegment(value: PartyKind.customer, label: Text('Customer')),
              ButtonSegment(value: PartyKind.supplier, label: Text('Supplier')),
            ],
            selected: {_kind},
            onSelectionChanged: (s) => setState(() => _kind = s.first),
          ),
          const SizedBox(height: 12),
          TextField(
            key: const Key('partyName'),
            controller: _name,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          const SizedBox(height: 8),
          TextField(
            key: const Key('partyPhone'),
            controller: _phone,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(labelText: 'Phone (optional)'),
          ),
          const SizedBox(height: 16),
          FilledButton(
            key: const Key('saveParty'),
            onPressed: _busy ? null : _save,
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
