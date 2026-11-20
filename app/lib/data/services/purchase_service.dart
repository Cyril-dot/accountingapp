import 'package:drift/drift.dart';

import '../../domain/engine/journal.dart';
import '../../domain/engine/tax.dart';
import '../../domain/models/enums.dart';
import '../db/app_database.dart';
import 'common.dart';

class PurchaseLineInput {
  final int productId;
  final String description;
  final int qtyThousandths;
  final int unitCostPesewas; // what we pay per 1.000 unit
  final int discountPesewas;
  final int? taxRateId; // input VAT/levy rate

  const PurchaseLineInput({
    required this.productId,
    required this.description,
    required this.qtyThousandths,
    required this.unitCostPesewas,
    this.discountPesewas = 0,
    this.taxRateId,
  });
}

/// Records purchases: inventory rises, input tax is captured, and a payable
/// (credit) or cash/MoMo (cash) is posted. Runs in one transaction.
class PurchaseService {
  final AppDatabase db;
  PurchaseService(this.db);

  Future<int> recordCashPurchase({
    required int shopId,
    required int supplierId,
    required int methodAccountId,
    required DateTime date,
    required List<PurchaseLineInput> lines,
    String? reference,
    String? notes,
  }) {
    return _recordPurchase(
      shopId: shopId,
      supplierId: supplierId,
      date: date,
      lines: lines,
      reference: reference,
      notes: notes,
      onCredit: false,
      methodAccountId: methodAccountId,
    );
  }

  Future<int> recordCreditPurchase({
    required int shopId,
    required int supplierId,
    required DateTime date,
    required List<PurchaseLineInput> lines,
    String? reference,
    String? notes,
  }) {
    return _recordPurchase(
      shopId: shopId,
      supplierId: supplierId,
      date: date,
      lines: lines,
      reference: reference,
      notes: notes,
      onCredit: true,
    );
  }

  Future<int> _recordPurchase({
    required int shopId,
    required int supplierId,
    required DateTime date,
    required List<PurchaseLineInput> lines,
    required bool onCredit,
    int? methodAccountId,
    String? reference,
    String? notes,
  }) {
    return db.transaction(() async {
      final accounts = await accountsByCode(db, shopId);
      int account(String code) {
        final id = accounts[code];
        if (id == null) throw StateError('seed account missing: $code');
        return id;
      }

      var subtotal = 0;
      var discountTotal = 0;
      var taxTotal = 0;
      var total = 0;
      var inventoryCost = 0;
      final computed = <({PurchaseLineInput line, LineTotals totals})>[];

      for (final line in lines) {
        final engineRate =
            line.taxRateId == null ? null : await engineTaxRate(db, line.taxRateId!);
        final totals = computeLine(
          unitPricePesewas: line.unitCostPesewas,
          qtyThousandths: line.qtyThousandths,
          discountPesewas: line.discountPesewas,
          taxRate: engineRate,
        );
        subtotal += totals.netPesewas;
        discountTotal += totals.discountPesewas;
        taxTotal += totals.taxPesewas;
        total += totals.totalPesewas;
        inventoryCost += totals.taxablePesewas;
        computed.add((line: line, totals: totals));
      }

      final number = await nextInvoiceNumber(db, shopId);
      final invoiceId = await db.into(db.invoices).insert(
            InvoicesCompanion.insert(
              shopId: shopId,
              number: number,
              invoiceKind: InvoiceKind.purchase,
              partyId: supplierId,
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
                unitPrice: c.line.unitCostPesewas,
                discount: Value(c.line.discountPesewas),
                taxRateId: Value(c.line.taxRateId),
                taxAmount: c.totals.taxPesewas,
                lineTotal: c.totals.totalPesewas,
              ),
            );
      }

      final entry = onCredit
          ? Journalizer.purchaseCredit(
              inventoryAccountId: account('1100'),
              vatInputAccountId: account('1250'),
              payableAccountId: account('2000'),
              netPesewas: inventoryCost,
              taxPesewas: taxTotal,
              totalPesewas: total,
              refId: invoiceId,
            )
          : Journalizer.purchaseCash(
              inventoryAccountId: account('1100'),
              vatInputAccountId: account('1250'),
              methodAccountId: methodAccountId!,
              netPesewas: inventoryCost,
              taxPesewas: taxTotal,
              totalPesewas: total,
              refId: invoiceId,
            );

      await insertJournalEntry(
        db,
        shopId: shopId,
        number: await nextJournalNumber(db, shopId),
        date: date,
        memo: entry.memo,
        refType: entry.refType,
        refId: invoiceId,
        lines: entry.lines,
      );

      for (final c in computed) {
        await db.into(db.stockMovements).insert(
              StockMovementsCompanion.insert(
                shopId: shopId,
                productId: c.line.productId,
                date: date,
                movementType: StockMovementType.purchase,
                deltaQty: c.line.qtyThousandths,
                unitCost: c.line.unitCostPesewas,
                refType: 'invoice',
                refId: Value(invoiceId),
              ),
            );
        final product = await (db.select(db.products)
              ..where((p) => p.id.equals(c.line.productId)))
            .getSingle();
        await (db.update(db.products)
              ..where((p) => p.id.equals(c.line.productId)))
            .write(ProductsCompanion(
              stockOnHand: Value(product.stockOnHand + c.line.qtyThousandths),
              cost: Value(c.line.unitCostPesewas),
            ));
      }

      return invoiceId;
    });
  }
}
