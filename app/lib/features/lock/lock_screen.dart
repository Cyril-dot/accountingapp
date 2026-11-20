import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app_providers.dart';

/// Asks for the shop PIN before showing the books. On success, calls [onUnlock].
class LockScreen extends ConsumerStatefulWidget {
  final int shopId;
  final VoidCallback onUnlock;
  const LockScreen({super.key, required this.shopId, required this.onUnlock});

  @override
  ConsumerState<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends ConsumerState<LockScreen> {
  final _pin = TextEditingController();
  String? _error;
  bool _busy = false;

  @override
  void dispose() {
    _pin.dispose();
    super.dispose();
  }

  Future<void> _unlock() async {
    final pin = _pin.text.trim();
    if (pin.isEmpty) return;
    setState(() => _busy = true);
    final user = await ref.read(authServiceProvider).verifyPin(widget.shopId, pin);
    if (!mounted) return;
    if (user != null) {
      widget.onUnlock();
    } else {
      setState(() {
        _busy = false;
        _error = 'Wrong PIN';
        _pin.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(Icons.lock_outline,
                  size: 64, color: Theme.of(context).colorScheme.primary),
              const SizedBox(height: 16),
              Text('SikaBooks',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 24),
              TextField(
                key: const Key('pinField'),
                controller: _pin,
                obscureText: true,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: 'Enter PIN',
                  border: const OutlineInputBorder(),
                  errorText: _error,
                ),
                onSubmitted: (_) => _unlock(),
              ),
              const SizedBox(height: 16),
              FilledButton(
                key: const Key('unlockButton'),
                onPressed: _busy ? null : _unlock,
                child: _busy
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Unlock'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
