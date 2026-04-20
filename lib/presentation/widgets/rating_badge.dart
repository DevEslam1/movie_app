import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_dimensions.dart';
import '../../core/theme/app_text_styles.dart';

class RatingBadge extends StatelessWidget {
  final String rating;
  final bool showLabel;

  const RatingBadge({
    super.key,
    required this.rating,
    this.showLabel = false,
  });

  @override
  Widget build(BuildContext context) {
    if (rating == 'N/A' || rating.isEmpty) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.s,
        vertical: AppDimensions.xs,
      ),
      decoration: BoxDecoration(
        color: AppColors.rating.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(AppDimensions.radiusS),
        border: Border.all(
          color: AppColors.rating.withValues(alpha: 0.5),
          width: 0.5,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.star_rounded,
            color: AppColors.rating,
            size: 14,
          ),
          const SizedBox(width: 4),
          Text(
            rating,
            style: AppTextStyles.labelMedium.copyWith(
              color: AppColors.rating,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (showLabel) ...[
            const SizedBox(width: 4),
            Text(
              'IMDb',
              style: AppTextStyles.labelSmall.copyWith(
                color: AppColors.rating.withValues(alpha: 0.7),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
