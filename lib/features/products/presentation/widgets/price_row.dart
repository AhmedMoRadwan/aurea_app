import 'package:flutter/material.dart';

import '../screens/product_details_screen.dart';

class PriceRow extends StatelessWidget {
  final double price;
  final int discountPercentage;
  const PriceRow({
    super.key,
    required this.price,
    required this.discountPercentage,
  });

  @override
  Widget build(BuildContext context) {
    final double originalPrice =
        discountPercentage > 0 ? price / (1 - (discountPercentage / 100)) : price;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          'SAR ${price.toStringAsFixed(0)}',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: 27,
                color: context.textPrimary,
              ),
        ),
        if (discountPercentage > 0) ...[
          const SizedBox(width: 10),
          Text(
            'SAR ${originalPrice.toStringAsFixed(0)}',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 15,
                  color: context.textSecondary,
                  decoration: TextDecoration.lineThrough,
                ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
            decoration: BoxDecoration(
              color: context.successBg,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Save $discountPercentage%',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w700,
                    color: context.success,
                  ),
            ),
          ),
        ],
      ],
    );
  }
}
