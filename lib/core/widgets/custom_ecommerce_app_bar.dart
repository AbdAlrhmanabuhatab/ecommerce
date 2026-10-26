import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_colors.dart';
import 'badge_icon.dart';

/// Reusable application header bar with consistent e-commerce branding,
/// notification bell, and favorite badge counter.
class CustomEcommerceAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final bool showBrandLogo;
  final String title;
  final int favoriteCount;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onFavoriteTap;

  const CustomEcommerceAppBar({
    super.key,
    this.showBrandLogo = true,
    this.title = 'Wizo',
    this.favoriteCount = 3,
    this.onNotificationTap,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 16.w,
      title: Row(
        children: [
          if (Navigator.of(context).canPop()) ...[
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, size: 20),
              onPressed: () => Navigator.of(context).pop(),
              tooltip: 'Back',
            ),
            SizedBox(width: 4.w),
          ],
          if (showBrandLogo) ...[
            Icon(Icons.diamond_outlined, color: AppColors.primary, size: 32.r),
            SizedBox(width: 8.w),
            Text(
              title,
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
                letterSpacing: 0.5,
              ),
            ),
          ] else ...[
            Expanded(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ],
          if (showBrandLogo) const Spacer(),
          IconButton(
            onPressed: onNotificationTap ?? () {},
            icon: Icon(
              Icons.notifications_outlined,
              size: 28.r,
              color: AppColors.accentOrange,
            ),
            tooltip: 'Notifications',
          ),
          SizedBox(width: 6.w),
          BadgeIcon(
            icon: Icons.favorite_border,
            count: favoriteCount,
            iconSize: 26.r,
            iconColor: AppColors.textPrimary,
            badgeColor: AppColors.primary,
            onTap: onFavoriteTap,
          ),
          SizedBox(width: 8.w),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
