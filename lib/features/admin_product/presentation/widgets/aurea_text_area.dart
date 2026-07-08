import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class AureaTextArea extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final bool rtl;
  const AureaTextArea({super.key, required this.label, required this.hint, required this.controller, this.rtl = false});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textPrimary = isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final textSecondary = isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;
    final borderColor = isDark ? AppColors.darkBorder : AppColors.lightBorder;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.bodySmall.copyWith(fontWeight: FontWeight.w600, color: textSecondary)),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          maxLines: 4,
          textDirection: rtl ? TextDirection.rtl : TextDirection.ltr,
          textAlign: rtl ? TextAlign.right : TextAlign.left,
          style: AppTextStyles.bodyMedium.copyWith(color: textPrimary),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(14),
            hintText: hint,
            hintStyle: AppTextStyles.bodyMedium.copyWith(color: textSecondary),
            filled: true,
            fillColor: isDark ? AppColors.darkSurface : AppColors.lightSurface,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: AppColors.gold, width: 1.4),
            ),
          ),
        ),
      ],
    );
  }
}
