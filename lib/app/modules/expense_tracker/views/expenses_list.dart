import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/expense_tracker_controller.dart';
import '../models/expense.dart';

class ExpensesList extends GetView<ExpenseTrackerController> {
  const ExpensesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Obx(() {
        return controller.registeredExpenses.isEmpty
            ? const Center(
                child: Text(
                  "No item found",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                ),
              )
            : ListView.builder(
                itemCount: controller.registeredExpenses.length,
                itemBuilder: (_, index) {
                  final Expense expense = controller.registeredExpenses[index];
                  return Dismissible(
                    key: ValueKey(expense),
                    background: Container(
                      color:
                          Theme.of(context).colorScheme.error.withOpacity(0.75),
                      margin: Theme.of(context).cardTheme.margin,
                    ),
                    onDismissed: (direction) {
                      controller.removeExpense(expense);
                    },
                    child: Card(
                      child: ListTile(
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(categoryIcons[expense.category]),
                          ],
                        ),
                        title: Text(
                          expense.title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        subtitle: Row(
                          children: [
                            Text(
                              '\$${expense.amount.toStringAsFixed(2)}',
                            ),
                            const Spacer(),
                            Text(expense.formattedDate),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
      }),
    );
  }
}
