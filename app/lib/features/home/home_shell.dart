import 'package:flutter/material.dart';

import '../dashboard/dashboard_screen.dart';
import '../expenses/expense_screen.dart';
import '../inventory/inventory_screen.dart';
import '../more/more_screen.dart';
import '../sales/sales_screen.dart';

class HomeShell extends StatefulWidget {
  final int shopId;
  const HomeShell({super.key, required this.shopId});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      DashboardScreen(shopId: widget.shopId),
      SalesScreen(shopId: widget.shopId),
      ExpenseScreen(shopId: widget.shopId),
      InventoryScreen(shopId: widget.shopId),
      MoreScreen(shopId: widget.shopId),
    ];
    return Scaffold(
      body: IndexedStack(index: _index, children: screens),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.point_of_sale_outlined),
            selectedIcon: Icon(Icons.point_of_sale),
            label: 'Sell',
          ),
          NavigationDestination(
            icon: Icon(Icons.receipt_long_outlined),
            selectedIcon: Icon(Icons.receipt_long),
            label: 'Expenses',
          ),
          NavigationDestination(
            icon: Icon(Icons.inventory_2_outlined),
            selectedIcon: Icon(Icons.inventory_2),
            label: 'Stock',
          ),
          NavigationDestination(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
