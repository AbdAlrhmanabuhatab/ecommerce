import 'package:flutter/material.dart';

/// Centralized application color palette following Material Design 3 guidelines.
/// Ensures consistent branding, high readability, and effortless theme updates.
abstract final class AppColors {
  // Brand / Primary Colors
  static const Color primary = Color(0xFF8E24AA); // Purple
  static const Color primaryLight = Color(0xFFF3E5F5); // Light purple container
  static const Color primaryDark = Color(0xFF5C007A);

  // Accent / Secondary Colors
  static const Color accentOrange = Color(0xFFFF9800);
  static const Color accentOrangeLight = Color(0xFFFFE0B2);
  static const Color accentIndigo = Color(0xFF3F51B5);
  static const Color accentBlueLight = Color(0xFFBBDEFB);

  // Neutral & Surface Colors
  static const Color background = Color(0xFFF8F9FA);
  static const Color surface = Colors.white;
  static const Color cardBackground = Colors.white;
  static const Color imagePlaceholder = Color(0xFFEEEEEE);

  // Text Colors
  static const Color textPrimary = Color(0xFF1E1E24);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textMuted = Color(0xFF9E9E9E);
  static const Color textLight = Colors.white;

  // Feedback Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFC107);
  static const Color error = Color(0xFFE53935);

  // Border & Divider Colors
  static const Color border = Color(0xFFE0E0E0);
  static const Color divider = Color(0xFFEEEEEE);

  // Product Swatch Colors
  static const Color swatchPeach = Color(0xFFFFE0B2);
  static const Color swatchBlack = Color(0xFF212121);
  static const Color swatchPurple = Color(0xFFE1BEE7);
  static const Color swatchBlueGrey = Color(0xFF607D8B);
}
