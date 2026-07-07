
import 'package:flutter/material.dart';
import 'package:nti_ecommerce_team4/features/products/presentation/widgets/sparkle_favorite_button.dart';

import '../screens/product_details_screen.dart';

class TitleRow extends StatelessWidget {
  const TitleRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ethereal Diamond\nNecklace',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 4),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  'عقد الألماس الأثيري',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w600,
                    color: context.textSecondary,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        const SparkleFavoriteButton(),
      ],
    );
  }
}