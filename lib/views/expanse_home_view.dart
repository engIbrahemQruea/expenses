import 'package:expenses/models/expenses_model.dart';
import 'package:flutter/material.dart';

import '../widgets/expanse_list_view.dart';
import '../widgets/expanse_text_field.dart';

class ExpanseHomeView extends StatefulWidget {
  ExpanseHomeView({super.key});

  @override
  State<ExpanseHomeView> createState() => _ExpanseHomeViewState();
}

class _ExpanseHomeViewState extends State<ExpanseHomeView> {
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

  void _addExpanse(ExpensesModel expanse) {
    setState(() {
      expanseModel.add(expanse);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Expanses App',
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (ctx) {
                  return SizedBox(
                    height: 400,
                    width: double.infinity,
                    child: ExpanseTextField(
                      onAddExpanse: _addExpanse,
                    ),
                  );
                },
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: Expanded(
          child: ExpanseListView(expanseModel: expanseModel),
        ),
      ),
    );
  }
}
