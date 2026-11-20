import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sikabooks/data/db/app_database.dart';
import 'package:sikabooks/data/services/payment_service.dart';
import 'package:sikabooks/data/services/report_service.dart';
import 'package:sikabooks/data/services/sale_service.dart';
import 'package:sikabooks/domain/models/enums.dart';

void main() {
  late AppDatabase db;
  late SaleService sales;
  late PaymentService payments;
  late ReportService reports;
  late int shopId;
  late int customerId;
  late int productId;
  late int vatId;
  late int cashId;

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    sales = SaleService(db);
    payments = PaymentService(db);
    reports = ReportService(db);

    shopId = await db
        .into(db.shops)
        .insert(ShopsCompanion.insert(businessId: 1, name: 'S'));
    final acc = await db.seedChartOfAccounts(shopId);
    cashId = acc['1000']!;
    customerId = await db.into(db.parties).insert(PartiesCompanion.insert(
        shopId: shopId, partyKind: PartyKind.customer, name: 'Customer'));
    vatId =
        (await (db.select(db.taxRates)..where((t) => t.name.equals('VAT')))
                .getSingle())
            .id;
    productId = await db.into(db.products).insert(ProductsCompanion.insert(
          shopId: shopId,
          sku: 'MILO',
          name: 'Milo 400g',
          unit: 'each',
          cost: const Value(900),
          price: const Value(1200),
          taxRateId: Value(vatId),
        ));
  });

  tearDown(() async => db.close());

  test('receivable appears on credit sale and clears on payment', () async {
    final invoiceId = await sales.recordCreditSale(
      shopId: shopId,
      partyId: customerId,
      date: DateTime(2026, 1, 4),
      lines: [
        SaleLineInput(
          productId: productId,
          description: 'Milo 400g',
          qtyThousandths: 1000,
          unitPricePesewas: 1200,
          taxRateId: vatId,
        ),
      ],
    );

    var balances = await reports.partyBalances(shopId);
    expect(balances, hasLength(1));
    expect(balances.single.name, 'Customer');
    expect(balances.single.receivable, 1380); // 1200 + 15% VAT
    expect(balances.single.payable, 0);

    await payments.recordReceived(
      shopId: shopId,
      partyId: customerId,
      methodAccountId: cashId,
      date: DateTime(2026, 1, 5),
      amountPesewas: 1380,
      allocations: [
        PaymentAllocationInput(invoiceId: invoiceId, amountPesewas: 1380),
      ],
    );

    balances = await reports.partyBalances(shopId);
    expect(balances, isEmpty);
  });

  test('cash sale is settled and creates no receivable', () async {
    await sales.recordCashSale(
      shopId: shopId,
      partyId: customerId,
      methodAccountId: cashId,
      date: DateTime(2026, 1, 4),
      lines: [
        SaleLineInput(
          productId: productId,
          description: 'Milo 400g',
          qtyThousandths: 1000,
          unitPricePesewas: 1200,
          taxRateId: vatId,
        ),
      ],
    );

    final balances = await reports.partyBalances(shopId);
    expect(balances, isEmpty);
  });
}
