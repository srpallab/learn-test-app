import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/expense_tracker_controller.dart';
import '../models/expense.dart';
import 'chart_bar.dart';

class Chart extends GetView<ExpenseTrackerController> {
  const Chart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      width: Get.width,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.3),
            Theme.of(context).colorScheme.primary.withOpacity(0.0)
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Obx(() {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  for (final bucket in controller.buckets)
                    ChartBar(
                      fill: bucket.totalExpenses == 0
                          ? 0
                          : bucket.totalExpenses / controller.maxTotalExpense,
                    )
                ],
              );
            }),
          ),
          const SizedBox(height: 12),
          Row(
            children: controller.buckets.map((bucket) {
              return Expanded(
                  child: Icon(
                categoryIcons[bucket.category],
                color: Get.isDarkMode
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.primary.withOpacity(0.7),
              ));
            }).toList(),
          )
        ],
      ),
    );
  }
}
