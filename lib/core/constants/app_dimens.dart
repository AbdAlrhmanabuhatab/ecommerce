import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Centralized UI dimensions, paddings, and border radiuses.
/// Encourages visual harmony, design consistency, and responsive scalability.
abstract final class AppDimens {
  // Padding & Spacing
  static double get spacing4 => 4.r;
  static double get spacing8 => 8.r;
  static double get spacing10 => 10.r;
  static double get spacing12 => 12.r;
  static double get spacing16 => 16.r;
  static double get spacing20 => 20.r;
  static double get spacing24 => 24.r;
  static double get spacing32 => 32.r;

  // Border Radiuses
  static double get radiusSmall => 8.r;
  static double get radiusMedium => 16.r;
  static double get radiusLarge => 24.r;
  static double get radiusPill => 50.r;
  static double get radiusCircle => 200.r;

  // Icon Sizes
  static double get iconSmall => 18.r;
  static double get iconMedium => 24.r;
  static double get iconLarge => 30.r;
  static double get iconXLarge => 40.r;
}
