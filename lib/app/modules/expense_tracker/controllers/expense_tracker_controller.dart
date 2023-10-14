import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/expense.dart';
import '../views/new_expense.dart';

class ExpenseTrackerController extends GetxController {
  final TextEditingController titleCtl = TextEditingController();
  final TextEditingController amountCtl = TextEditingController();
  final RxString selectedDate = "Select a Date".obs;
  final Rx<ExpenseCategory> selectedCategory = ExpenseCategory.travel.obs;

  final RxList<Expense> registeredExpenses = [
    Expense(
      title: "Demo One",
      amount: 19.99,
      date: DateTime.now(),
      category: ExpenseCategory.family,
    ),
    Expense(
      title: "Demo Two",
      amount: 20.77,
      date: DateTime.now(),
      category: ExpenseCategory.food,
    ),
  ].obs;

  List<ExpenseBucket> get buckets {
    return [
      ExpenseBucket.forCategory(registeredExpenses, ExpenseCategory.food),
      ExpenseBucket.forCategory(registeredExpenses, ExpenseCategory.travel),
      ExpenseBucket.forCategory(registeredExpenses, ExpenseCategory.family),
      ExpenseBucket.forCategory(registeredExpenses, ExpenseCategory.shopping),
      ExpenseBucket.forCategory(registeredExpenses, ExpenseCategory.mobile),
      ExpenseBucket.forCategory(registeredExpenses, ExpenseCategory.medical),
      ExpenseBucket.forCategory(registeredExpenses, ExpenseCategory.others),
    ];
  }

  double get maxTotalExpense {
    double maxTotalExpense = 0;

    for (final bucket in buckets) {
      if (bucket.totalExpenses > maxTotalExpense) {
        maxTotalExpense = bucket.totalExpenses;
      }
    }

    return maxTotalExpense;
  }

  void openAddExpenseOverlay() {
    Get.bottomSheet(
      const NewExpense(),
      isScrollControlled: true,
      backgroundColor: Colors.white,
    );
  }

  Future<void> selectDate() async {
    final DateTime now = DateTime.now();
    DateTime? datePicked = await showDatePicker(
      context: Get.context!,
      initialDate: now,
      firstDate: DateTime(now.year - 1),
      lastDate: now,
    );
    if (datePicked != null) {
      selectedDate.value = formatter.format(datePicked);
    }
  }

  void addNewExpense() {
    if (titleCtl.text.isNotEmpty &&
        amountCtl.text.isNotEmpty &&
        selectedDate.value != "Select a Date") {
      if (double.tryParse(amountCtl.text) != null) {
        registeredExpenses.add(
          Expense(
            title: titleCtl.text,
            amount: double.parse(amountCtl.text),
            date: formatter.parse(selectedDate.value),
            category: selectedCategory.value,
          ),
        );
        registeredExpenses.refresh();
        Get.back();
      } else {
        Get.snackbar("Value Error", "Please enter valid amount");
      }
    } else {
      Get.snackbar("Value Error", "Please enter valid values");
    }
  }

  void removeExpense(Expense expense) {
    final int indexAt = registeredExpenses.indexOf(expense);
    registeredExpenses.remove(expense);
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text("Expense Deleted"),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            registeredExpenses.insert(indexAt, expense);
          },
        ),
      ),
    );
  }
}
