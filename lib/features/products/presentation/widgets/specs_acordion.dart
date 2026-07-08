
import 'package:flutter/material.dart';
import 'package:nti_ecommerce_team4/features/products/presentation/widgets/section_label.dart';
import 'package:nti_ecommerce_team4/features/products/presentation/widgets/specs_grid.dart';

import '../screens/product_details_screen.dart';

class SpecsAccordion extends StatefulWidget {
  const SpecsAccordion({super.key});

  @override
  State<SpecsAccordion> createState() => _SpecsAccordionState();
}

class _SpecsAccordionState extends State<SpecsAccordion> {
  bool open = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: context.borderColor),
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          InkWell(
            onTap: () => setState(() => open = !open),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              color: context.surfaceAlt,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SectionLabel(
                    icon: Icons.diamond_outlined,
                    label: 'Specifications',
                  ),
                  AnimatedRotation(
                    turns: open ? 0.5 : 0,
                    duration: const Duration(milliseconds: 250),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 18,
                      color: context.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 280),
            curve: Curves.easeInOut,
            child: SizedBox(
              height: open ? null : 0,
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: SpecsGrid(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
