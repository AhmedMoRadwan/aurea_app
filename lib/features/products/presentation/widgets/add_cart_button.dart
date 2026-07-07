
import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../screens/product_details_screen.dart';

class AddToCartButton extends StatefulWidget {
  final VoidCallback onAdded;

  const AddToCartButton({super.key, required this.onAdded});

  @override
  State<AddToCartButton> createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  bool added = false;

  void _tap() {
    if (added) return;
    setState(() => added = true);
    widget.onAdded();
    Future.delayed(const Duration(milliseconds: 1600), () {
      if (mounted) setState(() => added = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: _tap,
        style: ElevatedButton.styleFrom(
          backgroundColor: added ? context.success : context.gold,
          foregroundColor: added ? AppColors.white : context.onGold,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 220),
              child: Icon(
                added ? Icons.check_rounded : Icons.shopping_bag_outlined,
                key: ValueKey(added),
                size: 17,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              added ? 'Added' : 'Add to Cart',
              style: AppTextStyles.buttonText.copyWith(
                color: AppColors.white,
                fontSize: 14.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

