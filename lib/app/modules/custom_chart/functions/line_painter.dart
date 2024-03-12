import 'dart:math';

import 'package:flutter/material.dart';

void drawLine(Canvas canvas, double radius, Offset center, double startAngle) {
  final Paint linePaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2.0
    ..color = Colors.white;
  final double dx = radius / 2.0 * cos(startAngle);
  final double dy = radius / 2.0 * sin(startAngle);
  final Offset p2 = center + Offset(dx, dy);
  canvas.drawLine(center, p2, linePaint);
}
