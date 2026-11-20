import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app_providers.dart';
import '../../core/money.dart';
import '../../domain/models/enums.dart';

class ReportsScreen extends ConsumerStatefulWidget {
  final int shopId;
  const ReportsScreen({super.key, required this.shopId});

  @override
  ConsumerState<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends ConsumerState<ReportsScreen> {
  bool _loading = true;
  int _revenue = 0;
  int _costs = 0;
  int _profit = 0;
  List<({int year, int month, int outputVat, int inputVat, int netVat})>
      _monthlyVat = [];
  List<({String code, String name, AccountType type, int balance})> _tb = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final reports = ref.read(reportServiceProvider);
    final pl = await reports.profitAndLoss(widget.shopId);
    final monthly = await reports.monthlyVatSummary(widget.shopId);
    final tb = await reports.trialBalance(widget.shopId);
    if (mounted) {
      setState(() {
        _revenue = pl.revenue;
        _costs = pl.costs;
        _profit = pl.profit;
        _monthlyVat = monthly;
        _tb = tb.where((r) => r.balance != 0).toList();
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _load,
          ),
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _section(context, 'Profit & loss', [
                  ('Revenue', _revenue),
                  ('Costs', _costs),
                  ('Profit', _profit),
                ]),
                Text('VAT summary (monthly)',
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                if (_monthlyVat.isEmpty)
                  const Text('No VAT posted yet.')
                else
                  Card(
                    child: Column(
                      children: [
                        for (final m in _monthlyVat)
                          ListTile(
                            dense: true,
                            title: Text('${_monthName(m.month)} ${m.year}'),
                            subtitle: Text(
                                'Output ${Money(m.outputVat).format()} · Input ${Money(m.inputVat).format()}'),
                            trailing: Text(
                              Money(m.netVat).format(),
                              style: TextStyle(
                                color: m.netVat >= 0
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).colorScheme.error,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                const SizedBox(height: 16),
                Text('Trial balance',
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                if (_tb.isEmpty)
                  const Text('No posted transactions yet.')
                else
                  for (final r in _tb)
                    ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      title: Text(r.name),
                      subtitle: Text(r.code),
                      trailing: Text(Money(r.balance).format()),
                    ),
              ],
            ),
    );
  }

  Widget _section(BuildContext context, String title, List<(String, int)> rows) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        Card(
          child: Column(
            children: [
              for (final (label, value) in rows)
                ListTile(
                  dense: true,
                  title: Text(label),
                  trailing: Text(Money(value).format()),
                ),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  static String _monthName(int m) => const [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec',
      ][m - 1];
}
