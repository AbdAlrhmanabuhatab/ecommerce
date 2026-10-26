import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_colors.dart';

/// Reusable notched bottom application bar with navigation action buttons.
class CustomEcommerceBottomBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int>? onItemSelected;

  const CustomEcommerceBottomBar({
    super.key,
    this.selectedIndex = 0,
    this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      color: AppColors.surface,
      elevation: 8,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(
              index: 0,
              icon: Icons.home_outlined,
              selectedIcon: Icons.home,
              tooltip: 'Home',
              context: context,
            ),
            _buildNavItem(
              index: 1,
              icon: Icons.favorite_border,
              selectedIcon: Icons.favorite,
              tooltip: 'Favorites',
              context: context,
            ),
            SizedBox(width: 48.w), // Reserved center notch space for docked FAB
            _buildNavItem(
              index: 2,
              icon: Icons.settings_outlined,
              selectedIcon: Icons.settings,
              tooltip: 'Settings',
              context: context,
            ),
            _buildNavItem(
              index: 3,
              icon: Icons.mail_outline,
              selectedIcon: Icons.mail,
              tooltip: 'Messages',
              context: context,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required IconData selectedIcon,
    required String tooltip,
    required BuildContext context,
  }) {
    final isSelected = selectedIndex == index;
    return IconButton(
      tooltip: tooltip,
      icon: Icon(
        isSelected ? selectedIcon : icon,
        size: 26.r,
        color: isSelected ? AppColors.primary : AppColors.textPrimary,
      ),
      onPressed: () {
        if (index == 0 && Navigator.of(context).canPop()) {
          Navigator.of(context).popUntil((route) => route.isFirst);
        }
        onItemSelected?.call(index);
      },
    );
  }
}
