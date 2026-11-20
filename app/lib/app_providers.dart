import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data/db/app_database.dart';
import 'data/repositories/catalog_repository.dart';
import 'data/services/auth_service.dart';
import 'data/services/expense_service.dart';
import 'data/services/export_service.dart';
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
final authServiceProvider =
    Provider((ref) => AuthService(ref.watch(databaseProvider)));
final exportServiceProvider =
    Provider((ref) => ExportService(ref.watch(databaseProvider)));

/// The currently signed-in user (null while locked). Drives role-based UI.
class CurrentUser extends Notifier<User?> {
  @override
  User? build() => null;

  void signIn(User user) => state = user;
  void signOut() => state = null;
}

final currentUserProvider = NotifierProvider<CurrentUser, User?>(CurrentUser.new);

final usersProvider = FutureProvider.family<List<User>, int>(
  (ref, shopId) => ref.watch(authServiceProvider).users(shopId),
);
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

final catalogRepositoryProvider =
    Provider((ref) => CatalogRepository(ref.watch(databaseProvider)));

/// The active shop, or null until onboarding is completed.
final currentShopProvider = FutureProvider<Shop?>((ref) async {
  return ref.watch(onboardingServiceProvider).currentShop();
});

final productsProvider = FutureProvider.family<List<Product>, int>(
  (ref, shopId) => ref.watch(catalogRepositoryProvider).products(shopId),
);

final partiesProvider = FutureProvider.family<List<Party>, int>(
  (ref, shopId) => ref.watch(catalogRepositoryProvider).parties(shopId),
);

final accountsProvider = FutureProvider.family<List<Account>, int>(
  (ref, shopId) => ref.watch(catalogRepositoryProvider).accounts(shopId),
);

final paymentMethodsProvider = FutureProvider.family<List<PaymentMethod>, int>(
  (ref, shopId) =>
      ref.watch(catalogRepositoryProvider).paymentMethods(shopId),
);

final taxRatesProvider = FutureProvider<List<TaxRateRow>>(
  (ref) => ref.watch(catalogRepositoryProvider).taxRates(),
);

final invoicesProvider = FutureProvider.family<List<Invoice>, int>(
  (ref, shopId) => ref.watch(catalogRepositoryProvider).invoices(shopId),
);

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
