import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/root/root_screen.dart';

void main() {
  runApp(const ProviderScope(child: SikaBooksApp()));
}

class SikaBooksApp extends StatelessWidget {
  const SikaBooksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SikaBooks',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1B5E20)),
        useMaterial3: true,
      ),
      home: const RootScreen(),
    );
  }
}
