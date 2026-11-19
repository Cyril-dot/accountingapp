import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import '../../domain/models/enums.dart';
import 'tables.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Businesses,
    Shops,
    Users,
    Accounts,
    TaxRates,
    Parties,
    Categories,
    Products,
    PaymentMethods,
    Invoices,
    InvoiceLines,
    Payments,
    PaymentAllocations,
    Expenses,
    StockMovements,
    JournalEntries,
    JournalLines,
  ],
)
class AppDatabase extends _$AppDatabase {
  /// Opens the on-device database, or an injected executor (used by tests).
  AppDatabase([QueryExecutor? executor])
      : super(executor ?? driftDatabase(name: 'sikabooks'));

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          await seedTaxRates();
        },
      );

  /// Global Ghana tax rates. Rates are data, not code, so these are the
  /// out-of-the-box defaults and can be edited later.
  Future<void> seedTaxRates() async {
    await batch((b) => b.insertAll(taxRates, [
      TaxRatesCompanion.insert(
          name: 'VAT', rateBp: 1500, taxKind: TaxKind.output),
      TaxRatesCompanion.insert(
          name: 'VAT Input', rateBp: 1500, taxKind: TaxKind.input),
      TaxRatesCompanion.insert(
          name: 'NHIL',
          rateBp: 250,
          taxKind: TaxKind.output,
          isLevy: const Value(true)),
      TaxRatesCompanion.insert(
          name: 'GETFund',
          rateBp: 250,
          taxKind: TaxKind.output,
          isLevy: const Value(true)),
      TaxRatesCompanion.insert(
          name: 'COVID-19 Levy',
          rateBp: 100,
          taxKind: TaxKind.output,
          isLevy: const Value(true)),
      TaxRatesCompanion.insert(
          name: 'Zero-rated', rateBp: 0, taxKind: TaxKind.output),
      TaxRatesCompanion.insert(
          name: 'Exempt', rateBp: 0, taxKind: TaxKind.output),
    ]));
  }

  /// Seeds the default chart of accounts for a shop and returns a map of
  /// account code -> id, so payment methods can reference them.
  Future<Map<String, int>> seedChartOfAccounts(int shopId) async {
    const rows = [
      (code: '1000', name: 'Cash in hand', type: AccountType.asset, subtype: 'cash'),
      (code: '1010', name: 'Bank', type: AccountType.asset, subtype: 'bank'),
      (code: '1020', name: 'MTN MoMo', type: AccountType.asset, subtype: 'momo'),
      (code: '1021', name: 'Telecel Cash', type: AccountType.asset, subtype: 'momo'),
      (code: '1022', name: 'AirtelTigo Cash', type: AccountType.asset, subtype: 'momo'),
      (code: '1100', name: 'Inventory', type: AccountType.asset, subtype: 'inventory'),
      (code: '1200', name: 'Accounts receivable', type: AccountType.asset, subtype: 'receivable'),
      (code: '1250', name: 'VAT input (recoverable)', type: AccountType.asset, subtype: 'tax_input'),
      (code: '2000', name: 'Accounts payable', type: AccountType.liability, subtype: 'payable'),
      (code: '2100', name: 'VAT output payable', type: AccountType.liability, subtype: 'tax_payable'),
      (code: '2200', name: 'Levies payable', type: AccountType.liability, subtype: 'tax_payable'),
      (code: '3000', name: 'Owner capital', type: AccountType.equity, subtype: 'capital'),
      (code: '3100', name: 'Owner drawings', type: AccountType.equity, subtype: 'drawings'),
      (code: '4000', name: 'Sales', type: AccountType.income, subtype: 'sales'),
      (code: '4100', name: 'Other income', type: AccountType.income, subtype: 'other'),
      (code: '5000', name: 'Cost of goods sold', type: AccountType.expense, subtype: 'cogs'),
      (code: '5100', name: 'General expenses', type: AccountType.expense, subtype: 'general'),
    ];

    final byCode = <String, int>{};
    for (final row in rows) {
      final id = await into(accounts).insert(
        AccountsCompanion.insert(
          shopId: shopId,
          code: row.code,
          name: row.name,
          accountType: row.type,
          subtype: Value(row.subtype),
          isSystem: const Value(true),
        ),
      );
      byCode[row.code] = id;
    }
    return byCode;
  }

  /// Seeds the default payment methods, each mapped to its asset account.
  Future<void> seedPaymentMethods(
      int shopId, Map<String, int> accountsByCode) async {
    const methods = [
      (name: 'Cash', code: '1000'),
      (name: 'MTN MoMo', code: '1020'),
      (name: 'Telecel Cash', code: '1021'),
      (name: 'AirtelTigo Cash', code: '1022'),
      (name: 'Bank transfer', code: '1010'),
    ];

    await batch((b) => b.insertAll(paymentMethods, [
      for (final m in methods)
        PaymentMethodsCompanion.insert(
          shopId: shopId,
          name: m.name,
          accountId: accountsByCode[m.code]!,
        ),
    ]));
  }
}
