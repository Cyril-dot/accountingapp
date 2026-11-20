import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app_providers.dart';
import '../../core/money.dart';
import '../../domain/models/enums.dart';

class ExpenseScreen extends ConsumerStatefulWidget {
  final int shopId;
  const ExpenseScreen({super.key, required this.shopId});

  @override
  ConsumerState<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends ConsumerState<ExpenseScreen> {
  final _amount = TextEditingController();
  final _tax = TextEditingController();
  int? _accountId;
  int? _methodAccountId;
  bool _busy = false;

  @override
  void dispose() {
    _amount.dispose();
    _tax.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final amount = Money.parse(_amount.text).pesewas;
    if (amount <= 0 || _accountId == null || _methodAccountId == null) return;
    setState(() => _busy = true);
    try {
      await ref.read(expenseServiceProvider).recordCashExpense(
            shopId: widget.shopId,
            expenseAccountId: _accountId!,
            methodAccountId: _methodAccountId!,
            date: DateTime.now(),
            amountPesewas: amount,
            taxInputPesewas:
                _tax.text.trim().isEmpty ? 0 : Money.parse(_tax.text).pesewas,
          );
      if (mounted) {
        setState(() {
          _amount.clear();
          _tax.clear();
        });
        ref.invalidate(dashboardProvider(widget.shopId));
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Expense recorded')));
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final accounts = ref.watch(accountsProvider(widget.shopId));
    final methods = ref.watch(paymentMethodsProvider(widget.shopId));
    final expenseAccounts = accounts.value
            ?.where((a) => a.accountType == AccountType.expense)
            .toList() ??
        const [];

    return Scaffold(
      appBar: AppBar(title: const Text('New expense')),
      body: methods.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (methodList) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextField(
              key: const Key('expenseAmount'),
              controller: _amount,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Amount (GH₵)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              key: const Key('expenseTax'),
              controller: _tax,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Input VAT (GH₵, optional)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<int>(
              key: const Key('expenseAccount'),
              initialValue: _accountId,
              decoration: const InputDecoration(
                labelText: 'Expense category',
                border: OutlineInputBorder(),
              ),
              items: [
                for (final a in expenseAccounts)
                  DropdownMenuItem<int>(value: a.id, child: Text(a.name)),
              ],
              onChanged: (v) => setState(() => _accountId = v),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<int>(
              key: const Key('expenseMethod'),
              initialValue: _methodAccountId,
              decoration: const InputDecoration(
                labelText: 'Paid with',
                border: OutlineInputBorder(),
              ),
              items: [
                for (final m in methodList)
                  DropdownMenuItem<int>(
                      value: m.accountId, child: Text(m.name)),
              ],
              onChanged: (v) => setState(() => _methodAccountId = v),
            ),
            const SizedBox(height: 24),
            FilledButton(
              key: const Key('saveExpense'),
              onPressed: _busy || _accountId == null || _methodAccountId == null
                  ? null
                  : _submit,
              child: const Text('Save expense'),
            ),
          ],
        ),
      ),
    );
  }
}
