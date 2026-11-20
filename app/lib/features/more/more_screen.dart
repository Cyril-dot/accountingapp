import 'package:flutter/material.dart';

import '../invoices/invoices_screen.dart';
import '../parties/parties_screen.dart';
import '../payments/payment_screen.dart';
import '../purchases/purchase_screen.dart';
import '../reports/ledger_screen.dart';
import '../reports/receivables_screen.dart';
import '../reports/reports_screen.dart';

class MoreScreen extends StatelessWidget {
  final int shopId;
  const MoreScreen({super.key, required this.shopId});

  @override
  Widget build(BuildContext context) {
    final items = [
      (Icons.people_outline, 'Customers & Suppliers',
          () => PartiesScreen(shopId: shopId)),
      (Icons.shopping_cart_outlined, 'Purchases',
          () => PurchaseScreen(shopId: shopId)),
      (Icons.payments_outlined, 'Payments', () => PaymentScreen(shopId: shopId)),
      (Icons.description_outlined, 'Invoices',
          () => InvoicesScreen(shopId: shopId)),
      (Icons.account_balance_wallet_outlined, 'Money owed',
          () => ReceivablesScreen(shopId: shopId)),
      (Icons.receipt_outlined, 'Ledger', () => LedgerScreen(shopId: shopId)),
      (Icons.bar_chart, 'Reports', () => ReportsScreen(shopId: shopId)),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('More')),
      body: ListView(
        children: [
          for (final (icon, label, screen) in items)
            ListTile(
              leading: Icon(icon),
              title: Text(label),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => screen()),
              ),
            ),
        ],
      ),
    );
  }
}
