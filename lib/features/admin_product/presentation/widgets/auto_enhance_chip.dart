import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class AutoEnhanceChip extends StatelessWidget {
  final bool enabled;
  final VoidCallback onTap;
  const AutoEnhanceChip({
    super.key,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: enabled
              ? AppColors.gold
              : Colors.black.withValues(alpha: 0.45),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.hd_rounded,
              size: 14,
              color: enabled
                  ? (isDark ? AppColors.darkBackground : AppColors.white)
                  : AppColors.white,
            ),
            const SizedBox(width: 4),
            Text(
              'Auto Enhance',
              style: TextStyle(
                fontFamily: AppTextStyles.fontFamily,
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: enabled
                    ? (isDark ? AppColors.darkBackground : AppColors.white)
                    : AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
