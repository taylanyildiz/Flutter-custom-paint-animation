import 'dart:math';

import 'package:flutter/material.dart';

class HomePaintCircle extends CustomPainter {
  final double offset;
  final double offsetMiddle;
  final double sizeCircle;
  final Paint circlePaint;
  bool isCheck = false;
  HomePaintCircle({
    this.offsetMiddle,
    this.sizeCircle,
    this.offset,
  }) : circlePaint = Paint()
          ..color = Color(0xFFEB630E)
          ..style = PaintingStyle.fill
          ..strokeCap = StrokeCap.round;

  @override
  void paint(Canvas canvas, Size size) {
    drawCircle(canvas, size);
    drawMiddleFullCircle(canvas, size);
  }

  void drawCircle(Canvas canvas, Size size) {
    double circle = (offsetMiddle == 0) ? 1 : 8;
    double left = (offset > pi) ? pi : offset;
    double center = (offset - 1 > pi) ? pi : offset - 1;
    if (center < 0) center = 0;
    double right = (offset - 2 < 0) ? pi : offset - 2;

    Offset leftOffset =
        Offset(size.width / 4 * circle, size.height / 2 - 40 * sin(left));

    Offset centerOffset =
        Offset(size.width / 2 * circle, size.height / 2 - 40 * sin(center));

    Offset rightOffset =
        Offset(size.width * 3 / 4 * circle, size.height / 2 - 40 * sin(right));

    final circleOffset = <Offset>[leftOffset, centerOffset, rightOffset];

    for (var i = 0; i < 3; i++) {
      canvas.drawCircle(circleOffset[i], 20.0, circlePaint);
    }
  }

  void drawMiddleFullCircle(Canvas canvas, Size size) {
    double r = (sizeCircle > pi) ? pi : sizeCircle;
    Paint paint = Paint()
      ..color = Color(0xFFEB630E)
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;
    Offset center = Offset(size.width / 2, size.height / 2 + 55);
    double radius = max(size.width, size.height);
    canvas.drawCircle(center, radius * sin(r), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
