import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

/// Rating pills row showing average score, customer satisfaction, and total reviews.
class ProductRatingsRow extends StatelessWidget {
  final double rating;
  final double satisfactionRate;
  final int reviewsCount;

  const ProductRatingsRow({
    super.key,
    required this.rating,
    required this.satisfactionRate,
    required this.reviewsCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: Row(
        children: [
          // Star Rating Pill
          _buildRatingPill(
            icon: Icons.star,
            iconColor: AppColors.accentOrange,
            backgroundColor: AppColors.accentOrangeLight.withValues(alpha: 0.5),
            label: rating.toStringAsFixed(1),
          ),
          SizedBox(width: 10.w),

          // Satisfaction / Thumbs up Pill
          _buildRatingPill(
            icon: Icons.thumb_up,
            iconColor: AppColors.accentIndigo,
            backgroundColor: AppColors.accentBlueLight.withValues(alpha: 0.5),
            label: satisfactionRate.toStringAsFixed(1),
          ),
          SizedBox(width: 12.w),

          // Reviews Count
          Text(
            '$reviewsCount Reviews',
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingPill({
    required IconData icon,
    required Color iconColor,
    required Color backgroundColor,
    required String label,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: iconColor, size: 16.r),
          SizedBox(width: 4.w),
          Text(
            label,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
