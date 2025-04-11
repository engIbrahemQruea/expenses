import 'package:expenses/models/expenses_model.dart';
import 'package:flutter/material.dart';

import '../widgets/expanse_list_view.dart';

class ExpanseHomeView extends StatelessWidget {
  ExpanseHomeView({super.key});

  final List<ExpensesModel> expanseModel = [
    ExpensesModel(
      title: 'title1',
      amount: 11.1,
      date: DateTime.now(),
      category: Category.Food,
    ),
    ExpensesModel(
      title: 'title2',
      amount: 22.1,
      date: DateTime.now(),
      category: Category.Work,
    ),
    ExpensesModel(
      title: 'title3',
      amount: 3.1,
      date: DateTime.now(),
      category: Category.Water,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Expanses App',
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: Expanded(
          child: ExpanseListView(expanseModel: expanseModel),
        ),
      ),
    );
  }
}
