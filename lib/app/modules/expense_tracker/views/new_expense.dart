import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/expense_tracker_controller.dart';
import '../models/expense.dart';

class NewExpense extends GetView<ExpenseTrackerController> {
  const NewExpense({super.key});

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(builder: (ctx, constrains) {
      final constrainsMaxWidth = constrains.maxWidth;
      return SizedBox(
        height: Get.height,
        width: Get.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 48, 16, keyboardSpace + 16),
            child: Column(
              children: [
                titleSection(),
                if (constrainsMaxWidth <= 600)
                  titleField()
                else
                  Row(
                    children: [
                      Expanded(child: titleField()),
                      const SizedBox(width: 25),
                      amountField(),
                    ],
                  ),
                if (constrainsMaxWidth <= 600)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [amountField(), datePicker()],
                  )
                else
                  Row(children: [dropDownBtn(), datePicker()]),
                const SizedBox(height: 20),
                btnRow(constrainsMaxWidth),
              ],
            ),
          ),
        ),
      );
    });
  }

  Expanded datePicker() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(() => Text(controller.selectedDate.value)),
          IconButton(
            onPressed: controller.selectDate,
            icon: const Icon(Icons.calendar_month),
          ),
        ],
      ),
    );
  }

  Expanded amountField() {
    return Expanded(
      child: TextFormField(
        controller: controller.amountCtl,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          label: Text("Amount"),
        ),
      ),
    );
  }

  TextFormField titleField() {
    return TextFormField(
      controller: controller.titleCtl,
      decoration: const InputDecoration(label: Text("Title")),
    );
  }

  Row btnRow(double width) {
    return Row(
      children: [
        if (width <= 600) dropDownBtn(),
        const Spacer(),
        TextButton(onPressed: Get.back, child: const Text("Cancel")),
        ElevatedButton(
          onPressed: controller.addNewExpense,
          child: const Text("ADD NEW"),
        ),
      ],
    );
  }

  Obx dropDownBtn() {
    return Obx(() {
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
    });
  }

  Text titleSection() {
    return const Text(
      "Add New Expense",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    );
  }
}
