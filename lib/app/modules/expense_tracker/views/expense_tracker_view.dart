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
      body: const Column(
        children: [
          Chart(),
          Expanded(child: ExpensesList()),
        ],
      ),
    );
  }
}
