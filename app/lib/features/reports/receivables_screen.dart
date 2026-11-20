import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app_providers.dart';
import '../../core/money.dart';
import '../../domain/models/enums.dart';

class ReceivablesScreen extends ConsumerStatefulWidget {
  final int shopId;
  const ReceivablesScreen({super.key, required this.shopId});

  @override
  ConsumerState<ReceivablesScreen> createState() => _ReceivablesScreenState();
}

class _ReceivablesScreenState extends ConsumerState<ReceivablesScreen> {
  bool _loading = true;
  List<({int partyId, String name, PartyKind kind, int receivable, int payable})>
      _rows = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final balances =
        await ref.read(reportServiceProvider).partyBalances(widget.shopId);
    if (mounted) {
      setState(() {
        _rows = balances
            .map((b) => (
                  partyId: b.partyId,
                  name: b.name,
                  kind: b.kind,
                  receivable: b.receivable,
                  payable: b.payable,
                ))
            .toList();
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Money owed'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _load,
          ),
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _rows.isEmpty
              ? const Center(child: Text('Nothing outstanding.'))
              : ListView.builder(
                  itemCount: _rows.length,
                  itemBuilder: (context, i) {
                    final r = _rows[i];
                    final youOwe = r.payable > 0;
                    return ListTile(
                      title: Text(r.name),
                      subtitle: Text(youOwe ? 'You owe them' : 'They owe you'),
                      trailing: Text(
                        Money(youOwe ? r.payable : r.receivable).format(),
                        style: TextStyle(
                          color: youOwe
                              ? Theme.of(context).colorScheme.error
                              : Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
