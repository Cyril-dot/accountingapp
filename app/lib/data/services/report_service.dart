import 'package:drift/drift.dart';

import '../../domain/models/enums.dart';
import '../db/app_database.dart';

/// A single posted line of an account's ledger, in date order.
class LedgerLine {
  final DateTime date;
  final String number;
  final String memo;
  final int debit;
  final int credit;

  const LedgerLine({
    required this.date,
    required this.number,
    required this.memo,
    required this.debit,
    required this.credit,
  });
}

/// Read-only accounting reports, computed from posted journal lines.
class ReportService {
  final AppDatabase db;
  ReportService(this.db);

  /// Debit-minus-credit balance per account id, seeded from opening balances.
  Future<Map<int, int>> accountBalances(int shopId) async {
    final accounts = await (db.select(db.accounts)
          ..where((a) => a.shopId.equals(shopId)))
        .get();
    final balances = {for (final a in accounts) a.id: a.openingBalance};

    final rows = await (db.select(db.journalLines).join([
          innerJoin(db.accounts, db.accounts.id.equalsExp(db.journalLines.accountId)),
        ])
          ..where(db.accounts.shopId.equals(shopId)))
        .get();

    for (final row in rows) {
      final line = row.readTable(db.journalLines);
      balances[line.accountId] =
          (balances[line.accountId] ?? 0) + line.debit - line.credit;
    }
    return balances;
  }

  Future<List<({String code, String name, AccountType type, int balance})>>
      trialBalance(int shopId) async {
    final balances = await accountBalances(shopId);
    final accounts = await (db.select(db.accounts)
          ..where((a) => a.shopId.equals(shopId)))
        .get();
    return [
      for (final a in accounts)
        (
          code: a.code,
          name: a.name,
          type: a.accountType,
          balance: balances[a.id] ?? 0,
        ),
    ];
  }

  /// Profit = revenue (income accounts) − costs (expense accounts).
  Future<({int revenue, int costs, int profit})> profitAndLoss(int shopId) async {
    final balances = await accountBalances(shopId);
    final accounts = await (db.select(db.accounts)
          ..where((a) => a.shopId.equals(shopId)))
        .get();

    var incomeBalance = 0; // negative = revenue, since income is credited
    var expenseBalance = 0; // positive = costs, since expenses are debited
    for (final a in accounts) {
      final b = balances[a.id] ?? 0;
      if (a.accountType == AccountType.income) incomeBalance += b;
      if (a.accountType == AccountType.expense) expenseBalance += b;
    }
    final revenue = -incomeBalance;
    return (revenue: revenue, costs: expenseBalance, profit: revenue - expenseBalance);
  }

  /// VAT output (sales tax) vs input (purchase tax); net is what is owed.
  Future<({int outputVat, int inputVat, int netVat})> vatSummary(int shopId) async {
    final balances = await accountBalances(shopId);
    final accounts = await (db.select(db.accounts)
          ..where((a) => a.shopId.equals(shopId)))
        .get();
    int idFor(String code) => accounts.firstWhere((a) => a.code == code).id;

    final output = -(balances[idFor('2100')] ?? 0);
    final input = balances[idFor('1250')] ?? 0;
    return (outputVat: output, inputVat: input, netVat: output - input);
  }

  /// The ordered ledger of one account (debits/credits only; running balance is
  /// derived by the caller from the account opening balance).
  Future<List<LedgerLine>> ledger(int shopId, int accountId) async {
    final select = db.select(db.journalLines)
      ..where((l) => l.accountId.equals(accountId));
    final joined = select.join([
      innerJoin(db.journalEntries,
          db.journalEntries.id.equalsExp(db.journalLines.entryId)),
    ]);
    joined.where(db.journalEntries.shopId.equals(shopId));
    joined.orderBy([
      OrderingTerm.asc(db.journalEntries.date),
      OrderingTerm.asc(db.journalEntries.id),
    ]);
    final rows = await joined.get();

    return [
      for (final row in rows)
        LedgerLine(
          date: row.readTable(db.journalEntries).date,
          number: row.readTable(db.journalEntries).number,
          memo: row.readTable(db.journalEntries).memo,
          debit: row.readTable(db.journalLines).debit,
          credit: row.readTable(db.journalLines).credit,
        ),
    ];
  }

  /// Profit for a period: income-account credits minus expense-account debits,
  /// from posted journal lines (so it excludes VAT, which is a liability).
  Future<int> profitInPeriod(int shopId,
      {required DateTime from, required DateTime to}) async {
    final rows = await (db.select(db.journalLines).join([
      innerJoin(db.journalEntries,
          db.journalEntries.id.equalsExp(db.journalLines.entryId)),
      innerJoin(db.accounts, db.accounts.id.equalsExp(db.journalLines.accountId)),
    ])
          ..where(db.accounts.shopId.equals(shopId))
          ..where(db.journalEntries.date.isBiggerOrEqualValue(from))
          ..where(db.journalEntries.date.isSmallerOrEqualValue(to)))
        .get();

    var revenue = 0;
    var costs = 0;
    for (final row in rows) {
      final line = row.readTable(db.journalLines);
      final account = row.readTable(db.accounts);
      if (account.accountType == AccountType.income) revenue += line.credit;
      if (account.accountType == AccountType.expense) costs += line.debit;
    }
    return revenue - costs;
  }

  /// Dashboard figures for a date range, from source documents and balances.
  Future<({int sales, int purchases, int paymentsReceived, int paymentsMade,
      int expenses, int profit, int cash, int bank, int momo})> dashboard(
      int shopId,
      {required DateTime from,
      required DateTime to}) async {
    final invoices = await (db.select(db.invoices)
          ..where((i) => i.shopId.equals(shopId)))
        .get();
    final payments = await (db.select(db.payments)
          ..where((p) => p.shopId.equals(shopId)))
        .get();
    final expenses = await (db.select(db.expenses)
          ..where((e) => e.shopId.equals(shopId)))
        .get();
    final balances = await accountBalances(shopId);
    final accounts = await (db.select(db.accounts)
          ..where((a) => a.shopId.equals(shopId)))
        .get();
    int idFor(String code) => accounts.firstWhere((a) => a.code == code).id;

    bool inRange(DateTime d) => !d.isBefore(from) && !d.isAfter(to);

    return (
      sales: _sum(invoices
          .where((i) => i.invoiceKind == InvoiceKind.sale && inRange(i.date))
          .map((i) => i.total)),
      purchases: _sum(invoices
          .where((i) => i.invoiceKind == InvoiceKind.purchase && inRange(i.date))
          .map((i) => i.total)),
      paymentsReceived: _sum(payments
          .where((p) => p.direction == PaymentDirection.received && inRange(p.date))
          .map((p) => p.amount)),
      paymentsMade: _sum(payments
          .where((p) => p.direction == PaymentDirection.made && inRange(p.date))
          .map((p) => p.amount)),
      expenses: _sum(expenses.where((e) => inRange(e.date)).map((e) => e.amount)),
      profit: await profitInPeriod(shopId, from: from, to: to),
      cash: balances[idFor('1000')] ?? 0,
      bank: balances[idFor('1010')] ?? 0,
      momo: (balances[idFor('1020')] ?? 0) +
          (balances[idFor('1021')] ?? 0) +
          (balances[idFor('1022')] ?? 0),
    );
  }

  static int _sum(Iterable<int> values) => values.fold(0, (s, v) => s + v);

  /// Outstanding receivables (what customers owe us) and payables (what we owe
  /// suppliers) per party, computed from open invoices.
  Future<List<({int partyId, String name, PartyKind kind, int receivable, int payable})>>
      partyBalances(int shopId) async {
    final parties = await (db.select(db.parties)
          ..where((p) => p.shopId.equals(shopId)))
        .get();
    final invoices = await (db.select(db.invoices)
          ..where((i) => i.shopId.equals(shopId)))
        .get();

    final result = <({int partyId, String name, PartyKind kind, int receivable, int payable})>[];
    for (final party in parties) {
      var receivable = 0;
      var payable = 0;
      for (final inv in invoices) {
        if (inv.partyId != party.id) continue;
        if (inv.invoiceStatus == InvoiceStatus.paid ||
            inv.invoiceStatus == InvoiceStatus.voided) {
          continue;
        }
        final open = inv.total - inv.paidTotal;
        if (inv.invoiceKind == InvoiceKind.sale) receivable += open;
        if (inv.invoiceKind == InvoiceKind.purchase) payable += open;
      }
      if (receivable != 0 || payable != 0) {
        result.add((
          partyId: party.id,
          name: party.name,
          kind: party.partyKind,
          receivable: receivable,
          payable: payable,
        ));
      }
    }
    return result;
  }
}
