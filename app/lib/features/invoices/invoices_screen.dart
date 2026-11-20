import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app_providers.dart';
import '../../core/money.dart';
import '../../data/db/app_database.dart';

class InvoicesScreen extends ConsumerWidget {
  final int shopId;
  const InvoicesScreen({super.key, required this.shopId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final invoices = ref.watch(invoicesProvider(shopId));
    final parties = ref.watch(partiesProvider(shopId));

    return Scaffold(
      appBar: AppBar(title: const Text('Invoices')),
      body: invoices.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (items) {
          if (items.isEmpty) {
            return const Center(child: Text('No invoices yet.'));
          }
          final names = {
            for (final p in parties.value ?? const <Party>[]) p.id: p.name
          };
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, i) {
              final inv = items[i];
              return ListTile(
                title: Text('${inv.number} · ${names[inv.partyId] ?? '—'}'),
                subtitle: Text(
                    '${inv.invoiceKind.name} · ${_date(inv.date)} · ${inv.invoiceStatus.name}'),
                trailing: Text(
                  Money(inv.total).format(),
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              );
            },
          );
        },
      ),
    );
  }

  static String _date(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
}
