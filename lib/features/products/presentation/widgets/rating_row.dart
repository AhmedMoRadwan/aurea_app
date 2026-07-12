import 'package:flutter/material.dart';
import 'package:nti_ecommerce_team4/features/products/presentation/widgets/start_rating.dart';

import '../screens/product_details_screen.dart';

class RatingRow extends StatelessWidget {
  final double rating;
  final int reviewsCount;
  const RatingRow({super.key, required this.rating, required this.reviewsCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StarRating(rating: rating, size: 14),
        const SizedBox(width: 8),
        Text(
          '$rating',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 13,
            color: context.textPrimary,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          '($reviewsCount reviews)',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 12.5,
            color: context.textSecondary,
          ),
        ),
      ],
    );
  }
}