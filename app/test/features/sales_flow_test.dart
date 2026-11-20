import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sikabooks/app_providers.dart';
import 'package:sikabooks/core/pin_hasher.dart';
import 'package:sikabooks/data/db/app_database.dart';
import 'package:sikabooks/data/services/onboarding_service.dart';
import 'package:sikabooks/features/home/home_shell.dart';

Future<void> settle(WidgetTester tester) async {
  await tester.runAsync(() async {
    await Future<void>.delayed(const Duration(milliseconds: 30));
  });
  await tester.pump();
}

Future<void> selectDropdown(
    WidgetTester tester, Key key, String itemText) async {
  await tester.tap(find.byKey(key));
  await tester.pumpAndSettle();
  await tester.tap(find.text(itemText).last);
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('a sale can be recorded from the Sell tab', (tester) async {
    final db = AppDatabase(NativeDatabase.memory());
    addTearDown(db.close);

    var shopId = 0;
    await tester.runAsync(() async {
      shopId = await OnboardingService(db).createBusiness(
        businessName: 'S',
        shopName: 'S',
        ownerName: 'O',
        ownerPinHash: PinHasher.hash('1234', iterations: 10),
      );
      final vatId = (await (db.select(db.taxRates)
                ..where((t) => t.name.equals('VAT')))
              .getSingle())
          .id;
      await db.into(db.products).insert(ProductsCompanion.insert(
            shopId: shopId,
            sku: 'MILO',
            name: 'Milo 400g',
            unit: 'each',
            cost: const Value(900),
            price: const Value(1200),
            taxRateId: Value(vatId),
          ));
    });

    await tester.pumpWidget(
      ProviderScope(
        overrides: [databaseProvider.overrideWith((ref) => db)],
        child: MaterialApp(home: HomeShell(shopId: shopId)),
      ),
    );
    await settle(tester);

    // Go to the Sell tab.
    await tester.tap(find.text('Sell'));
    await settle(tester);

    // Add one item: Milo, qty 2.
    await tester.tap(find.byKey(const Key('addItem')));
    await tester.pumpAndSettle();
    await selectDropdown(tester, const Key('pickProduct'), 'Milo 400g — GH₵ 12.00');
    await tester.enterText(find.byKey(const Key('pickQty')), '2');
    await tester.tap(find.byKey(const Key('confirmItem')));
    await tester.pumpAndSettle();

    expect(find.text('Total: GH₵ 27.60'), findsOneWidget);

    // Pay with cash.
    await selectDropdown(tester, const Key('method'), 'Cash');

    await tester.tap(find.byKey(const Key('saveSale')));
    await settle(tester);
    await tester.pumpAndSettle();

    expect(find.text('Sale recorded'), findsOneWidget);

    // The sale is persisted: one invoice, stock dropped, journal balanced.
    final invoices = await db.select(db.invoices).get();
    final invoiceId = invoices.single.id;
    final product = await (db.select(db.products)
          ..where((p) => p.sku.equals('MILO')))
        .getSingle();
    final entry = await (db.select(db.journalEntries)
          ..where((e) => e.refId.equals(invoiceId)))
        .getSingle();
    final lines = await (db.select(db.journalLines)
          ..where((l) => l.entryId.equals(entry.id)))
        .get();

    expect(invoices, hasLength(1));
    expect(invoices.single.total, 2760);
    expect(product.stockOnHand, -2000); // no opening stock, sold 2
    expect(
        lines.fold<int>(0, (s, l) => s + l.debit),
        lines.fold<int>(0, (s, l) => s + l.credit)); // balanced
  });
}
