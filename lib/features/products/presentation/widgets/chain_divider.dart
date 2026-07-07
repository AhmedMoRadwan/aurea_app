import 'package:flutter/cupertino.dart';

import '../screens/product_details_screen.dart';
import 'chain_painter.dart';

class ChainDivider extends StatelessWidget {
  const ChainDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: SizedBox(
        height: 14,
        width: double.infinity,
        child: CustomPaint(
          painter: ChainPainter(
            lineColor: context.borderColor,
            dotColor: context.gold,
          ),
        ),
      ),
    );
  }
}

