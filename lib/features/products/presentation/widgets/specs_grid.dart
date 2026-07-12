import 'package:flutter/material.dart';
import 'package:nti_ecommerce_team4/features/products/data/models/product_model.dart';
import '../screens/product_details_screen.dart';

class SpecsGrid extends StatelessWidget {
  final ProductItem product;
  const SpecsGrid({super.key, required this.product});

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
            item('Material', product.color.isEmpty ? 'Solid Gold' : product.color),
            item('Weight', '${product.weight}g'),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            item(
              'Availability',
              product.stock > 0 ? 'In Stock' : 'Out of Stock',
              accent: product.stock > 0,
            ),
            item('SKU', product.productCode),
          ],
        ),
      ],
    );
  }
}
