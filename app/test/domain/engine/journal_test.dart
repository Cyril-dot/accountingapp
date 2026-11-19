import 'package:flutter_test/flutter_test.dart';
import 'package:sikabooks/domain/engine/journal.dart';

// Account ids used throughout.
const cash = 1;
const momo = 2;
const bank = 3;
const receivable = 4;
const payable = 5;
const inventory = 6;
const sales = 7;
const vatOutput = 8;
const vatInput = 9;
const cogs = 10;
const rent = 11;

void main() {
  group('Journalizer', () {
    test('cash sale is balanced and posts the right sides', () {
      final e = Journalizer.saleCash(
        methodAccountId: cash,
        salesAccountId: sales,
        vatOutputAccountId: vatOutput,
        inventoryAccountId: inventory,
        cogsAccountId: cogs,
        totalPesewas: 1150, // net 1000 + VAT 150
        netPesewas: 1000,
        taxPesewas: 150,
        costPesewas: 600,
      );
      expect(e.isBalanced, isTrue);

      int debitOf(int id) =>
          e.lines.where((l) => l.accountId == id).fold(0, (s, l) => s + l.debit);
      int creditOf(int id) =>
          e.lines.where((l) => l.accountId == id).fold(0, (s, l) => s + l.credit);

      expect(debitOf(cash), 1150);
      expect(creditOf(sales), 1000);
      expect(creditOf(vatOutput), 150);
      expect(debitOf(cogs), 600);
      expect(creditOf(inventory), 600);
    });

    test('credit sale debits receivable, not cash', () {
      final e = Journalizer.saleCredit(
        receivableAccountId: receivable,
        salesAccountId: sales,
        vatOutputAccountId: vatOutput,
        inventoryAccountId: inventory,
        cogsAccountId: cogs,
        totalPesewas: 1150,
        netPesewas: 1000,
        taxPesewas: 150,
        costPesewas: 600,
      );
      expect(e.isBalanced, isTrue);
      expect(e.lines.any((l) => l.accountId == receivable && l.debit == 1150),
          isTrue);
      expect(e.lines.any((l) => l.accountId == cash), isFalse);
    });

    test('cash purchase is balanced', () {
      final e = Journalizer.purchaseCash(
        inventoryAccountId: inventory,
        vatInputAccountId: vatInput,
        methodAccountId: cash,
        netPesewas: 1000,
        taxPesewas: 150,
        totalPesewas: 1150,
      );
      expect(e.isBalanced, isTrue);
      expect(e.lines.any((l) => l.accountId == inventory && l.debit == 1000), isTrue);
      expect(e.lines.any((l) => l.accountId == vatInput && l.debit == 150), isTrue);
      expect(e.lines.any((l) => l.accountId == cash && l.credit == 1150), isTrue);
    });

    test('credit purchase posts to payable', () {
      final e = Journalizer.purchaseCredit(
        inventoryAccountId: inventory,
        vatInputAccountId: vatInput,
        payableAccountId: payable,
        netPesewas: 1000,
        taxPesewas: 150,
        totalPesewas: 1150,
      );
      expect(e.isBalanced, isTrue);
      expect(e.lines.any((l) => l.accountId == payable && l.credit == 1150), isTrue);
    });

    test('payment received clears receivable', () {
      final e = Journalizer.paymentReceived(
        methodAccountId: momo,
        receivableAccountId: receivable,
        amountPesewas: 1150,
      );
      expect(e.isBalanced, isTrue);
      expect(e.lines.any((l) => l.accountId == momo && l.debit == 1150), isTrue);
      expect(e.lines.any((l) => l.accountId == receivable && l.credit == 1150), isTrue);
    });

    test('payment made clears payable', () {
      final e = Journalizer.paymentMade(
        payableAccountId: payable,
        methodAccountId: bank,
        amountPesewas: 500,
      );
      expect(e.isBalanced, isTrue);
      expect(e.lines.any((l) => l.accountId == payable && l.debit == 500), isTrue);
      expect(e.lines.any((l) => l.accountId == bank && l.credit == 500), isTrue);
    });

    test('cash expense splits net and input tax', () {
      final e = Journalizer.expenseCash(
        expenseAccountId: rent,
        vatInputAccountId: vatInput,
        methodAccountId: cash,
        amountPesewas: 1150,
        taxInputPesewas: 150,
      );
      expect(e.isBalanced, isTrue);
      expect(e.lines.any((l) => l.accountId == rent && l.debit == 1000), isTrue);
      expect(e.lines.any((l) => l.accountId == vatInput && l.debit == 150), isTrue);
      expect(e.lines.any((l) => l.accountId == cash && l.credit == 1150), isTrue);
    });

    test('credit expense posts to payable', () {
      final e = Journalizer.expenseCredit(
        expenseAccountId: rent,
        vatInputAccountId: vatInput,
        payableAccountId: payable,
        amountPesewas: 1150,
        taxInputPesewas: 150,
      );
      expect(e.isBalanced, isTrue);
      expect(e.lines.any((l) => l.accountId == payable && l.credit == 1150), isTrue);
    });

    test('full credit-sale then payment round-trip nets receivable to zero', () {
      final sale = Journalizer.saleCredit(
        receivableAccountId: receivable,
        salesAccountId: sales,
        vatOutputAccountId: vatOutput,
        inventoryAccountId: inventory,
        cogsAccountId: cogs,
        totalPesewas: 1150,
        netPesewas: 1000,
        taxPesewas: 150,
        costPesewas: 600,
      );
      final payment = Journalizer.paymentReceived(
        methodAccountId: cash,
        receivableAccountId: receivable,
        amountPesewas: 1150,
      );

      final net = (sale.lines + payment.lines).fold<int>(
          0, (s, l) => s + (l.accountId == receivable ? l.debit - l.credit : 0));
      expect(net, 0);
    });

    test('JournalLine never holds both debit and credit', () {
      expect(
        () => JournalLine(accountId: cash, debit: 1, credit: 1),
        throwsA(anything),
      );
    });
  });
}
