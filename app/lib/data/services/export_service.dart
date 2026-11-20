import 'dart:io';

import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';

import '../db/app_database.dart';

/// Exports the books to shareable files. CSV opens in Excel; the database
/// backup is a consistent SQLite snapshot (VACUUM INTO).
class ExportService {
  final AppDatabase db;
  ExportService(this.db);

  /// The full double-entry journal as CSV: one row per journal line, with the
  /// account code/name. Money is in cedis (e.g. "24.00").
  Future<String> journalCsv(int shopId) async {
    final select = db.select(db.journalLines);
    final joined = select.join([
      innerJoin(db.journalEntries,
          db.journalEntries.id.equalsExp(db.journalLines.entryId)),
      innerJoin(db.accounts, db.accounts.id.equalsExp(db.journalLines.accountId)),
    ]);
    joined.where(db.accounts.shopId.equals(shopId));
    joined.orderBy([
      OrderingTerm.asc(db.journalEntries.date),
      OrderingTerm.asc(db.journalEntries.id),
    ]);
    final rows = await joined.get();

    final sb = StringBuffer()
      ..writeln('date,number,memo,account_code,account_name,debit,credit');
    for (final row in rows) {
      final line = row.readTable(db.journalLines);
      final entry = row.readTable(db.journalEntries);
      final account = row.readTable(db.accounts);
      sb.writeln([
        _date(entry.date),
        _csv(entry.number),
        _csv(entry.memo),
        _csv(account.code),
        _csv(account.name),
        _cedis(line.debit),
        _cedis(line.credit),
      ].join(','));
    }
    return sb.toString();
  }

  /// Writes a consistent snapshot of the database to a temp file and returns it.
  Future<File> backupDatabase() async {
    final dir = await getTemporaryDirectory();
    final path =
        '${dir.path}/sikabooks-backup-${DateTime.now().millisecondsSinceEpoch}.db';
    final safe = path.replaceAll("'", "''");
    await db.customStatement("VACUUM INTO '$safe'");
    return File(path);
  }

  static String _csv(String v) {
    if (v.contains(',') || v.contains('"') || v.contains('\n')) {
      return '"${v.replaceAll('"', '""')}"';
    }
    return v;
  }

  static String _cedis(int pesewas) {
    final neg = pesewas < 0;
    final a = pesewas.abs();
    final body = '${a ~/ 100}.${(a % 100).toString().padLeft(2, '0')}';
    return neg ? '-$body' : body;
  }

  static String _date(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
}
