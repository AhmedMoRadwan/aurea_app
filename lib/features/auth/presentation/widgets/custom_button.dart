import 'package:flutter/material.dart';
import 'package:nti_ecommerce_team4/core/theme/themes.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonText,
    required this.onButtonPressed,
  });

  final String buttonText;

  final VoidCallback onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonPressed,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.darkGold,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
