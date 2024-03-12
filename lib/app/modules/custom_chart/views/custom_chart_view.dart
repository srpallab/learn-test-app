import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/custom_chart_controller.dart';
import '../widgets/donut_chart_widget.dart';

class CustomChartView extends GetView<CustomChartController> {
  const CustomChartView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Chart'), centerTitle: true),
      body: const DonutChartWidget(),
    );
  }
}
