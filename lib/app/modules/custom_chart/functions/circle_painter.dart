import 'package:flutter/material.dart';

void drawCircle(Canvas canvas, Offset center, Size size) {
  final Paint midCirclePaint = Paint()
    ..style = PaintingStyle.fill
    ..color = Colors.white;
  canvas.drawCircle(center, size.width * 0.25, midCirclePaint);
}
