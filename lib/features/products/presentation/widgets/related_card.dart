import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../screens/product_details_screen.dart';

class RelatedCard extends StatefulWidget {
  final RelatedItem item;
  final void Function(String name) onQuickAdd;
  final VoidCallback onQuickRemove;

  const RelatedCard({super.key, 
    required this.item,
    required this.onQuickAdd,
    required this.onQuickRemove,
  });

  @override
  State<RelatedCard> createState() => _RelatedCardState();
}

class _RelatedCardState extends State<RelatedCard> {
  bool added = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 148,
      decoration: BoxDecoration(
        border: Border.all(color: context.borderColor),
        borderRadius: BorderRadius.circular(14),
        color: context.cardColor,
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 120,
                width: double.infinity,
                child: Image.network(widget.item.image, fit: BoxFit.cover),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () {
                    setState(() => added = !added);
                    if (added) {
                      widget.onQuickAdd(widget.item.name);
                    } else {
                      widget.onQuickRemove();
                    }
                  },
                  child: Container(
                    width: 26,
                    height: 26,
                    decoration: BoxDecoration(
                      color: added
                          ? context.success
                          : Colors.white.withValues(alpha: 0.9),
                      shape: BoxShape.circle,
                      boxShadow: const [
                        BoxShadow(color: Color(0x26000000), blurRadius: 6),
                      ],
                    ),
                    child: Icon(
                      added ? Icons.check_rounded : Icons.add_rounded,
                      size: 13,
                      color: added ? Colors.white : AppColors.lightTextPrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 9, 10, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.item.name,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 12.2,
                    fontWeight: FontWeight.w600,
                    color: context.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.item.price,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w700,
                    color: context.goldDeep,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
