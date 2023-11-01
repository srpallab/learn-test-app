import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/expense_tracker_controller.dart';
import 'chart.dart';
import 'expenses_list.dart';

class ExpenseTrackerView extends GetView<ExpenseTrackerController> {
  const ExpenseTrackerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: controller.openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Get.width < 600
          ? const Column(children: [Chart(), Expanded(child: ExpensesList())])
          : const Row(
              children: [
                Expanded(child: Chart()),
                Expanded(child: ExpensesList()),
              ],
            ),
    );
  }
}
