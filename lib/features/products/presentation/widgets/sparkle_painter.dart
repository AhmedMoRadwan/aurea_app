import 'dart:math' as math;

import 'package:flutter/cupertino.dart';

class SparklePainter extends CustomPainter {
  final double progress; // 0..1
  final Color color;

  SparklePainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    if (progress <= 0 || progress >= 1) return;
    final center = size.center(Offset.zero);
    final paint = Paint()
      ..color = color.withValues(alpha: (1 - progress).clamp(0, 1));
    const count = 8;
    final dist = 14 + progress * 16;
    for (int i = 0; i < count; i++) {
      final angle = (2 * math.pi * i) / count;
      final p = center + Offset(math.cos(angle), math.sin(angle)) * dist;
      canvas.drawRect(
        Rect.fromCenter(center: p, width: 3.5, height: 3.5),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant SparklePainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.color != color;
}