import 'package:flutter/cupertino.dart';

class FractionClipper extends CustomClipper<Rect> {
  final double fraction;

  FractionClipper(this.fraction);

  @override
  Rect getClip(Size size) =>
      Rect.fromLTWH(0, 0, size.width * fraction, size.height);

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) => true;
}