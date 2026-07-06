
import 'package:flutter/material.dart';
import 'package:nti_ecommerce_team4/core/theme/app_theme.dart';

class QuantitySectionWithLabel extends StatelessWidget {
  const QuantitySectionWithLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'QUANTITY',
          style: TextStyle(
            color: AppColors.lightTextPrimary,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              IconButton(
                icon:
                const Icon(Icons.remove, size: 18),
                onPressed: () {},
              ),
              const SizedBox(width: 8),
              Text(
                '1',
                style: TextStyle(

                  color: AppColors.lightTextPrimary,
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.add, size: 18),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
