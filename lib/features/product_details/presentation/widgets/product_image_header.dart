import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

/// Product detail header image with Hero animation and clean background.
class ProductImageHeader extends StatelessWidget {
  final String heroTag;
  final String imagePath;
  final double? height;

  const ProductImageHeader({
    super.key,
    required this.heroTag,
    required this.imagePath,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height ?? 320.h,
      color: AppColors.surface,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Hero(
        tag: heroTag,
        child: Image.asset(
          imagePath,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Center(
            child: Icon(
              Icons.broken_image_outlined,
              size: 64.r,
              color: AppColors.textMuted,
            ),
          ),
        ),
      ),
    );
  }
}
