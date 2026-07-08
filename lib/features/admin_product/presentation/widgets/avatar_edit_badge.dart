

import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class AvatarEditBadge extends StatelessWidget {
  const AvatarEditBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      width: 40, height: 40,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 36, height: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.gold.withValues(alpha: 0.15),
            ),
          ),
          Positioned(
            right: -2, bottom: -2,
            child: Container(
              width: 20, height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                border: Border.all(
                  color: isDark ? AppColors.darkBackground : AppColors.white,
                  width: 2,
                ),
              ),
              child: Icon(
                Icons.crop_rounded,
                size: 11,
                color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}