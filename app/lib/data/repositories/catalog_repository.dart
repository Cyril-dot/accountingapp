import 'package:drift/drift.dart';

import '../../domain/models/enums.dart';
import '../db/app_database.dart';

/// Master-data lookups and inserts (parties, products, accounts, payment
/// methods, tax rates). Keeps the UI layer free of raw drift queries.
class CatalogRepository {
  final AppDatabase db;
  CatalogRepository(this.db);

  Future<List<Product>> products(int shopId) {
    final q = db.select(db.products)
      ..where((p) => p.shopId.equals(shopId))
      ..orderBy([(p) => OrderingTerm.asc(p.name)]);
    return q.get();
  }

  Future<int> addProduct({
    required int shopId,
    required String name,
    required String unit,
    int cost = 0,
    int price = 0,
    int? taxRateId,
    String sku = '',
    String? barcode,
    int reorderLevel = 0,
  }) {
    return db.into(db.products).insert(
          ProductsCompanion.insert(
            shopId: shopId,
            sku: sku.isEmpty ? _skuFallback() : sku,
            barcode: Value(barcode),
            name: name,
            unit: unit,
            cost: Value(cost),
            price: Value(price),
            taxRateId: Value(taxRateId),
            reorderLevel: Value(reorderLevel),
          ),
        );
  }

  Future<List<Party>> parties(int shopId) {
    final q = db.select(db.parties)
      ..where((p) => p.shopId.equals(shopId))
      ..orderBy([(p) => OrderingTerm.asc(p.name)]);
    return q.get();
  }

  Future<int> addParty({
    required int shopId,
    required String name,
    required PartyKind kind,
    String? phone,
    int? creditDays,
  }) {
    return db.into(db.parties).insert(
          PartiesCompanion.insert(
            shopId: shopId,
            partyKind: kind,
            name: name,
            phone: Value(phone),
            creditDays: Value(creditDays),
          ),
        );
  }

  Future<List<Account>> accounts(int shopId) {
    final q = db.select(db.accounts)
      ..where((a) => a.shopId.equals(shopId))
      ..orderBy([(a) => OrderingTerm.asc(a.code)]);
    return q.get();
  }

  Future<List<PaymentMethod>> paymentMethods(int shopId) {
    final q = db.select(db.paymentMethods)
      ..where((m) => m.shopId.equals(shopId))
      ..orderBy([(m) => OrderingTerm.asc(m.name)]);
    return q.get();
  }

  Future<List<TaxRateRow>> taxRates() => db.select(db.taxRates).get();

  /// Returns the id of a "Walk-in customer" party, creating it on first use.
  Future<int> findOrCreateWalkInCustomer(int shopId) async {
    final rows = await (db.select(db.parties)
          ..where((p) => p.shopId.equals(shopId))
          ..where((p) => p.name.equals('Walk-in customer')))
        .get();
    if (rows.isNotEmpty) return rows.first.id;
    return addParty(
        shopId: shopId, name: 'Walk-in customer', kind: PartyKind.customer);
  }

  String _skuFallback() =>
      'SKU-${DateTime.now().millisecondsSinceEpoch.toRadixString(36)}';
}
