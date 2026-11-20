import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app_providers.dart';
import '../../core/money.dart';

class DashboardScreen extends ConsumerWidget {
  final int shopId;
  const DashboardScreen({super.key, required this.shopId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dash = ref.watch(dashboardProvider(shopId));
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: dash.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Failed to load: $e')),
        data: (d) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _StatCard(label: 'Sales', amount: d.sales, positive: true),
            _StatCard(label: 'Purchases', amount: d.purchases),
            _StatCard(label: 'Received', amount: d.paymentsReceived, positive: true),
            _StatCard(label: 'Paid out', amount: d.paymentsMade),
            _StatCard(label: 'Expenses', amount: d.expenses),
            _StatCard(label: 'Profit', amount: d.profit, positive: d.profit >= 0),
            const Divider(height: 32),
            Text('Balances', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            _StatCard(label: 'Cash', amount: d.cash, positive: d.cash >= 0),
            _StatCard(label: 'Bank', amount: d.bank, positive: d.bank >= 0),
            _StatCard(label: 'Mobile money', amount: d.momo, positive: d.momo >= 0),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final int amount;
  final bool positive;

  const _StatCard({
    required this.label,
    required this.amount,
    this.positive = true,
  });

  @override
  Widget build(BuildContext context) {
    final color = positive
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.error;
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(label),
        trailing: Text(
          Money(amount).format(),
          key: Key('stat-$label'),
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: color, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
