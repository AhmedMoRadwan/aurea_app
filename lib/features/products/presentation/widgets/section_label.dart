
import 'package:flutter/material.dart';

import '../screens/product_details_screen.dart';

class SectionLabel extends StatelessWidget {
  final IconData icon;
  final String label;

  const SectionLabel({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14, color: context.gold),
        const SizedBox(width: 8),
        Text(
          label.toUpperCase(),
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
            color: context.textMuted,
          ),
        ),
      ],
    );
  }
}
