import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app_providers.dart';
import '../../core/pin_hasher.dart';

/// First-run setup: creates the business, shop, chart of accounts, payment
/// methods and the owner (with a salted PIN hash) in one transaction.
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _businessName = TextEditingController();
  final _shopName = TextEditingController();
  final _phone = TextEditingController();
  final _ownerName = TextEditingController();
  final _pin = TextEditingController();
  final _pinConfirm = TextEditingController();
  bool _busy = false;

  @override
  void dispose() {
    _businessName.dispose();
    _shopName.dispose();
    _phone.dispose();
    _ownerName.dispose();
    _pin.dispose();
    _pinConfirm.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _busy = true);
    final pinHash = PinHasher.hash(_pin.text.trim());
    try {
      await ref.read(onboardingServiceProvider).createBusiness(
            businessName: _businessName.text.trim(),
            shopName: _shopName.text.trim().isEmpty
                ? _businessName.text.trim()
                : _shopName.text.trim(),
            ownerName: _ownerName.text.trim(),
            ownerPinHash: pinHash,
            phone: _phone.text.trim().isEmpty ? null : _phone.text.trim(),
          );
      ref.invalidate(currentShopProvider);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Could not save: $e')));
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    return Scaffold(
      appBar: AppBar(title: const Text('Set up SikaBooks')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Business', style: titleStyle),
                const SizedBox(height: 12),
                TextFormField(
                  key: const Key('businessName'),
                  controller: _businessName,
                  decoration: const InputDecoration(
                    labelText: 'Business name',
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (v) =>
                      (v == null || v.trim().isEmpty) ? 'Required' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  key: const Key('shopName'),
                  controller: _shopName,
                  decoration: const InputDecoration(
                    labelText: 'Shop name (optional)',
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  key: const Key('phone'),
                  controller: _phone,
                  decoration: const InputDecoration(
                    labelText: 'Phone (optional)',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 24),
                Text('Owner', style: titleStyle),
                const SizedBox(height: 12),
                TextFormField(
                  key: const Key('ownerName'),
                  controller: _ownerName,
                  decoration: const InputDecoration(
                    labelText: 'Your name',
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (v) =>
                      (v == null || v.trim().isEmpty) ? 'Required' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  key: const Key('pin'),
                  controller: _pin,
                  decoration: const InputDecoration(
                    labelText: 'PIN (at least 4 digits)',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  validator: (v) =>
                      (v == null || v.length < 4) ? 'At least 4 digits' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  key: const Key('pinConfirm'),
                  controller: _pinConfirm,
                  decoration: const InputDecoration(
                    labelText: 'Confirm PIN',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  validator: (v) => v != _pin.text ? 'PINs do not match' : null,
                ),
                const SizedBox(height: 24),
                FilledButton(
                  key: const Key('startButton'),
                  onPressed: _busy ? null : _submit,
                  child: _busy
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Start'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
