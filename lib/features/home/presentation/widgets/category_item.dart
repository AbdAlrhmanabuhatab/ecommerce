import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../data/models/category_model.dart';

/// Single category icon and label widget.
class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  final VoidCallback? onTap;

  const CategoryItem({super.key, required this.category, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 58.r,
              height: 58.r,
              decoration: BoxDecoration(
                color: AppColors.accentOrangeLight.withValues(alpha: 0.35),
                shape: BoxShape.circle,
              ),
              child: Icon(
                category.icon,
                size: 28.r,
                color: category.iconColor ?? AppColors.accentOrange,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              category.name,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
