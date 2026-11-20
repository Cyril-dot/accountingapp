import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sikabooks/app_providers.dart';
import 'package:sikabooks/core/pin_hasher.dart';
import 'package:sikabooks/data/db/app_database.dart';
import 'package:sikabooks/data/services/common.dart';
import 'package:sikabooks/data/services/onboarding_service.dart';
import 'package:sikabooks/data/services/sale_service.dart';
import 'package:sikabooks/domain/models/enums.dart';
import 'package:sikabooks/features/dashboard/dashboard_screen.dart';
import 'package:sikabooks/main.dart';

Future<void> settle(WidgetTester tester) async {
  await tester.runAsync(() async {
    await Future<void>.delayed(const Duration(milliseconds: 30));
  });
  await tester.pump();
}

void main() {
  testWidgets('onboarding creates the shop and shows the dashboard',
      (tester) async {
    final db = AppDatabase(NativeDatabase.memory());
    addTearDown(db.close);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [databaseProvider.overrideWith((ref) => db)],
        child: const SikaBooksApp(),
      ),
    );
    await settle(tester);

    expect(find.text('Set up SikaBooks'), findsOneWidget);

    await tester.enterText(
        find.byKey(const Key('businessName')), 'Adjoa Store');
    await tester.enterText(find.byKey(const Key('ownerName')), 'Adjoa');
    await tester.enterText(find.byKey(const Key('pin')), '1234');
    await tester.enterText(find.byKey(const Key('pinConfirm')), '1234');
    await tester.ensureVisible(find.byKey(const Key('startButton')));
    await tester.tap(find.byKey(const Key('startButton')));
    await tester.pump();
    await settle(tester);
    await tester.pumpAndSettle();

    // The PIN lock appears. A wrong PIN stays locked, the right one unlocks.
    expect(find.byKey(const Key('pinField')), findsOneWidget);
    await tester.enterText(find.byKey(const Key('pinField')), '0000');
    await tester.tap(find.byKey(const Key('unlockButton')));
    await settle(tester);
    await tester.pumpAndSettle();
    expect(find.text('Wrong PIN'), findsOneWidget);

    await tester.enterText(find.byKey(const Key('pinField')), '1234');
    await tester.tap(find.byKey(const Key('unlockButton')));
    await settle(tester);
    await tester.pumpAndSettle();

    expect(find.text('Dashboard'), findsOneWidget);

    // The database now holds one business, shop, owner, chart and methods.
    final businesses = await db.select(db.businesses).get();
    final shops = await db.select(db.shops).get();
    final accounts = await db.select(db.accounts).get();
    final users = await db.select(db.users).get();
    final methods = await db.select(db.paymentMethods).get();
    expect(businesses, hasLength(1));
    expect(shops, hasLength(1));
    expect(accounts, hasLength(17));
    expect(users, hasLength(1));
    expect(methods, hasLength(5));

    // The stored PIN is never the plaintext.
    expect(users.first.pinHash.contains('1234'), isFalse);
    expect(PinHasher.verify('1234', users.first.pinHash), isTrue);
  });

  testWidgets('dashboard shows the current month figures', (tester) async {
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
      final partyId = await db.into(db.parties).insert(PartiesCompanion.insert(
            shopId: shopId,
            partyKind: PartyKind.customer,
            name: 'Walk-in',
          ));
      final productId = await db.into(db.products).insert(ProductsCompanion.insert(
            shopId: shopId,
            sku: 'MILO',
            name: 'Milo 400g',
            unit: 'each',
            cost: const Value(900),
            price: const Value(1200),
            taxRateId: Value(vatId),
          ));
      final acc = await accountsByCode(db, shopId);
      await SaleService(db).recordCashSale(
        shopId: shopId,
        partyId: partyId,
        methodAccountId: acc['1000']!,
        date: DateTime.now(),
        lines: [
          SaleLineInput(
            productId: productId,
            description: 'Milo 400g',
            qtyThousandths: 2000,
            unitPricePesewas: 1200,
            taxRateId: vatId,
          ),
        ],
      );
    });

    await tester.pumpWidget(
      ProviderScope(
        overrides: [databaseProvider.overrideWith((ref) => db)],
        child: MaterialApp(home: DashboardScreen(shopId: shopId)),
      ),
    );
    await settle(tester);

    final salesText =
        tester.widget<Text>(find.byKey(const Key('stat-Sales'))).data;
    expect(salesText, 'GH₵ 27.60'); // 2 × GH₵12 + 15% VAT
    final profitText =
        tester.widget<Text>(find.byKey(const Key('stat-Profit'))).data;
    expect(profitText, 'GH₵ 6.00'); // revenue 24.00 − COGS 18.00
  });
}
