import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sikabooks/data/db/app_database.dart';
import 'package:sikabooks/data/services/expense_service.dart';
import 'package:sikabooks/data/services/payment_service.dart';
import 'package:sikabooks/data/services/purchase_service.dart';
import 'package:sikabooks/data/services/report_service.dart';
import 'package:sikabooks/data/services/sale_service.dart';
import 'package:sikabooks/domain/models/enums.dart';

void main() {
  late AppDatabase db;
  late SaleService sales;
  late PurchaseService purchases;
  late PaymentService payments;
  late ExpenseService expenses;
  late ReportService reports;
  late int shopId;
  late int customerId;
  late int supplierId;
  late int productId;
  late int vatOutputId;
  late int vatInputId;
  late Map<String, int> acc;

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    sales = SaleService(db);
    purchases = PurchaseService(db);
    payments = PaymentService(db);
    expenses = ExpenseService(db);
    reports = ReportService(db);

    shopId = await db
        .into(db.shops)
        .insert(ShopsCompanion.insert(businessId: 1, name: 'Shop'));
    acc = await db.seedChartOfAccounts(shopId);
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

  tearDown(() async {
    await db.close();
  });

  Future<Product> product() =>
      (db.select(db.products)..where((p) => p.id.equals(productId))).getSingle();

  Future<Invoice> invoice(int id) =>
      (db.select(db.invoices)..where((i) => i.id.equals(id))).getSingle();

  test('a full accounting flow keeps the books balanced', () async {
    // 1. Cash purchase: 5 units @ 900, 15% input VAT.
    await purchases.recordCashPurchase(
      shopId: shopId,
      supplierId: supplierId,
      methodAccountId: acc['1000']!,
      date: DateTime(2026, 1, 2),
      lines: [
        PurchaseLineInput(
            productId: productId,
            description: 'Milo 400g',
            qtyThousandths: 5000,
            unitCostPesewas: 900,
            taxRateId: vatInputId),
      ],
    );
    expect((await product()).stockOnHand, 5000);

    // 2. Cash sale: 2 units @ 1200.
    await sales.recordCashSale(
      shopId: shopId,
      partyId: customerId,
      methodAccountId: acc['1000']!,
      date: DateTime(2026, 1, 3),
      lines: [
        SaleLineInput(
            productId: productId,
            description: 'Milo 400g',
            qtyThousandths: 2000,
            unitPricePesewas: 1200,
            taxRateId: vatOutputId),
      ],
    );

    // 3. Credit sale: 1 unit @ 1200.
    final creditInvoiceId = await sales.recordCreditSale(
      shopId: shopId,
      partyId: customerId,
      date: DateTime(2026, 1, 4),
      lines: [
        SaleLineInput(
            productId: productId,
            description: 'Milo 400g',
            qtyThousandths: 1000,
            unitPricePesewas: 1200,
            taxRateId: vatOutputId),
      ],
    );
    expect((await product()).stockOnHand, 2000);

    // 4. Customer pays the credit sale.
    await payments.recordReceived(
      shopId: shopId,
      partyId: customerId,
      methodAccountId: acc['1000']!,
      date: DateTime(2026, 1, 5),
      amountPesewas: 1380,
      allocations: [
        PaymentAllocationInput(invoiceId: creditInvoiceId, amountPesewas: 1380),
      ],
    );
    expect((await invoice(creditInvoiceId)).invoiceStatus, InvoiceStatus.paid);

    // 5. Cash expense: 1150 with 150 input VAT.
    await expenses.recordCashExpense(
      shopId: shopId,
      expenseAccountId: acc['5100']!,
      methodAccountId: acc['1000']!,
      date: DateTime(2026, 1, 6),
      amountPesewas: 1150,
      taxInputPesewas: 150,
    );

    // Trial balance nets to zero.
    final tb = await reports.trialBalance(shopId);
    final tbSum = tb.fold<int>(0, (s, r) => s + r.balance);
    expect(tbSum, 0);

    // Profit & loss: revenue 3600, costs 3700, profit -100.
    final pl = await reports.profitAndLoss(shopId);
    expect(pl.revenue, 3600); // 2400 + 1200
    expect(pl.costs, 3700); // COGS 2700 + expense 1000
    expect(pl.profit, -100);

    // VAT: output 540, input 825, net -285.
    final vat = await reports.vatSummary(shopId);
    expect(vat.outputVat, 540); // 360 + 180
    expect(vat.inputVat, 825); // 675 + 150
    expect(vat.netVat, -285);

    // Dashboard for the whole period.
    final dash = await reports.dashboard(shopId,
        from: DateTime(2026, 1, 1), to: DateTime(2026, 1, 31));
    expect(dash.sales, 4140); // 2760 + 1380
    expect(dash.purchases, 5175);
    expect(dash.paymentsReceived, 1380);
    expect(dash.paymentsMade, 0);
    expect(dash.expenses, 1150);
    expect(dash.cash, -2185);
    expect(dash.bank, 0);
    expect(dash.momo, 0);

    // The cash ledger has four lines in date order.
    final cashLedger = await reports.ledger(shopId, acc['1000']!);
    expect(cashLedger.length, 4);
    expect(cashLedger.map((l) => l.memo).toList(),
        ['Cash purchase', 'Cash sale', 'Payment received', 'Cash expense']);
  });
}
