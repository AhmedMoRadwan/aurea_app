import 'package:flutter/material.dart';
import 'package:nti_ecommerce_team4/features/products/presentation/widgets/start_rating.dart';

import '../screens/product_details_screen.dart';

class RatingRow extends StatelessWidget {
  const RatingRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const StarRating(rating: 4.9, size: 14),
        const SizedBox(width: 8),
        Text(
          '4.9',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 13,
            color: context.textPrimary,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          '(120 reviews)',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 12.5,
            color: context.textSecondary,
          ),
        ),
      ],
    );
  }
}