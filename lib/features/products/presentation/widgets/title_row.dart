import 'package:flutter/material.dart';
import 'package:nti_ecommerce_team4/features/products/presentation/widgets/sparkle_favorite_button.dart';

import '../screens/product_details_screen.dart';

class TitleRow extends StatelessWidget {
  final String name;
  final String arabicName;
  const TitleRow({super.key, required this.name, required this.arabicName});

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
                name,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 4),
              if (arabicName.isNotEmpty)
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    arabicName,
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
