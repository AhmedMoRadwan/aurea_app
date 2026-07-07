import 'package:flutter/cupertino.dart';
import 'package:nti_ecommerce_team4/features/products/presentation/widgets/related_card.dart';

import '../screens/product_details_screen.dart';

class RelatedRail extends StatelessWidget {
  final void Function(String name) onQuickAdd;
  final VoidCallback onQuickRemove;

  const RelatedRail({
    super.key,
    required this.onQuickAdd,
    required this.onQuickRemove,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: relatedItems.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, i) {
          final item = relatedItems[i];
          return RelatedCard(
            item: item,
            onQuickAdd: onQuickAdd,
            onQuickRemove: onQuickRemove,
          );
        },
      ),
    );
  }
}
