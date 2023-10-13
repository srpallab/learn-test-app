import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/expense_tracker_controller.dart';

class ExpenseTrackerView extends GetView<ExpenseTrackerController> {
  const ExpenseTrackerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expense Tracker')),
      body: const Column(
        children: [
          Text("chart"),
          Text("Expenses List"),
        ],
      ),
    );
  }
}
