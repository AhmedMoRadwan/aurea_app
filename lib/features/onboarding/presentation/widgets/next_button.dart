import 'package:flutter/material.dart';
import 'package:nti_ecommerce_team4/core/theme/themes.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onNext,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.darkBg,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Text(
              'NEXT',
              style: Theme.of(
                context,
              ).textTheme.labelLarge?.copyWith(color:AppColors.lightBg),
            ),
            const SizedBox(width: 8),
            Icon(Icons.arrow_forward, color:AppColors.lightBg, size: 18),
          ],
        ),
      ),
    );
  }
}
