import 'package:flutter/material.dart';

void drawArc(
  double sweepAngle,
  Color color,
  Canvas canvas,
  Rect rect,
  double startAngle,
) {
  final Paint paint = Paint()
    ..style = PaintingStyle.fill
    ..color = color;
  canvas.drawArc(rect, startAngle, sweepAngle, true, paint);
}
