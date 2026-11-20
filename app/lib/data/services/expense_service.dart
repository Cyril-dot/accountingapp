import 'package:drift/drift.dart';

import '../../domain/engine/journal.dart';
import '../db/app_database.dart';
import 'common.dart';

/// Records an expense paid now (cash/MoMo) or on credit to a supplier, and
/// posts the journal. Input tax is captured for later offset.
class ExpenseService {
  final AppDatabase db;
  ExpenseService(this.db);

  Future<int> recordCashExpense({
    required int shopId,
    required int expenseAccountId,
    required int methodAccountId,
    required DateTime date,
    required int amountPesewas,
    int taxInputPesewas = 0,
    String? notes,
  }) {
    return _record(
      shopId: shopId,
      expenseAccountId: expenseAccountId,
      date: date,
      amountPesewas: amountPesewas,
      taxInputPesewas: taxInputPesewas,
      notes: notes,
      onCredit: false,
      methodAccountId: methodAccountId,
    );
  }

  Future<int> recordCreditExpense({
    required int shopId,
    required int expenseAccountId,
    required int supplierId,
    required DateTime date,
    required int amountPesewas,
    int taxInputPesewas = 0,
    String? notes,
  }) {
    return _record(
      shopId: shopId,
      expenseAccountId: expenseAccountId,
      date: date,
      amountPesewas: amountPesewas,
      taxInputPesewas: taxInputPesewas,
      notes: notes,
      onCredit: true,
      supplierId: supplierId,
    );
  }

  Future<int> _record({
    required int shopId,
    required int expenseAccountId,
    required DateTime date,
    required int amountPesewas,
    required int taxInputPesewas,
    required bool onCredit,
    int? methodAccountId,
    int? supplierId,
    String? notes,
  }) {
    return db.transaction(() async {
      final accounts = await accountsByCode(db, shopId);
      final vatInputId = accounts['1250']!;
      final payableId = accounts['2000']!;

      final expenseId = await db.into(db.expenses).insert(
            ExpensesCompanion.insert(
              shopId: shopId,
              date: date,
              accountId: expenseAccountId,
              supplierId: Value(supplierId),
              amount: amountPesewas,
              taxInput: Value(taxInputPesewas),
              methodId: Value(methodAccountId),
              notes: Value(notes),
            ),
          );

      final entry = onCredit
          ? Journalizer.expenseCredit(
              expenseAccountId: expenseAccountId,
              vatInputAccountId: vatInputId,
              payableAccountId: payableId,
              amountPesewas: amountPesewas,
              taxInputPesewas: taxInputPesewas,
              refId: expenseId,
            )
          : Journalizer.expenseCash(
              expenseAccountId: expenseAccountId,
              vatInputAccountId: vatInputId,
              methodAccountId: methodAccountId!,
              amountPesewas: amountPesewas,
              taxInputPesewas: taxInputPesewas,
              refId: expenseId,
            );

      await insertJournalEntry(
        db,
        shopId: shopId,
        number: await nextJournalNumber(db, shopId),
        date: date,
        memo: entry.memo,
        refType: entry.refType,
        refId: expenseId,
        lines: entry.lines,
      );

      return expenseId;
    });
  }
}
