import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

/// Bottom action bar featuring quantity counter, buy-now button, and wishlist toggle.
class ProductBottomActionBar extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback? onBuyNow;
  final bool isFavorite;
  final VoidCallback? onToggleFavorite;

  const ProductBottomActionBar({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
    this.onBuyNow,
    this.isFavorite = false,
    this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            // Quantity Counter Pill
            Container(
              height: 44.h,
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.r),
                border: Border.all(color: AppColors.primary, width: 1.5),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: quantity > 0 ? onDecrement : null,
                    icon: Icon(
                      Icons.remove,
                      size: 16.r,
                      color: quantity > 0
                          ? AppColors.primary
                          : AppColors.textMuted,
                    ),
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(
                      minWidth: 32.w,
                      minHeight: 32.h,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    child: Text(
                      '$quantity',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: onIncrement,
                    icon: Icon(Icons.add, size: 16.r, color: AppColors.primary),
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(
                      minWidth: 32.w,
                      minHeight: 32.h,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.w),

            // Buy Now Primary Button
            Expanded(
              child: ElevatedButton.icon(
                onPressed: onBuyNow ?? () {},
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: AppColors.textLight,
                  size: 18.r,
                ),
                label: Text(
                  'Buy now',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textLight,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  elevation: 3,
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
              ),
            ),
            SizedBox(width: 8.w),

            // Favorite Button
            IconButton(
              onPressed: onToggleFavorite ?? () {},
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : AppColors.primary,
                size: 30.r,
              ),
              tooltip: 'Add to Wishlist',
            ),
          ],
        ),
      ),
    );
  }
}
