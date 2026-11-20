import 'package:drift/drift.dart';

import '../../domain/models/enums.dart';
import '../db/app_database.dart';

/// Creates the initial business, shop, chart of accounts, payment methods and
/// owner user in one transaction, so onboarding never half-applies.
class OnboardingService {
  final AppDatabase db;
  OnboardingService(this.db);

  Future<int> createBusiness({
    required String businessName,
    required String shopName,
    required String ownerName,
    required String ownerPinHash,
    String? phone,
    String? address,
    String? tin,
  }) {
    return db.transaction(() async {
      final businessId = await db.into(db.businesses).insert(
            BusinessesCompanion.insert(
              name: businessName,
              phone: Value(phone),
              address: Value(address),
              tin: Value(tin),
            ),
          );
      final shopId = await db.into(db.shops).insert(
            ShopsCompanion.insert(businessId: businessId, name: shopName),
          );
      final byCode = await db.seedChartOfAccounts(shopId);
      await db.seedPaymentMethods(shopId, byCode);
      await db.into(db.users).insert(
            UsersCompanion.insert(
              shopId: shopId,
              fullName: ownerName,
              pinHash: ownerPinHash,
              role: UserRole.owner,
            ),
          );
      return shopId;
    });
  }

  /// The single active shop, or null before onboarding completes.
  Future<Shop?> currentShop() async {
    final rows = await (db.select(db.shops)
          ..where((s) => s.isActive.equals(true)))
        .get();
    return rows.isEmpty ? null : rows.first;
  }
}
