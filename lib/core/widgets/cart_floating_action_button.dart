import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_colors.dart';

/// Floating Action Button with an overlapping badge counter for shopping cart items.
class CartFloatingActionButton extends StatelessWidget {
  final int count;
  final VoidCallback? onPressed;

  const CartFloatingActionButton({
    super.key,
    required this.count,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        FloatingActionButton(
          heroTag: 'ecommerce_cart_fab',
          elevation: 4,
          backgroundColor: AppColors.surface,
          shape: const CircleBorder(),
          onPressed: onPressed ?? () {},
          child: Icon(
            Icons.shopping_bag_outlined,
            color: AppColors.textPrimary,
            size: 26.r,
          ),
        ),
        if (count > 0)
          Positioned(
            right: 0,
            top: -2,
            child: Container(
              padding: EdgeInsets.all(5.r),
              constraints: BoxConstraints(minWidth: 20.w, minHeight: 20.h),
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Center(
                child: Text(
                  count > 99 ? '99+' : count.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.textLight,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.bold,
                    height: 1.0,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
