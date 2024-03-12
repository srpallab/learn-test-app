import 'dart:developer' as dev;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/custom_chart_controller.dart';
import '../functions/arc_painter.dart';
import '../functions/circle_painter.dart';
import '../functions/label_painter.dart';
import '../functions/line_painter.dart';
import '../functions/text_painter.dart';
import '../models/data_item_model.dart';

class DonutChartWidget extends GetView<CustomChartController> {
  const DonutChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RepaintBoundary(
        child: CustomPaint(
          painter: DonutChartPainter(
            controller.dataset,
            controller.fullAngle.value,
          ),
          child: SizedBox(height: Get.height, width: Get.width),
        ),
      );
    });
  }
}

class DonutChartPainter extends CustomPainter {
  final List<DataItem> dataset;
  final double fullAngle;

  DonutChartPainter(this.dataset, this.fullAngle);

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2.0, size.height / 2.0);
    final double radius = size.width * 0.9;
    final Rect rect =
        Rect.fromCenter(center: center, width: radius, height: radius);

    /// 2 PI red = 360 degree = 400 gradian
    /// Angle = arc / radius
    dev.log("Center: $center, Radius: $radius");
    double startAngle = 0.0;
    for (var item in dataset) {
      double sweepAngle = item.value * fullAngle * pi / 180;
      drawArc(sweepAngle, item.color, canvas, rect, startAngle);
      startAngle += sweepAngle;
    }
    startAngle = 0.0;

    for (var item in dataset) {
      double sweepAngle = item.value * fullAngle * pi / 180;
      drawLine(canvas, radius, center, startAngle);
      startAngle += sweepAngle;
    }
    startAngle = 0.0;
    for (var item in dataset) {
      double sweepAngle = item.value * fullAngle * pi / 180;
      drawLabel(canvas, center, radius, startAngle, sweepAngle, item.label);
      startAngle += sweepAngle;
    }
    drawCircle(canvas, center, size);

    drawTextCenter(
      canvas,
      center,
      "Favourite\nMovie\nGenres",
      radius * 0.6,
      middleTestStyle,
      (Size sz) {},
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
