import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app_providers.dart';
import '../../core/pin_hasher.dart';
import '../../domain/models/enums.dart';

class UsersScreen extends ConsumerWidget {
  final int shopId;
  const UsersScreen({super.key, required this.shopId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(usersProvider(shopId));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        actions: [
          IconButton(
            key: const Key('addUser'),
            icon: const Icon(Icons.add),
            onPressed: () => _showAdd(context, ref),
          ),
        ],
      ),
      body: users.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (items) => ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, i) {
            final u = items[i];
            return ListTile(
              title: Text(u.fullName),
              subtitle: Text(u.role.name),
              trailing: u.isActive
                  ? null
                  : const Icon(Icons.block, color: Colors.grey),
            );
          },
        ),
      ),
    );
  }

  Future<void> _showAdd(BuildContext context, WidgetRef ref) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => _AddUserSheet(shopId: shopId),
    );
    ref.invalidate(usersProvider(shopId));
  }
}

class _AddUserSheet extends ConsumerStatefulWidget {
  final int shopId;
  const _AddUserSheet({required this.shopId});

  @override
  ConsumerState<_AddUserSheet> createState() => _AddUserSheetState();
}

class _AddUserSheetState extends ConsumerState<_AddUserSheet> {
  final _name = TextEditingController();
  final _pin = TextEditingController();
  final _pinConfirm = TextEditingController();
  UserRole _role = UserRole.cashier;
  bool _busy = false;

  @override
  void dispose() {
    _name.dispose();
    _pin.dispose();
    _pinConfirm.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (_name.text.trim().isEmpty ||
        _pin.text.length < 4 ||
        _pin.text != _pinConfirm.text) {
      return;
    }
    setState(() => _busy = true);
    try {
      await ref.read(authServiceProvider).addUser(
            shopId: widget.shopId,
            fullName: _name.text.trim(),
            pinHash: PinHasher.hash(_pin.text),
            role: _role,
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
          Text('Add user', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          TextField(
            key: const Key('userName'),
            controller: _name,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          const SizedBox(height: 8),
          SegmentedButton<UserRole>(
            segments: const [
              ButtonSegment(value: UserRole.cashier, label: Text('Cashier')),
              ButtonSegment(
                  value: UserRole.accountant, label: Text('Accountant')),
              ButtonSegment(value: UserRole.owner, label: Text('Owner')),
            ],
            selected: {_role},
            onSelectionChanged: (s) => setState(() => _role = s.first),
          ),
          const SizedBox(height: 8),
          TextField(
            key: const Key('userPin'),
            controller: _pin,
            obscureText: true,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'PIN (4+ digits)'),
          ),
          const SizedBox(height: 8),
          TextField(
            key: const Key('userPinConfirm'),
            controller: _pinConfirm,
            obscureText: true,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Confirm PIN'),
          ),
          const SizedBox(height: 16),
          FilledButton(
            key: const Key('saveUser'),
            onPressed: _busy ? null : _save,
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
