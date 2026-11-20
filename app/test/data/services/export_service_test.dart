import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sikabooks/data/db/app_database.dart';
import 'package:sikabooks/data/services/export_service.dart';
import 'package:sikabooks/data/services/sale_service.dart';
import 'package:sikabooks/domain/models/enums.dart';

void main() {
  test('journalCsv exports a header and every posted line', () async {
    final db = AppDatabase(NativeDatabase.memory());
    addTearDown(db.close);

    final shopId = await db
        .into(db.shops)
        .insert(ShopsCompanion.insert(businessId: 1, name: 'S'));
    final acc = await db.seedChartOfAccounts(shopId);
    final cashId = acc['1000']!;
    final vatId = (await (db.select(db.taxRates)
              ..where((t) => t.name.equals('VAT')))
            .getSingle())
        .id;
    final partyId = await db.into(db.parties).insert(PartiesCompanion.insert(
        shopId: shopId, partyKind: PartyKind.customer, name: 'C'));
    final productId = await db.into(db.products).insert(ProductsCompanion.insert(
          shopId: shopId,
          sku: 'M',
          name: 'Milo',
          unit: 'each',
          cost: const Value(900),
          price: const Value(1200),
          taxRateId: Value(vatId),
        ));

    await SaleService(db).recordCashSale(
      shopId: shopId,
      partyId: partyId,
      methodAccountId: cashId,
      date: DateTime(2026, 1, 5),
      lines: [
        SaleLineInput(
          productId: productId,
          description: 'Milo',
          qtyThousandths: 2000,
          unitPricePesewas: 1200,
          taxRateId: vatId,
        ),
      ],
    );

    final csv = await ExportService(db).journalCsv(shopId);
    final rows = csv.trim().split('\n');
    expect(rows.first,
        'date,number,memo,account_code,account_name,debit,credit');
    expect(rows.length, 6); // header + 5 journal lines
    expect(csv.contains('Cash sale'), isTrue);
    expect(csv.contains('27.60'), isTrue); // cash debit 2760
    expect(csv.contains('1000'), isTrue); // cash account code
  });
}
