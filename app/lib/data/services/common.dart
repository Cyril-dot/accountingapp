import 'package:drift/drift.dart';

import '../../domain/engine/journal.dart';
import '../../domain/engine/tax.dart';
import '../../domain/models/enums.dart';
import '../db/app_database.dart';

/// Shared data-layer helpers used by the posting services.

Future<Map<String, int>> accountsByCode(AppDatabase db, int shopId) async {
  final rows = await (db.select(db.accounts)
        ..where((a) => a.shopId.equals(shopId)))
      .get();
  return {for (final a in rows) a.code: a.id};
}

Future<TaxRate> engineTaxRate(AppDatabase db, int taxRateId) async {
  final r = await (db.select(db.taxRates)
        ..where((t) => t.id.equals(taxRateId)))
      .getSingle();
  return TaxRate(name: r.name, rateBp: r.rateBp, isLevy: r.isLevy);
}

Future<String> nextInvoiceNumber(AppDatabase db, int shopId) async {
  final count = db.invoices.id.count();
  final query = db.selectOnly(db.invoices)
    ..addColumns([count])
    ..where(db.invoices.shopId.equals(shopId));
  final row = await query.getSingle();
  return 'INV-${((row.read(count) ?? 0) + 1).toString().padLeft(5, '0')}';
}

Future<String> nextPaymentNumber(AppDatabase db, int shopId) async {
  final count = db.payments.id.count();
  final query = db.selectOnly(db.payments)
    ..addColumns([count])
    ..where(db.payments.shopId.equals(shopId));
  final row = await query.getSingle();
  return 'PAY-${((row.read(count) ?? 0) + 1).toString().padLeft(5, '0')}';
}

Future<String> nextJournalNumber(AppDatabase db, int shopId) async {
  final count = db.journalEntries.id.count();
  final query = db.selectOnly(db.journalEntries)
    ..addColumns([count])
    ..where(db.journalEntries.shopId.equals(shopId));
  final row = await query.getSingle();
  return 'JE-${((row.read(count) ?? 0) + 1).toString().padLeft(5, '0')}';
}

/// Persists a domain journal entry plus its lines; returns the entry id.
Future<int> insertJournalEntry(
  AppDatabase db, {
  required int shopId,
  required String number,
  required DateTime date,
  required String memo,
  required String refType,
  int? refId,
  required List<JournalLine> lines,
}) async {
  final entryId = await db.into(db.journalEntries).insert(
        JournalEntriesCompanion.insert(
          shopId: shopId,
          number: number,
          date: date,
          memo: memo,
          refType: refType,
          refId: Value(refId),
          journalStatus: JournalStatus.posted,
        ),
      );
  for (final line in lines) {
    await db.into(db.journalLines).insert(
          JournalLinesCompanion.insert(
            entryId: entryId,
            accountId: line.accountId,
            debit: Value(line.debit),
            credit: Value(line.credit),
          ),
        );
  }
  return entryId;
}
