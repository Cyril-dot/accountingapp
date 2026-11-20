import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app_providers.dart';
import '../../domain/models/enums.dart';
import '../dashboard/dashboard_screen.dart';
import '../expenses/expense_screen.dart';
import '../inventory/inventory_screen.dart';
import '../invoices/invoices_screen.dart';
import '../more/more_screen.dart';
import '../sales/sales_screen.dart';

class HomeShell extends ConsumerStatefulWidget {
  final int shopId;
  const HomeShell({super.key, required this.shopId});

  @override
  ConsumerState<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends ConsumerState<HomeShell> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(currentUserProvider);
    final isCashier = user?.role == UserRole.cashier;

    final tabs = isCashier
        ? <({Widget screen, IconData icon, IconData selectedIcon, String label})>[
            (
              screen: SalesScreen(shopId: widget.shopId),
              icon: Icons.point_of_sale_outlined,
              selectedIcon: Icons.point_of_sale,
              label: 'Sell',
            ),
            (
              screen: InventoryScreen(shopId: widget.shopId),
              icon: Icons.inventory_2_outlined,
              selectedIcon: Icons.inventory_2,
              label: 'Stock',
            ),
            (
              screen: InvoicesScreen(shopId: widget.shopId),
              icon: Icons.description_outlined,
              selectedIcon: Icons.description,
              label: 'Invoices',
            ),
            (
              screen: MoreScreen(shopId: widget.shopId),
              icon: Icons.more_horiz,
              selectedIcon: Icons.more_horiz,
              label: 'More',
            ),
          ]
        : <({Widget screen, IconData icon, IconData selectedIcon, String label})>[
            (
              screen: DashboardScreen(shopId: widget.shopId),
              icon: Icons.dashboard_outlined,
              selectedIcon: Icons.dashboard,
              label: 'Home',
            ),
            (
              screen: SalesScreen(shopId: widget.shopId),
              icon: Icons.point_of_sale_outlined,
              selectedIcon: Icons.point_of_sale,
              label: 'Sell',
            ),
            (
              screen: ExpenseScreen(shopId: widget.shopId),
              icon: Icons.receipt_long_outlined,
              selectedIcon: Icons.receipt_long,
              label: 'Expenses',
            ),
            (
              screen: InventoryScreen(shopId: widget.shopId),
              icon: Icons.inventory_2_outlined,
              selectedIcon: Icons.inventory_2,
              label: 'Stock',
            ),
            (
              screen: MoreScreen(shopId: widget.shopId),
              icon: Icons.more_horiz,
              selectedIcon: Icons.more_horiz,
              label: 'More',
            ),
          ];

    final index = _index < tabs.length ? _index : 0;
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: [for (final t in tabs) t.screen],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: [
          for (final t in tabs)
            NavigationDestination(
              icon: Icon(t.icon),
              selectedIcon: Icon(t.selectedIcon),
              label: t.label,
            ),
        ],
      ),
    );
  }
}
