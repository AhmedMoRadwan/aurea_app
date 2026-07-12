import 'package:flutter/material.dart';

import '../screens/product_details_screen.dart';

class ExpandableDescription extends StatefulWidget {
  final String description;
  const ExpandableDescription({super.key, required this.description});

  @override
  State<ExpandableDescription> createState() => _ExpandableDescriptionState();
}

class _ExpandableDescriptionState extends State<ExpandableDescription> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    final bodyStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontSize: 13,
      height: 2,
      color: context.textSecondary,
      overflow: TextOverflow.ellipsis,
    );
    // final bodyStyleAr = Theme.of(context).textTheme.bodyMedium?.copyWith(
    //   fontSize: 13.3,
    //   height: 1.9,
    //   color: context.textSecondary,
    //   overflow: TextOverflow.fade,
    // );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          alignment: Alignment.topLeft,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: expanded ? 400 : 62),
            child: ClipRect(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.description, style: bodyStyle),
                  // if (expanded) ...[
                  //   const SizedBox(height: 10),
                  //   Directionality(
                  //     textDirection: TextDirection.rtl,
                  //     child: Text(ar, style: bodyStyleAr),
                  //   ),
                  // ],
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => setState(() => expanded = !expanded),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                expanded ? 'Read less' : 'Read more',
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
