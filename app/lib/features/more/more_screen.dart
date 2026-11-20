import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app_providers.dart';
import '../../domain/models/enums.dart';
import '../invoices/invoices_screen.dart';
import '../parties/parties_screen.dart';
import '../payments/payment_screen.dart';
import '../purchases/purchase_screen.dart';
import '../reports/ledger_screen.dart';
import '../reports/receivables_screen.dart';
import '../reports/reports_screen.dart';
import '../settings/backup_screen.dart';
import '../settings/users_screen.dart';

class MoreScreen extends ConsumerWidget {
  final int shopId;
  const MoreScreen({super.key, required this.shopId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final isOwner = user?.role == UserRole.owner;
    final isCashier = user?.role == UserRole.cashier;

    void push(Widget screen) =>
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));

    final items = <(IconData, String, void Function())>[
      (Icons.description_outlined, 'Invoices',
          () => push(InvoicesScreen(shopId: shopId))),
      if (!isCashier)
        (Icons.people_outline, 'Customers & Suppliers',
            () => push(PartiesScreen(shopId: shopId))),
      if (!isCashier)
        (Icons.shopping_cart_outlined, 'Purchases',
            () => push(PurchaseScreen(shopId: shopId))),
      if (!isCashier)
        (Icons.payments_outlined, 'Payments',
            () => push(PaymentScreen(shopId: shopId))),
      if (!isCashier)
        (Icons.account_balance_wallet_outlined, 'Money owed',
            () => push(ReceivablesScreen(shopId: shopId))),
      if (!isCashier)
        (Icons.receipt_outlined, 'Ledger',
            () => push(LedgerScreen(shopId: shopId))),
      if (!isCashier)
        (Icons.bar_chart, 'Reports', () => push(ReportsScreen(shopId: shopId))),
      if (isOwner)
        (Icons.group_outlined, 'Users', () => push(UsersScreen(shopId: shopId))),
      if (!isCashier)
        (Icons.backup_outlined, 'Backup & export',
            () => push(BackupScreen(shopId: shopId))),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('More')),
      body: ListView(
        children: [
          for (final (icon, label, onTap) in items)
            ListTile(
              leading: Icon(icon),
              title: Text(label),
              trailing: const Icon(Icons.chevron_right),
              onTap: onTap,
            ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Sign out'),
            onTap: () => ref.read(currentUserProvider.notifier).signOut(),
          ),
        ],
      ),
    );
  }
}
