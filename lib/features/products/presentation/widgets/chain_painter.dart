import 'package:flutter/cupertino.dart';

class ChainPainter extends CustomPainter {
  final Color lineColor;
  final Color dotColor;

  ChainPainter({required this.lineColor, required this.dotColor});

  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = lineColor
      ..strokeWidth = 1;
    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      linePaint,
    );

    final dotPaint = Paint()
      ..color = dotColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;
    const spacing = 14.0;
    final count = (size.width / spacing).floor();
    for (int i = 0; i < count; i++) {
      canvas.drawCircle(
        Offset(10 + i * spacing, size.height / 2),
        3.4,
        dotPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant ChainPainter oldDelegate) =>
      oldDelegate.lineColor != lineColor || oldDelegate.dotColor != dotColor;
}

