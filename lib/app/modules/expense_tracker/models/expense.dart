import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { food, travel, family, shopping, mobile, medical, others }

class Expense {
  final String id;
  final String title;
  final String amount;
  final DateTime date;
  final Category category;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();
}
