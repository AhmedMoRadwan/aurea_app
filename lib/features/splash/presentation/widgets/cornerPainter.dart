
import 'package:flutter/material.dart';
class CornerPainter extends CustomPainter {
  final bool isRight;
  final bool isBottom;

  CornerPainter({this.isRight = false, this.isBottom = false});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFD4AF37)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    const cornerLength = 15.0;

    if (!isRight && !isBottom) {
      canvas.drawLine(const Offset(0, cornerLength), const Offset(0, 0), paint);
      canvas.drawLine(const Offset(0, 0), const Offset(cornerLength, 0), paint);
    } else if (isRight && !isBottom) {
      canvas.drawLine(
        Offset(size.width, cornerLength),
        Offset(size.width, 0),
        paint,
      );
      canvas.drawLine(
        Offset(size.width, 0),
        Offset(size.width - cornerLength, 0),
        paint,
      );
    } else if (!isRight && isBottom) {
      canvas.drawLine(
        Offset(0, size.height - cornerLength),
        Offset(0, size.height),
        paint,
      );
      canvas.drawLine(
        Offset(0, size.height),
        Offset(cornerLength, size.height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CornerPainter oldDelegate) => false;
}