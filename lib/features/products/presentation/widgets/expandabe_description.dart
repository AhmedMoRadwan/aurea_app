import 'package:flutter/material.dart';
import '../screens/product_details_screen.dart';

class ExpandableDescription extends StatefulWidget {
  final String description;
  final String arabicDescription;
  const ExpandableDescription({
    super.key,
    required this.description,
    required this.arabicDescription,
  });

  @override
  State<ExpandableDescription> createState() => _ExpandableDescriptionState();
}

class _ExpandableDescriptionState extends State<ExpandableDescription> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    final bodyStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: 13,
          height: 1.8,
          color: context.textSecondary,
        );
    final bodyStyleAr = Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: 14,
          height: 1.8,
          fontWeight: FontWeight.w500,
          color: context.textSecondary,
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.description,
                style: bodyStyle,
                maxLines: expanded ? null : 2,
                overflow: expanded ? TextOverflow.visible : TextOverflow.ellipsis,
              ),
              if (expanded) ...[
                const SizedBox(height: 16),
                const Divider(height: 1, thickness: 0.5),
                const SizedBox(height: 12),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      widget.arabicDescription.isEmpty 
                          ? "لا يوجد وصف باللغة العربية" // Placeholder for debugging
                          : widget.arabicDescription,
                      style: bodyStyleAr,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => setState(() => expanded = !expanded),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                expanded ? 'Show less' : 'Read more',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: context.goldDeep,
                      fontWeight: FontWeight.w700,
                      fontSize: 12.5,
                    ),
              ),
              const SizedBox(width: 4),
              AnimatedRotation(
                turns: expanded ? 0.5 : 0,
                duration: const Duration(milliseconds: 250),
                child: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 16,
                  color: context.goldDeep,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
