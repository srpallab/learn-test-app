import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final formatter = DateFormat.yMMMd();
// final DateFormat format = DateFormat('MMM d, y');

enum ExpenseCategory { food, travel, family, shopping, mobile, medical, others }

const categoryIcons = {
  ExpenseCategory.food: Icons.lunch_dining,
  ExpenseCategory.travel: Icons.directions_bus,
  ExpenseCategory.family: Icons.family_restroom_rounded,
  ExpenseCategory.shopping: Icons.shopping_bag_rounded,
  ExpenseCategory.mobile: Icons.phone_android_rounded,
  ExpenseCategory.medical: Icons.medical_information_rounded,
  ExpenseCategory.others: Icons.miscellaneous_services_rounded,
};

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseCategory category;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  final ExpenseCategory category;
  final List<Expense> expenses;

  ExpenseBucket({required this.category, required this.expenses});

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((element) => element.category == category)
            .toList();

  double get totalExpenses {
    double sum = 0;
    for (var exp in expenses) {
      sum += exp.amount;
    }
    return sum;
  }
}
