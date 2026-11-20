import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data/db/app_database.dart';
import 'data/services/expense_service.dart';
import 'data/services/onboarding_service.dart';
import 'data/services/payment_service.dart';
import 'data/services/purchase_service.dart';
import 'data/services/report_service.dart';
import 'data/services/sale_service.dart';

/// The single app database. Tests override this with an in-memory database.
final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});

final onboardingServiceProvider =
    Provider((ref) => OnboardingService(ref.watch(databaseProvider)));
final saleServiceProvider =
    Provider((ref) => SaleService(ref.watch(databaseProvider)));
final purchaseServiceProvider =
    Provider((ref) => PurchaseService(ref.watch(databaseProvider)));
final paymentServiceProvider =
    Provider((ref) => PaymentService(ref.watch(databaseProvider)));
final expenseServiceProvider =
    Provider((ref) => ExpenseService(ref.watch(databaseProvider)));
final reportServiceProvider =
    Provider((ref) => ReportService(ref.watch(databaseProvider)));

/// The active shop, or null until onboarding is completed.
final currentShopProvider = FutureProvider<Shop?>((ref) async {
  return ref.watch(onboardingServiceProvider).currentShop();
});

typedef DashboardData = ({
  int sales,
  int purchases,
  int paymentsReceived,
  int paymentsMade,
  int expenses,
  int profit,
  int cash,
  int bank,
  int momo,
});

/// This month's dashboard figures for a shop.
final dashboardProvider = FutureProvider.family<DashboardData, int>(
  (ref, shopId) async {
    final now = DateTime.now();
    final from = DateTime(now.year, now.month, 1);
    return ref
        .watch(reportServiceProvider)
        .dashboard(shopId, from: from, to: now);
  },
);
