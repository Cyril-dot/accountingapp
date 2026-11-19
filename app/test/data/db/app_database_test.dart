import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sikabooks/data/db/app_database.dart';
import 'package:sikabooks/domain/models/enums.dart';

void main() {
  late AppDatabase db;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
  });

  tearDown(() async {
    await db.close();
  });

  test('seeds tax rates, chart of accounts and payment methods', () async {
    final rates = await db.select(db.taxRates).get();
    expect(rates.length, 7);
    expect(rates.any((r) => r.name == 'VAT' && r.rateBp == 1500), isTrue);
    expect(
        rates.any((r) => r.name == 'NHIL' && r.isLevy && r.rateBp == 250), isTrue);

    final shopId = await db
        .into(db.shops)
        .insert(ShopsCompanion.insert(businessId: 1, name: 'Test Shop'));

    final byCode = await db.seedChartOfAccounts(shopId);
    expect(byCode.length, 17);
    expect(byCode.containsKey('1000'), isTrue);
    expect(byCode.containsKey('4000'), isTrue);

    await db.seedPaymentMethods(shopId, byCode);
    final methods = await db.select(db.paymentMethods).get();
    expect(methods.length, 5);
    expect(
        methods.any((m) => m.name == 'Cash' && m.accountId == byCode['1000']),
        isTrue);
  });

  test('persists a product with integer pesewas', () async {
    final shopId = await db
        .into(db.shops)
        .insert(ShopsCompanion.insert(businessId: 1, name: 'S'));
    final vat = await (db.select(db.taxRates)
          ..where((t) => t.name.equals('VAT')))
        .getSingle();

    final productId = await db.into(db.products).insert(
          ProductsCompanion.insert(
            shopId: shopId,
            sku: 'A1',
            name: 'Milo 400g',
            unit: 'each',
            price: const Value(1250),
            cost: const Value(900),
            taxRateId: Value(vat.id),
          ),
        );

    final p = await (db.select(db.products)
          ..where((t) => t.id.equals(productId)))
        .getSingle();
    expect(p.price, 1250);
    expect(p.cost, 900);
  });

  test('journal entry balances in the database', () async {
    final shopId = await db
        .into(db.shops)
        .insert(ShopsCompanion.insert(businessId: 1, name: 'S'));
    final byCode = await db.seedChartOfAccounts(shopId);

    final entryId = await db.into(db.journalEntries).insert(
          JournalEntriesCompanion.insert(
            shopId: shopId,
            number: 'JE-1',
            date: DateTime(2026, 1, 1),
            memo: 'Cash sale',
            refType: 'sale',
            journalStatus: JournalStatus.posted,
          ),
        );

    await db.into(db.journalLines).insert(JournalLinesCompanion.insert(
          entryId: entryId,
          accountId: byCode['1000']!,
          debit: const Value(1150),
        ));
    await db.into(db.journalLines).insert(JournalLinesCompanion.insert(
          entryId: entryId,
          accountId: byCode['4000']!,
          credit: const Value(1150),
        ));

    final lines = await (db.select(db.journalLines)
          ..where((l) => l.entryId.equals(entryId)))
        .get();
    final debit = lines.fold<int>(0, (s, l) => s + l.debit);
    final credit = lines.fold<int>(0, (s, l) => s + l.credit);
    expect(debit, 1150);
    expect(credit, 1150);
    expect(debit, credit);
  });
}
