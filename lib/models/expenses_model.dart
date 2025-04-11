// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expenses/constants/constant_key.dart';

enum Category { Work, Food, Water }

class ExpensesModel {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  ExpensesModel({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = kUuid.v4();
}
