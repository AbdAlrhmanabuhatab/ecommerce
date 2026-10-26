import 'package:flutter/material.dart';
import 'features/home/presentation/screens/home_screen.dart';

export 'features/home/presentation/screens/home_screen.dart';

/// Backward-compatible adapter for [HomeScreen].
/// Preserves legacy routes while utilizing the new clean architecture.
class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}
