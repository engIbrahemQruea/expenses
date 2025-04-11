import 'package:expenses/widgets/expanse_item.dart';
import 'package:flutter/material.dart';

import '../models/expenses_model.dart';

class ExpanseListView extends StatelessWidget {
  const ExpanseListView({
    super.key,
    required this.expanseModel,
  });

  final List<ExpensesModel> expanseModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expanseModel.length,
        itemBuilder: (context, index) {
          return ExpanseItems(expanseModelItem: expanseModel[index]);
        });
  }
}
