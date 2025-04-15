// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expenses/constants/constant_key.dart';
import 'package:intl/intl.dart';

enum Category { Work, Food, Water }

final dateFormat = DateFormat.yMd();

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

  String get getFormattedDate => dateFormat.format(date);
}

class ExpanseBucket {
  final Category category;
  final List<ExpensesModel> expanses;

  ExpanseBucket(this.category, this.expanses);

  ExpanseBucket.forCategory(this.category, List<ExpensesModel> allExpanses)
      : expanses = allExpanses.where((e) => e.category == category).toList();

  double get totalExpanses {
    double sum = 0;
    for (var expanse in expanses) {
      sum += expanse.amount;
    }
    return sum;
  }
}
