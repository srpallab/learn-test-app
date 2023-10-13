import 'package:get/get.dart';

import '../models/expense.dart';

class ExpenseTrackerController extends GetxController {
  final RxList<Expense> registeredExpenses = [
    Expense(
      title: "Demo One",
      amount: "20.0",
      date: DateTime.now(),
      category: Category.family,
    ),
    Expense(
      title: "Demo Two",
      amount: "20.0",
      date: DateTime.now(),
      category: Category.food,
    ),
  ].obs;
}
