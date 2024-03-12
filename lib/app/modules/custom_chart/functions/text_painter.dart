import 'package:flutter/material.dart';

const TextStyle middleTestStyle = TextStyle(
  color: Colors.black45,
  fontWeight: FontWeight.bold,
  fontSize: 30.0,
);
TextPainter measureText(String s, double maxW, TextAlign a, TextStyle style) {
  final span = TextSpan(text: s, style: style);
  final tp = TextPainter(
    text: span,
    textAlign: a,
    textDirection: TextDirection.ltr,
  );
  tp.layout(minWidth: 0, maxWidth: maxW);
  return tp;
}

Size drawTextCenter(Canvas canvas, Offset position, String s, double maxWidth,
    TextStyle style, Function(Size sz) bgCb) {
  final TextPainter tp = measureText(s, maxWidth, TextAlign.center, style);
  final Offset pos = position + Offset(-tp.width / 2.0, -tp.height / 2.0);
  bgCb(tp.size);
  tp.paint(canvas, pos);
  return tp.size;
}
