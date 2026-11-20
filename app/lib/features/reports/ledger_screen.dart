import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app_providers.dart';
import '../../core/money.dart';
import '../../data/services/report_service.dart';

class LedgerScreen extends ConsumerStatefulWidget {
  final int shopId;
  const LedgerScreen({super.key, required this.shopId});

  @override
  ConsumerState<LedgerScreen> createState() => _LedgerScreenState();
}

class _LedgerScreenState extends ConsumerState<LedgerScreen> {
  int? _accountId;
  List<LedgerLine>? _lines;
  int _opening = 0;
  bool _loading = false;

  Future<void> _select(int accountId) async {
    setState(() {
      _loading = true;
      _accountId = accountId;
      _lines = null;
    });
    final accounts =
        await ref.read(catalogRepositoryProvider).accounts(widget.shopId);
    final opening =
        accounts.firstWhere((a) => a.id == accountId).openingBalance;
    final lines =
        await ref.read(reportServiceProvider).ledger(widget.shopId, accountId);
    if (mounted) {
      setState(() {
        _opening = opening;
        _lines = lines;
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final accounts = ref.watch(accountsProvider(widget.shopId));
    return Scaffold(
      appBar: AppBar(title: const Text('Ledger')),
      body: accounts.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (list) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            DropdownButtonFormField<int>(
              key: const Key('ledgerAccount'),
              initialValue: _accountId,
              decoration: const InputDecoration(
                labelText: 'Account',
                border: OutlineInputBorder(),
              ),
              items: [
                for (final a in list)
                  DropdownMenuItem<int>(
                      value: a.id, child: Text('${a.code} · ${a.name}')),
              ],
              onChanged: (v) => _select(v!),
            ),
            const SizedBox(height: 16),
            if (_loading) const Center(child: CircularProgressIndicator()),
            if (_lines != null) _buildLedger(context),
          ],
        ),
      ),
    );
  }

  Widget _buildLedger(BuildContext context) {
    final rows = <Widget>[
      Card(
        child: ListTile(
          title: const Text('Opening balance'),
          trailing: Text(Money(_opening).format()),
        ),
      ),
    ];
    var running = _opening;
    for (final line in _lines!) {
      running += line.debit - line.credit;
      rows.add(ListTile(
        dense: true,
        contentPadding: EdgeInsets.zero,
        title: Text(line.memo),
        subtitle: Text('${line.number} · ${_date(line.date)}'),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              line.debit > 0 ? Money(line.debit).format() : Money(line.credit).format(),
              style: TextStyle(
                color: line.debit > 0
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.error,
              ),
            ),
            Text(Money(running).format(),
                style: const TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      ));
    }
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: rows);
  }

  static String _date(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
}
