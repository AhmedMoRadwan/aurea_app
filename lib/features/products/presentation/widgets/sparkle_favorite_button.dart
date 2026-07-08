import 'package:flutter/material.dart';
import 'package:nti_ecommerce_team4/features/products/presentation/widgets/sparkle_painter.dart';

import '../screens/product_details_screen.dart';

class SparkleFavoriteButton extends StatefulWidget {
  const SparkleFavoriteButton({super.key});

  @override
  State<SparkleFavoriteButton> createState() => _SparkleFavoriteButtonState();
}

class _SparkleFavoriteButtonState extends State<SparkleFavoriteButton>
    with SingleTickerProviderStateMixin {
  bool active = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 550),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() => active = !active);
    if (active) {
      _controller.forward(from: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final sparkColor = context.gold;
    final heartColor = context.errorColor;
    return GestureDetector(
      onTap: _toggle,
      child: SizedBox(
        width: 60,
        height: 60,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, _) => CustomPaint(
                size: const Size(60, 60),
                painter: SparklePainter(
                  progress: _controller.value,
                  color: sparkColor,
                ),
              ),
            ),
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: context.surfaceAlt,
                shape: BoxShape.circle,
                border: Border.all(color: context.borderColor),
              ),
              child: Icon(
                active ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                color: active ? heartColor : context.textSecondary,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
