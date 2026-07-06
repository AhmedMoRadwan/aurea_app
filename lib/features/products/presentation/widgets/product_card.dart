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
      children: [
        Container(
          height: 140,
          decoration: BoxDecoration(
            color: imageColor ?? Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          title,
          style: TextStyle(

            color: AppColors.lightTextPrimary,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          price,
          style: TextStyle(
            color: AppColors.gold,
          ),
        ),
      ],
    );
  }
}