import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key, required this.onSkip});

  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSkip,
      child: Text(
        'Skip',
        style: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(color: AppColors.darkTextSecondary),
      ),
    );
  }
}
