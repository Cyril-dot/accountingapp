import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app_providers.dart';
import '../home/home_shell.dart';
import '../lock/lock_screen.dart';
import '../onboarding/onboarding_screen.dart';

/// Decides between onboarding, the PIN lock, and the app shell.
class RootScreen extends ConsumerWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shop = ref.watch(currentShopProvider);
    final user = ref.watch(currentUserProvider);
    return shop.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text('Failed to load: $e'))),
      data: (shop) {
        if (shop == null) return const OnboardingScreen();
        if (user == null) return LockScreen(shopId: shop.id);
        return HomeShell(shopId: shop.id);
      },
    );
  }
}
