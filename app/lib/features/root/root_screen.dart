import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app_providers.dart';
import '../dashboard/dashboard_screen.dart';
import '../onboarding/onboarding_screen.dart';

/// Decides between onboarding and the dashboard based on whether a shop exists.
class RootScreen extends ConsumerWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shop = ref.watch(currentShopProvider);
    return shop.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text('Failed to load: $e'))),
      data: (shop) => shop == null
          ? const OnboardingScreen()
          : DashboardScreen(shopId: shop.id),
    );
  }
}
