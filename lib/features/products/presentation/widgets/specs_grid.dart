import 'package:flutter/material.dart';

import '../screens/product_details_screen.dart';

class SpecsGrid extends StatelessWidget {
  const SpecsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    Widget item(String k, String v, {bool accent = false}) => Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            k.toUpperCase(),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 11,
              letterSpacing: 0.6,
              color: context.textSecondary,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            v,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: accent ? context.success : context.textPrimary,
            ),
          ),
        ],
      ),
    );
    return Column(
      children: [
        Row(
          children: [
            item('Material', '18K Solid Gold'),
            item('Weight', '4.2g'),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            item('Availability', 'In Stock', accent: true),
            item('SKU', 'AU-882'),
          ],
        ),
      ],
    );
  }
}
