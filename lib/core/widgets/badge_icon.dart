import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_colors.dart';

/// A reusable badge widget that places a numbered notification or counter badge
/// over any given icon.
class BadgeIcon extends StatelessWidget {
  final IconData icon;
  final int count;
  final VoidCallback? onTap;
  final Color iconColor;
  final Color badgeColor;
  final Color badgeTextColor;
  final double? iconSize;
  final double topOffset;
  final double rightOffset;

  const BadgeIcon({
    super.key,
    required this.icon,
    required this.count,
    this.onTap,
    this.iconColor = AppColors.textPrimary,
    this.badgeColor = AppColors.primary,
    this.badgeTextColor = AppColors.textLight,
    this.iconSize,
    this.topOffset = -4,
    this.rightOffset = -4,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveIconSize = iconSize ?? 28.r;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50.r),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Icon(icon, size: effectiveIconSize, color: iconColor),
          if (count > 0)
            Positioned(
              right: rightOffset,
              top: topOffset,
              child: Container(
                padding: EdgeInsets.all(3.r),
                constraints: BoxConstraints(minWidth: 16.w, minHeight: 16.h),
                decoration: BoxDecoration(
                  color: badgeColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1.5),
                ),
                child: Center(
                  child: Text(
                    count > 99 ? '99+' : count.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: badgeTextColor,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                      height: 1.0,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
