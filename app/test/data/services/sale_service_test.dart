import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sikabooks/data/db/app_database.dart';
import 'package:sikabooks/data/services/sale_service.dart';
import 'package:sikabooks/domain/models/enums.dart';

void main() {
  late AppDatabase db;
  late SaleService service;
  late int shopId;
  late int cashAccountId;
  late int partyId;
  late int vatRateId;
  late Map<String, int> accountsByCode;

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    service = SaleService(db);
    shopId = await db
        .into(db.shops)
        .insert(ShopsCompanion.insert(businessId: 1, name: 'Shop'));
    accountsByCode = await db.seedChartOfAccounts(shopId);
    cashAccountId = accountsByCode['1000']!;
    partyId = await db.into(db.parties).insert(
          PartiesCompanion.insert(
            shopId: shopId,
            partyKind: PartyKind.customer,
            name: 'Walk-in customer',
          ),
        );
    vatRateId = (await (db.select(db.taxRates)
          ..where((t) => t.name.equals('VAT')))
        .getSingle())
        .id;
  });

  tearDown(() async {
    await db.close();
  });

  Future<int> addProduct({
    int cost = 900,
    int price = 1200,
    int stock = 5000,
  }) {
    return db.into(db.products).insert(
          ProductsCompanion.insert(
            shopId: shopId,
            sku: 'MILO',
            name: 'Milo 400g',
            unit: 'each',
            cost: Value(cost),
            price: Value(price),
            stockOnHand: Value(stock),
            taxRateId: Value(vatRateId),
          ),
        );
  }

  Future<List<JournalLineRow>> journalLinesForInvoice(int invoiceId) async {
    final entry = await (db.select(db.journalEntries)
          ..where((e) => e.refId.equals(invoiceId)))
        .getSingle();
    return (db.select(db.journalLines)
          ..where((l) => l.entryId.equals(entry.id)))
        .get();
  }

  test('cash sale posts invoice, journal and stock together', () async {
    final productId = await addProduct();

    final invoiceId = await service.recordCashSale(
      shopId: shopId,
      partyId: partyId,
      methodAccountId: cashAccountId,
      date: DateTime(2026, 1, 5),
      lines: [
        SaleLineInput(
          productId: productId,
          description: 'Milo 400g',
          qtyThousandths: 2000, // 2 units
          unitPricePesewas: 1200, // GH₵ 12
          taxRateId: vatRateId,
        ),
      ],
    );

    final invoice = await (db.select(db.invoices)
          ..where((i) => i.id.equals(invoiceId)))
        .getSingle();
    expect(invoice.number, 'INV-00001');
    expect(invoice.invoiceKind, InvoiceKind.sale);
    expect(invoice.invoiceStatus, InvoiceStatus.issued);
    expect(invoice.subtotal, 2400);
    expect(invoice.taxTotal, 360); // 15% of 2400
    expect(invoice.total, 2760);

    final product = await (db.select(db.products)
          ..where((p) => p.id.equals(productId)))
        .getSingle();
    expect(product.stockOnHand, 3000); // 5000 - 2000

    final movements = await (db.select(db.stockMovements)
          ..where((m) => m.productId.equals(productId)))
        .get();
    expect(movements.length, 1);
    expect(movements.first.deltaQty, -2000);
    expect(movements.first.movementType, StockMovementType.sale);

    final lines = await journalLinesForInvoice(invoiceId);
    final debit = lines.fold<int>(0, (s, l) => s + l.debit);
    final credit = lines.fold<int>(0, (s, l) => s + l.credit);
    expect(debit, credit);

    int debitOf(int accountId) =>
        lines.where((l) => l.accountId == accountId).fold(0, (s, l) => s + l.debit);
    int creditOf(int accountId) =>
        lines.where((l) => l.accountId == accountId).fold(0, (s, l) => s + l.credit);

    expect(debitOf(cashAccountId), 2760);
    expect(creditOf(accountsByCode['4000']!), 2400); // sales
    expect(creditOf(accountsByCode['2100']!), 360); // VAT output
    expect(debitOf(accountsByCode['5000']!), 1800); // COGS = 900 * 2
    expect(creditOf(accountsByCode['1100']!), 1800); // inventory
  });

  test('credit sale debits receivable instead of cash', () async {
    final productId = await addProduct();
    final receivableId = accountsByCode['1200']!;

    final invoiceId = await service.recordCreditSale(
      shopId: shopId,
      partyId: partyId,
      date: DateTime(2026, 1, 6),
      lines: [
        SaleLineInput(
          productId: productId,
          description: 'Milo 400g',
          qtyThousandths: 1000, // 1 unit
          unitPricePesewas: 1200,
          taxRateId: vatRateId,
        ),
      ],
    );

    final lines = await journalLinesForInvoice(invoiceId);
    // total = 1200 + 15% VAT (180) = 1380
    expect(
        lines.any((l) => l.accountId == receivableId && l.debit == 1380), isTrue);
    expect(lines.any((l) => l.accountId == cashAccountId), isFalse);
  });
}
