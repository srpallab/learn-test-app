import 'dart:developer' as dev;
import 'dart:math';

import 'package:flutter/material.dart';

import 'text_painter.dart';

const TextStyle labelStyle = TextStyle(
  color: Colors.black87,
  fontWeight: FontWeight.normal,
  fontSize: 14.0,
);
void drawLabel(Canvas canvas, Offset c, double radius, double startAngle,
    double sweepAngle, String label) {
  final r = radius * 0.4;
  final dx = r * cos(startAngle + sweepAngle / 2.0);
  final dy = r * sin(startAngle + sweepAngle / 2.0);
  final position = c + Offset(dx, dy);
  drawTextCenter(
    canvas,
    position,
    label,
    r,
    labelStyle,
    (Size sz) {
      final rect = Rect.fromCenter(
        center: position,
        width: sz.width + 5,
        height: sz.height + 5,
      );
      final rRect = RRect.fromRectAndRadius(
        rect,
        const Radius.circular(5),
      );
      dev.log("RRect $rRect");
      canvas.drawRRect(
        rRect,
        Paint()
          ..style = PaintingStyle.fill
          ..color = Colors.white,
      );
    },
  );
}
