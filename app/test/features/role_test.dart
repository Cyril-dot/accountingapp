import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sikabooks/app_providers.dart';
import 'package:sikabooks/core/pin_hasher.dart';
import 'package:sikabooks/data/db/app_database.dart';
import 'package:sikabooks/data/services/auth_service.dart';
import 'package:sikabooks/data/services/onboarding_service.dart';
import 'package:sikabooks/domain/models/enums.dart';
import 'package:sikabooks/main.dart';

Future<void> settle(WidgetTester tester) async {
  await tester.runAsync(() async {
    await Future<void>.delayed(const Duration(milliseconds: 30));
  });
  await tester.pump();
}

void main() {
  testWidgets('cashier sees a restricted shell without profit/reports',
      (tester) async {
    final db = AppDatabase(NativeDatabase.memory());
    addTearDown(db.close);

    var shopId = 0;
    await tester.runAsync(() async {
      shopId = await OnboardingService(db).createBusiness(
        businessName: 'S',
        shopName: 'S',
        ownerName: 'Owner',
        ownerPinHash: PinHasher.hash('1234', iterations: 10),
      );
      await AuthService(db).addUser(
        shopId: shopId,
        fullName: 'Cashier',
        pinHash: PinHasher.hash('9999', iterations: 10),
        role: UserRole.cashier,
      );
    });

    await tester.pumpWidget(
      ProviderScope(
        overrides: [databaseProvider.overrideWith((ref) => db)],
        child: const SikaBooksApp(),
      ),
    );
    await settle(tester);

    await tester.enterText(find.byKey(const Key('pinField')), '9999');
    await tester.tap(find.byKey(const Key('unlockButton')));
    await settle(tester);
    await tester.pumpAndSettle();

    // Cashier: can sell and see invoices/stock, but no Home (profit) or
    // Expenses tab.
    expect(find.text('Sell'), findsOneWidget);
    expect(find.text('Home'), findsNothing);
    expect(find.text('Expenses'), findsNothing);
  });
}
