import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class SpecificationRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const SpecificationRow({
    super.key,
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: valueColor ?? AppColors.lightTextPrimary,
            ),
          ),
        ],
      ),
    );
  }
}