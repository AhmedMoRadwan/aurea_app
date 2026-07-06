import 'package:flutter/material.dart';
import 'package:nti_ecommerce_team4/core/theme/app_theme.dart';

class PasswordConditions extends StatelessWidget {
  const PasswordConditions({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Icon(Icons.check_circle_outline, size: 13),
        Text(
          text,
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.lightTextSecondary,
          ),
        ),
      ],
    );
  }
}
