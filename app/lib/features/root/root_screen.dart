import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app_providers.dart';
import '../home/home_shell.dart';
import '../lock/lock_screen.dart';
import '../onboarding/onboarding_screen.dart';

/// Decides between onboarding, the PIN lock, and the app shell.
class RootScreen extends ConsumerStatefulWidget {
  const RootScreen({super.key});

  @override
  ConsumerState<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends ConsumerState<RootScreen> {
  bool _locked = true;

  @override
  Widget build(BuildContext context) {
    final shop = ref.watch(currentShopProvider);
    return shop.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text('Failed to load: $e'))),
      data: (shop) {
        if (shop == null) return const OnboardingScreen();
        if (_locked) {
          return LockScreen(
            shopId: shop.id,
            onUnlock: () => setState(() => _locked = false),
          );
        }
        return HomeShell(shopId: shop.id);
      },
    );
  }
}
