/// One side of a double-entry posting. Exactly one of [debit] or [credit] is
/// positive; both are integer pesewas and never negative. [accountId] is the
/// database id of a chart-of-accounts row.
class JournalLine {
  final int accountId;
  final int debit;
  final int credit;

  const JournalLine({required this.accountId, this.debit = 0, this.credit = 0})
      : assert(debit >= 0 && credit >= 0),
        assert(debit == 0 || credit == 0,
            'a line is debit OR credit, never both');
}

/// A balanced set of [JournalLine]s. Every business event produces one entry.
class JournalEntry {
  final String memo;
  final String refType; // sale | purchase | payment | expense | opening | manual
  final int? refId; // link back to the source document
  final List<JournalLine> lines;

  const JournalEntry({
    required this.memo,
    required this.refType,
    this.refId,
    required this.lines,
  });

  int get totalDebit => lines.fold(0, (sum, l) => sum + l.debit);
  int get totalCredit => lines.fold(0, (sum, l) => sum + l.credit);
  bool get isBalanced => totalDebit == totalCredit;
}

/// Turns business documents into balanced [JournalEntry]s. This is the fixed
/// mapping from the data model; keeping it in one pure class means the ledger,
/// trial balance and profit-and-loss are always consistent.
class Journalizer {
  /// Sale paid now. Dr cash/momo/bank, Cr sales, Cr VAT output; Dr COGS, Cr inventory.
  static JournalEntry saleCash({
    required int methodAccountId,
    required int salesAccountId,
    required int vatOutputAccountId,
    required int inventoryAccountId,
    required int cogsAccountId,
    required int totalPesewas,
    required int netPesewas,
    required int taxPesewas,
    required int costPesewas,
    int? refId,
  }) {
    return JournalEntry(
      memo: 'Cash sale',
      refType: 'sale',
      refId: refId,
      lines: [
        JournalLine(accountId: methodAccountId, debit: totalPesewas),
        JournalLine(accountId: salesAccountId, credit: netPesewas),
        JournalLine(accountId: vatOutputAccountId, credit: taxPesewas),
        JournalLine(accountId: cogsAccountId, debit: costPesewas),
        JournalLine(accountId: inventoryAccountId, credit: costPesewas),
      ],
    );
  }

  /// Sale on credit. Same as cash but Dr accounts receivable instead of cash.
  static JournalEntry saleCredit({
    required int receivableAccountId,
    required int salesAccountId,
    required int vatOutputAccountId,
    required int inventoryAccountId,
    required int cogsAccountId,
    required int totalPesewas,
    required int netPesewas,
    required int taxPesewas,
    required int costPesewas,
    int? refId,
  }) {
    return JournalEntry(
      memo: 'Credit sale',
      refType: 'sale',
      refId: refId,
      lines: [
        JournalLine(accountId: receivableAccountId, debit: totalPesewas),
        JournalLine(accountId: salesAccountId, credit: netPesewas),
        JournalLine(accountId: vatOutputAccountId, credit: taxPesewas),
        JournalLine(accountId: cogsAccountId, debit: costPesewas),
        JournalLine(accountId: inventoryAccountId, credit: costPesewas),
      ],
    );
  }

  /// Purchase paid now. Dr inventory, Dr VAT input, Cr cash/momo/bank.
  static JournalEntry purchaseCash({
    required int inventoryAccountId,
    required int vatInputAccountId,
    required int methodAccountId,
    required int netPesewas,
    required int taxPesewas,
    required int totalPesewas,
    int? refId,
  }) {
    return JournalEntry(
      memo: 'Cash purchase',
      refType: 'purchase',
      refId: refId,
      lines: [
        JournalLine(accountId: inventoryAccountId, debit: netPesewas),
        JournalLine(accountId: vatInputAccountId, debit: taxPesewas),
        JournalLine(accountId: methodAccountId, credit: totalPesewas),
      ],
    );
  }

  /// Purchase on credit. Dr inventory, Dr VAT input, Cr accounts payable.
  static JournalEntry purchaseCredit({
    required int inventoryAccountId,
    required int vatInputAccountId,
    required int payableAccountId,
    required int netPesewas,
    required int taxPesewas,
    required int totalPesewas,
    int? refId,
  }) {
    return JournalEntry(
      memo: 'Credit purchase',
      refType: 'purchase',
      refId: refId,
      lines: [
        JournalLine(accountId: inventoryAccountId, debit: netPesewas),
        JournalLine(accountId: vatInputAccountId, debit: taxPesewas),
        JournalLine(accountId: payableAccountId, credit: totalPesewas),
      ],
    );
  }

  /// A customer pays us. Dr cash/momo/bank, Cr accounts receivable.
  static JournalEntry paymentReceived({
    required int methodAccountId,
    required int receivableAccountId,
    required int amountPesewas,
    int? refId,
  }) {
    return JournalEntry(
      memo: 'Payment received',
      refType: 'payment',
      refId: refId,
      lines: [
        JournalLine(accountId: methodAccountId, debit: amountPesewas),
        JournalLine(accountId: receivableAccountId, credit: amountPesewas),
      ],
    );
  }

  /// We pay a supplier. Dr accounts payable, Cr cash/momo/bank.
  static JournalEntry paymentMade({
    required int payableAccountId,
    required int methodAccountId,
    required int amountPesewas,
    int? refId,
  }) {
    return JournalEntry(
      memo: 'Payment made',
      refType: 'payment',
      refId: refId,
      lines: [
        JournalLine(accountId: payableAccountId, debit: amountPesewas),
        JournalLine(accountId: methodAccountId, credit: amountPesewas),
      ],
    );
  }

  /// Expense paid now. Dr expense, Dr VAT input, Cr cash/momo/bank.
  static JournalEntry expenseCash({
    required int expenseAccountId,
    required int vatInputAccountId,
    required int methodAccountId,
    required int amountPesewas,
    required int taxInputPesewas,
    int? refId,
  }) {
    return JournalEntry(
      memo: 'Cash expense',
      refType: 'expense',
      refId: refId,
      lines: [
        JournalLine(
            accountId: expenseAccountId, debit: amountPesewas - taxInputPesewas),
        JournalLine(accountId: vatInputAccountId, debit: taxInputPesewas),
        JournalLine(accountId: methodAccountId, credit: amountPesewas),
      ],
    );
  }

  /// Expense bought on credit from a supplier. Dr expense, Dr VAT input, Cr payable.
  static JournalEntry expenseCredit({
    required int expenseAccountId,
    required int vatInputAccountId,
    required int payableAccountId,
    required int amountPesewas,
    required int taxInputPesewas,
    int? refId,
  }) {
    return JournalEntry(
      memo: 'Credit expense',
      refType: 'expense',
      refId: refId,
      lines: [
        JournalLine(
            accountId: expenseAccountId, debit: amountPesewas - taxInputPesewas),
        JournalLine(accountId: vatInputAccountId, debit: taxInputPesewas),
        JournalLine(accountId: payableAccountId, credit: amountPesewas),
      ],
    );
  }
}
