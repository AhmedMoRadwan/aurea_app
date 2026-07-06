import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final Color? imageColor;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    this.imageColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            height: 140,
            width: double.infinity,
            color: imageColor ?? Colors.grey[200],
            child: Center(
              child: Icon(Icons.image, color: Colors.white54, size: 48),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          title,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.lightTextPrimary,
          ),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 6),
        Text(
          price,
          style: TextStyle(
            color: AppColors.gold,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}