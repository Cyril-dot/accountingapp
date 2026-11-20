import 'package:drift/drift.dart';

import '../../domain/engine/journal.dart';
import '../../domain/models/enums.dart';
import '../db/app_database.dart';
import 'common.dart';

/// Applies part of a payment to one invoice.
class PaymentAllocationInput {
  final int invoiceId;
  final int amountPesewas;

  const PaymentAllocationInput({required this.invoiceId, required this.amountPesewas});
}

/// Records money received (customer pays) or made (we pay a supplier),
/// allocates it to invoices, and posts the journal in one transaction.
class PaymentService {
  final AppDatabase db;
  PaymentService(this.db);

  Future<int> recordReceived({
    required int shopId,
    required int partyId,
    required int methodAccountId,
    required DateTime date,
    required int amountPesewas,
    List<PaymentAllocationInput> allocations = const [],
    String? reference,
    String? notes,
  }) {
    return _record(
      shopId: shopId,
      partyId: partyId,
      methodAccountId: methodAccountId,
      date: date,
      amountPesewas: amountPesewas,
      direction: PaymentDirection.received,
      allocations: allocations,
      reference: reference,
      notes: notes,
    );
  }

  Future<int> recordMade({
    required int shopId,
    required int partyId,
    required int methodAccountId,
    required DateTime date,
    required int amountPesewas,
    List<PaymentAllocationInput> allocations = const [],
    String? reference,
    String? notes,
  }) {
    return _record(
      shopId: shopId,
      partyId: partyId,
      methodAccountId: methodAccountId,
      date: date,
      amountPesewas: amountPesewas,
      direction: PaymentDirection.made,
      allocations: allocations,
      reference: reference,
      notes: notes,
    );
  }

  Future<int> _record({
    required int shopId,
    required int partyId,
    required int methodAccountId,
    required DateTime date,
    required int amountPesewas,
    required PaymentDirection direction,
    required List<PaymentAllocationInput> allocations,
    String? reference,
    String? notes,
  }) {
    return db.transaction(() async {
      final accounts = await accountsByCode(db, shopId);

      final number = await nextPaymentNumber(db, shopId);
      final paymentId = await db.into(db.payments).insert(
            PaymentsCompanion.insert(
              shopId: shopId,
              number: number,
              direction: direction,
              partyId: partyId,
              date: date,
              methodId: methodAccountId,
              amount: amountPesewas,
              reference: Value(reference),
              notes: Value(notes),
            ),
          );

      for (final a in allocations) {
        await db.into(db.paymentAllocations).insert(
              PaymentAllocationsCompanion.insert(
                paymentId: paymentId,
                invoiceId: a.invoiceId,
                amount: a.amountPesewas,
              ),
            );
        final invoice = await (db.select(db.invoices)
              ..where((i) => i.id.equals(a.invoiceId)))
            .getSingle();
        final newPaid = invoice.paidTotal + a.amountPesewas;
        var status = invoice.invoiceStatus;
        if (invoice.total > 0 && newPaid >= invoice.total) {
          status = InvoiceStatus.paid;
        } else if (newPaid > 0) {
          status = InvoiceStatus.partiallyPaid;
        }
        await (db.update(db.invoices)
              ..where((i) => i.id.equals(a.invoiceId)))
            .write(InvoicesCompanion(
              paidTotal: Value(newPaid),
              invoiceStatus: Value(status),
            ));
      }

      final JournalEntry entry;
      if (direction == PaymentDirection.received) {
        entry = Journalizer.paymentReceived(
          methodAccountId: methodAccountId,
          receivableAccountId: accounts['1200']!,
          amountPesewas: amountPesewas,
          refId: paymentId,
        );
      } else {
        entry = Journalizer.paymentMade(
          payableAccountId: accounts['2000']!,
          methodAccountId: methodAccountId,
          amountPesewas: amountPesewas,
          refId: paymentId,
        );
      }

      await insertJournalEntry(
        db,
        shopId: shopId,
        number: await nextJournalNumber(db, shopId),
        date: date,
        memo: entry.memo,
        refType: entry.refType,
        refId: paymentId,
        lines: entry.lines,
      );

      return paymentId;
    });
  }
}
