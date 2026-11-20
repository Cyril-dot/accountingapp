import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app_providers.dart';
import '../../core/money.dart';
import '../../domain/models/enums.dart';

class PaymentScreen extends ConsumerStatefulWidget {
  final int shopId;
  const PaymentScreen({super.key, required this.shopId});

  @override
  ConsumerState<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends ConsumerState<PaymentScreen> {
  final _amount = TextEditingController();
  PaymentDirection _direction = PaymentDirection.received;
  int? _partyId;
  int? _methodAccountId;
  bool _busy = false;

  @override
  void dispose() {
    _amount.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final amount = Money.parse(_amount.text).pesewas;
    if (amount <= 0 || _partyId == null || _methodAccountId == null) return;
    setState(() => _busy = true);
    try {
      final payments = ref.read(paymentServiceProvider);
      if (_direction == PaymentDirection.received) {
        await payments.recordReceived(
          shopId: widget.shopId,
          partyId: _partyId!,
          methodAccountId: _methodAccountId!,
          date: DateTime.now(),
          amountPesewas: amount,
        );
      } else {
        await payments.recordMade(
          shopId: widget.shopId,
          partyId: _partyId!,
          methodAccountId: _methodAccountId!,
          date: DateTime.now(),
          amountPesewas: amount,
        );
      }
      if (mounted) {
        setState(() {
          _amount.clear();
          _partyId = null;
          _methodAccountId = null;
        });
        ref.invalidate(dashboardProvider(widget.shopId));
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Payment recorded')));
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final parties = ref.watch(partiesProvider(widget.shopId));
    final methods = ref.watch(paymentMethodsProvider(widget.shopId));

    return Scaffold(
      appBar: AppBar(title: const Text('New payment')),
      body: parties.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (partyList) => methods.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('Error: $e')),
          data: (methodList) {
            final relevant = _direction == PaymentDirection.received
                ? partyList.where((p) => p.partyKind != PartyKind.supplier).toList()
                : partyList.toList();
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                SegmentedButton<PaymentDirection>(
                  segments: const [
                    ButtonSegment(
                        value: PaymentDirection.received,
                        label: Text('Received')),
                    ButtonSegment(
                        value: PaymentDirection.made, label: Text('Made')),
                  ],
                  selected: {_direction},
                  onSelectionChanged: (s) => setState(() {
                    _direction = s.first;
                    _partyId = null;
                  }),
                ),
                const SizedBox(height: 16),
                TextField(
                  key: const Key('paymentAmount'),
                  controller: _amount,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Amount (GH₵)',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<int>(
                  key: const Key('paymentParty'),
                  initialValue: _partyId,
                  decoration: const InputDecoration(
                    labelText: 'Customer / Supplier',
                    border: OutlineInputBorder(),
                  ),
                  items: [
                    for (final p in relevant)
                      DropdownMenuItem<int>(value: p.id, child: Text(p.name)),
                  ],
                  onChanged: (v) => setState(() => _partyId = v),
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<int>(
                  key: const Key('paymentMethod'),
                  initialValue: _methodAccountId,
                  decoration: const InputDecoration(
                    labelText: 'Payment method',
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
                  key: const Key('savePayment'),
                  onPressed: _busy ||
                          _partyId == null ||
                          _methodAccountId == null
                      ? null
                      : _submit,
                  child: const Text('Save payment'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
