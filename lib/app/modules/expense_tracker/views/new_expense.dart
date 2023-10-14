import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/expense_tracker_controller.dart';
import '../models/expense.dart';

class NewExpense extends GetView<ExpenseTrackerController> {
  const NewExpense({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 40),
          titleSection(),
          TextFormField(
            controller: controller.titleCtl,
            decoration: const InputDecoration(
              label: Text("Title"),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.amountCtl,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text("Amount"),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(() {
                      return Text(controller.selectedDate.value);
                    }),
                    IconButton(
                      onPressed: controller.selectDate,
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Obx(() {
                return DropdownButton(
                  value: controller.selectedCategory.value,
                  items: ExpenseCategory.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(category.name.toUpperCase()),
                        ),
                      )
                      .toList(),
                  onChanged: (val) {
                    if (val == null) return;
                    controller.selectedCategory.value = val;
                  },
                );
              }),
              const Spacer(),
              TextButton(onPressed: Get.back, child: const Text("Cancel")),
              ElevatedButton(
                onPressed: controller.addNewExpense,
                child: const Text("ADD NEW"),
              ),
            ],
          )
        ],
      ),
    );
  }

  Text titleSection() {
    return const Text(
      "Add New Expense",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    );
  }
}
