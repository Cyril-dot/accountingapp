import 'package:drift/drift.dart';

import '../../domain/engine/journal.dart';
import '../../domain/engine/tax.dart';
import '../../domain/models/enums.dart';
import '../db/app_database.dart';

/// One line of a sale, as entered by the user. Money is computed here from
/// quantity and unit price so totals stay in integer pesewas.
class SaleLineInput {
  final int productId;
  final String description;
  final int qtyThousandths; // e.g. 1250 == 1.250
  final int unitPricePesewas;
  final int discountPesewas;
  final int? taxRateId;

  const SaleLineInput({
    required this.productId,
    required this.description,
    required this.qtyThousandths,
    required this.unitPricePesewas,
    this.discountPesewas = 0,
    this.taxRateId,
  });
}

/// Records sales and posts them to the journal and inventory in one
/// transaction, so a sale can never half-apply.
class SaleService {
  final AppDatabase db;
  SaleService(this.db);

  /// Sale paid now with cash / MoMo / bank. Returns the new invoice id.
  Future<int> recordCashSale({
    required int shopId,
    required int partyId,
    required int methodAccountId,
    required DateTime date,
    required List<SaleLineInput> lines,
    String? reference,
    String? notes,
  }) {
    return _recordSale(
      shopId: shopId,
      partyId: partyId,
      date: date,
      lines: lines,
      reference: reference,
      notes: notes,
      onCredit: false,
      methodAccountId: methodAccountId,
    );
  }

  /// Sale on credit (customer owes us). Returns the new invoice id.
  Future<int> recordCreditSale({
    required int shopId,
    required int partyId,
    required DateTime date,
    required List<SaleLineInput> lines,
    String? reference,
    String? notes,
  }) {
    return _recordSale(
      shopId: shopId,
      partyId: partyId,
      date: date,
      lines: lines,
      reference: reference,
      notes: notes,
      onCredit: true,
    );
  }

  Future<int> _recordSale({
    required int shopId,
    required int partyId,
    required DateTime date,
    required List<SaleLineInput> lines,
    required bool onCredit,
    int? methodAccountId,
    String? reference,
    String? notes,
  }) {
    return db.transaction(() async {
      final accounts = await _accountsByCode(shopId);
      int account(String code) {
        final id = accounts[code];
        if (id == null) throw StateError('seed account missing: $code');
        return id;
      }

      var subtotal = 0;
      var discountTotal = 0;
      var taxTotal = 0;
      var total = 0;
      var costTotal = 0;
      final computed = <({SaleLineInput line, LineTotals totals, int cost, int stockBefore})>[];

      for (final line in lines) {
        final product = await (db.select(db.products)
              ..where((p) => p.id.equals(line.productId)))
            .getSingle();
        final engineRate =
            line.taxRateId == null ? null : await _toEngineTaxRate(line.taxRateId!);
        final totals = computeLine(
          unitPricePesewas: line.unitPricePesewas,
          qtyThousandths: line.qtyThousandths,
          discountPesewas: line.discountPesewas,
          taxRate: engineRate,
        );
        final cost = roundDiv(product.cost * line.qtyThousandths, 1000);
        subtotal += totals.netPesewas;
        discountTotal += totals.discountPesewas;
        taxTotal += totals.taxPesewas;
        total += totals.totalPesewas;
        costTotal += cost;
        computed.add((
          line: line,
          totals: totals,
          cost: cost,
          stockBefore: product.stockOnHand,
        ));
      }

      final number = await _nextInvoiceNumber(shopId);
      final invoiceId = await db.into(db.invoices).insert(
            InvoicesCompanion.insert(
              shopId: shopId,
              number: number,
              invoiceKind: InvoiceKind.sale,
              partyId: partyId,
              date: date,
              invoiceStatus: InvoiceStatus.issued,
              subtotal: subtotal,
              discountTotal: discountTotal,
              taxTotal: taxTotal,
              total: total,
              reference: Value(reference),
              notes: Value(notes),
            ),
          );

      for (final c in computed) {
        await db.into(db.invoiceLines).insert(
              InvoiceLinesCompanion.insert(
                invoiceId: invoiceId,
                productId: Value(c.line.productId),
                description: c.line.description,
                qty: c.line.qtyThousandths,
                unitPrice: c.line.unitPricePesewas,
                discount: Value(c.line.discountPesewas),
                taxRateId: Value(c.line.taxRateId),
                taxAmount: c.totals.taxPesewas,
                lineTotal: c.totals.totalPesewas,
              ),
            );
      }

      final entry = onCredit
          ? Journalizer.saleCredit(
              receivableAccountId: account('1200'),
              salesAccountId: account('4000'),
              vatOutputAccountId: account('2100'),
              inventoryAccountId: account('1100'),
              cogsAccountId: account('5000'),
              totalPesewas: total,
              netPesewas: subtotal - discountTotal,
              taxPesewas: taxTotal,
              costPesewas: costTotal,
              refId: invoiceId,
            )
          : Journalizer.saleCash(
              methodAccountId: methodAccountId!,
              salesAccountId: account('4000'),
              vatOutputAccountId: account('2100'),
              inventoryAccountId: account('1100'),
              cogsAccountId: account('5000'),
              totalPesewas: total,
              netPesewas: subtotal - discountTotal,
              taxPesewas: taxTotal,
              costPesewas: costTotal,
              refId: invoiceId,
            );

      final entryId = await db.into(db.journalEntries).insert(
            JournalEntriesCompanion.insert(
              shopId: shopId,
              number: 'JE-$invoiceId',
              date: date,
              memo: entry.memo,
              refType: entry.refType,
              refId: Value(invoiceId),
              journalStatus: JournalStatus.posted,
            ),
          );

      for (final line in entry.lines) {
        await db.into(db.journalLines).insert(
              JournalLinesCompanion.insert(
                entryId: entryId,
                accountId: line.accountId,
                debit: Value(line.debit),
                credit: Value(line.credit),
              ),
            );
      }

      for (final c in computed) {
        await db.into(db.stockMovements).insert(
              StockMovementsCompanion.insert(
                shopId: shopId,
                productId: c.line.productId,
                date: date,
                movementType: StockMovementType.sale,
                deltaQty: -c.line.qtyThousandths,
                unitCost: c.cost,
                refType: 'invoice',
                refId: Value(invoiceId),
              ),
            );
        await (db.update(db.products)
              ..where((p) => p.id.equals(c.line.productId)))
            .write(ProductsCompanion(
              stockOnHand: Value(c.stockBefore - c.line.qtyThousandths),
            ));
      }

      return invoiceId;
    });
  }

  Future<Map<String, int>> _accountsByCode(int shopId) async {
    final rows = await (db.select(db.accounts)
          ..where((a) => a.shopId.equals(shopId)))
        .get();
    return {for (final a in rows) a.code: a.id};
  }

  Future<TaxRate> _toEngineTaxRate(int taxRateId) async {
    final r = await (db.select(db.taxRates)
          ..where((t) => t.id.equals(taxRateId)))
        .getSingle();
    return TaxRate(name: r.name, rateBp: r.rateBp, isLevy: r.isLevy);
  }

  Future<String> _nextInvoiceNumber(int shopId) async {
    final count = db.invoices.id.count();
    final query = db.selectOnly(db.invoices)
      ..addColumns([count])
      ..where(db.invoices.shopId.equals(shopId));
    final row = await query.getSingle();
    final n = (row.read(count) ?? 0) + 1;
    return 'INV-${n.toString().padLeft(5, '0')}';
  }
}
