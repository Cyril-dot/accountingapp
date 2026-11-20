import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sikabooks/data/db/app_database.dart';
import 'package:sikabooks/data/services/purchase_service.dart';
import 'package:sikabooks/data/services/report_service.dart';
import 'package:sikabooks/data/services/sale_service.dart';
import 'package:sikabooks/domain/models/enums.dart';

void main() {
  late AppDatabase db;
  late ReportService reports;
  late int shopId;
  late int productId;
  late int customerId;
  late int supplierId;
  late int cashId;
  late int vatOutputId;
  late int vatInputId;

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    reports = ReportService(db);
    shopId = await db
        .into(db.shops)
        .insert(ShopsCompanion.insert(businessId: 1, name: 'S'));
    final acc = await db.seedChartOfAccounts(shopId);
    cashId = acc['1000']!;
    customerId = await db.into(db.parties).insert(PartiesCompanion.insert(
        shopId: shopId, partyKind: PartyKind.customer, name: 'Customer'));
    supplierId = await db.into(db.parties).insert(PartiesCompanion.insert(
        shopId: shopId, partyKind: PartyKind.supplier, name: 'Supplier'));
    vatOutputId =
        (await (db.select(db.taxRates)..where((t) => t.name.equals('VAT')))
                .getSingle())
            .id;
    vatInputId = (await (db.select(db.taxRates)
              ..where((t) => t.name.equals('VAT Input')))
            .getSingle())
        .id;
    productId = await db.into(db.products).insert(ProductsCompanion.insert(
          shopId: shopId,
          sku: 'MILO',
          name: 'Milo 400g',
          unit: 'each',
          cost: const Value(900),
          price: const Value(1200),
          taxRateId: Value(vatOutputId),
        ));
  });

  tearDown(() async => db.close());

  test('monthlyVatSummary groups output and input tax by month', () async {
    await SaleService(db).recordCashSale(
      shopId: shopId,
      partyId: customerId,
      methodAccountId: cashId,
      date: DateTime(2026, 1, 5),
      lines: [
        SaleLineInput(
            productId: productId,
            description: 'Milo',
            qtyThousandths: 1000,
            unitPricePesewas: 1200,
            taxRateId: vatOutputId),
      ],
    );
    await PurchaseService(db).recordCashPurchase(
      shopId: shopId,
      supplierId: supplierId,
      methodAccountId: cashId,
      date: DateTime(2026, 1, 6),
      lines: [
        PurchaseLineInput(
            productId: productId,
            description: 'Milo',
            qtyThousandths: 1000,
            unitCostPesewas: 900,
            taxRateId: vatInputId),
      ],
    );

    final rows = await reports.monthlyVatSummary(shopId);
    expect(rows, hasLength(1));
    expect(rows.single.year, 2026);
    expect(rows.single.month, 1);
    expect(rows.single.outputVat, 180); // 15% of 1200
    expect(rows.single.inputVat, 135); // 15% of 900
    expect(rows.single.netVat, 45);
  });

  test('lowStock and expiringSoon flag the right products', () async {
    await db.into(db.products).insert(ProductsCompanion.insert(
          shopId: shopId,
          sku: 'A',
          name: 'Low item',
          unit: 'each',
          stockOnHand: const Value(3),
          reorderLevel: const Value(5),
        ));
    await db.into(db.products).insert(ProductsCompanion.insert(
          shopId: shopId,
          sku: 'B',
          name: 'No reorder level',
          unit: 'each',
          stockOnHand: const Value(0),
        ));
    await db.into(db.products).insert(ProductsCompanion.insert(
          shopId: shopId,
          sku: 'C',
          name: 'Expiring item',
          unit: 'each',
          expiresAt: Value(DateTime.now().add(const Duration(days: 10))),
        ));

    final low = await reports.lowStock(shopId);
    expect(low.map((p) => p.name), contains('Low item'));
    expect(low.map((p) => p.name), isNot(contains('No reorder level')));

    final expiring = await reports.expiringSoon(shopId, days: 30);
    expect(expiring.map((p) => p.name), contains('Expiring item'));
  });
}
