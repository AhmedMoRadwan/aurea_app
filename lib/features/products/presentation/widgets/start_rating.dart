import 'package:flutter/material.dart';

import '../screens/product_details_screen.dart';
import 'fraction_clipper.dart';

class StarRating extends StatelessWidget {
  final double rating; // e.g. 4.9
  final double size;

  const StarRating({super.key, required this.rating, this.size = 16});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (i) {
        final fill = (rating - i).clamp(0, 1).toDouble();
        return Padding(
          padding: const EdgeInsets.only(right: 2),
          child: SizedBox(
            width: size,
            height: size,
            child: Stack(
              children: [
                Icon(
                  Icons.star_rounded,
                  size: size,
                  color: context.borderColor,
                ),
                ClipRect(
                  clipper: FractionClipper(fill),
                  child: Icon(
                    Icons.star_rounded,
                    size: size,
                    color: context.gold,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

