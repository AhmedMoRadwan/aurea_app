import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class AureaTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? suffix;
  final bool rtl;

  const AureaTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.keyboardType,
    this.suffix,
    this.rtl = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textPrimary = isDark
        ? AppColors.darkTextPrimary
        : AppColors.lightTextPrimary;
    final textSecondary = isDark
        ? AppColors.darkTextSecondary
        : AppColors.lightTextSecondary;
    final borderColor = isDark ? AppColors.darkBorder : AppColors.lightBorder;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.bodySmall.copyWith(
            fontWeight: FontWeight.w600,
            color: textSecondary,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          textDirection: rtl ? TextDirection.rtl : TextDirection.ltr,
          textAlign: rtl ? TextAlign.right : TextAlign.left,
          style: AppTextStyles.bodyMedium.copyWith(color: textPrimary),
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 13,
            ),
            hintText: hint,
            hintStyle: AppTextStyles.bodyMedium.copyWith(color: textSecondary),
            suffixText: suffix,
            suffixStyle: AppTextStyles.bodySmall.copyWith(
              color: isDark ? AppColors.darkTextMuted : const Color(0xFFB8860B),
              fontWeight: FontWeight.w700,
            ),
            filled: true,
            fillColor: isDark ? AppColors.darkSurface : AppColors.lightSurface,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: BorderSide(color: borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: const BorderSide(color: AppColors.gold, width: 1.4),
            ),
          ),
        ),
      ],
    );
  }
}
