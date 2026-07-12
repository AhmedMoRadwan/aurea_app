import 'package:flutter/material.dart';

import '../screens/product_details_screen.dart';

class PriceRow extends StatelessWidget {
  final double price;
  const PriceRow({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          '\$$price',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontSize: 27,
            color: context.textPrimary,
          ),
        ),
        // const SizedBox(width: 10),
        // Text(
        //   '\$5,200',
        //   style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        //     fontSize: 15,
        //     color: context.textSecondary,
        //     decoration: TextDecoration.lineThrough,
        //   ),
        // ),
        const Spacer(),
        // Container(
        //   padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
        //   decoration: BoxDecoration(
        //     color: context.successBg,
        //     borderRadius: BorderRadius.circular(20),
        //   ),
        //   child: Text(
        //     'Save 15%',
        //     style: Theme.of(context).textTheme.bodySmall?.copyWith(
        //       fontSize: 11.5,
        //       fontWeight: FontWeight.w700,
        //       color: context.success,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}