import 'package:flutter/material.dart';
import 'package:nti_ecommerce_team4/features/products/presentation/widgets/section_label.dart';

import '../screens/product_details_screen.dart';

class QuantityStepper extends StatelessWidget {
  final int value;
  final ValueChanged<int> onChanged;

  const QuantityStepper({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    Widget button(IconData icon, VoidCallback? onTap) => InkWell(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        color: context.surfaceAlt,
        alignment: Alignment.center,
        child: Icon(
          icon,
          size: 16,
          color: onTap == null ? context.textSecondary : context.textPrimary,
        ),
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SectionLabel(icon: Icons.add_box_outlined, label: 'Quantity'),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: context.borderColor),
            borderRadius: BorderRadius.circular(12),
          ),
          clipBehavior: Clip.antiAlias,
          child: Row(
            children: [
              button(
                Icons.remove_rounded,
                value > 1 ? () => onChanged(value - 1) : null,
              ),
              SizedBox(
                width: 38,
                child: Text(
                  '$value',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.5,
                    color: context.textPrimary,
                  ),
                ),
              ),
              button(Icons.add_rounded, () => onChanged(value + 1)),
            ],
          ),
        ),
      ],
    );
  }
}
