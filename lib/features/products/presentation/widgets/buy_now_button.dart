import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../screens/product_details_screen.dart';

class BuyNowButton extends StatelessWidget {
  final VoidCallback onTap;

  const BuyNowButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final bg = context.isDark
        ? AppColors.darkSurfaceAlt
        : AppColors.lightTextPrimary;
    final fg = context.isDark ? AppColors.darkTextPrimary : AppColors.white;
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: bg,
          foregroundColor: fg,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Text(
          'Buy Now',
          style: AppTextStyles.buttonText.copyWith(fontSize: 14.5),
        ),
      ),
    );
  }
}