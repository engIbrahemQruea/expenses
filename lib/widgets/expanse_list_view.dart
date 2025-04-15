// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:expenses/widgets/expanse_item.dart';

import '../models/expenses_model.dart';

class ExpanseListView extends StatelessWidget {
  const ExpanseListView({
    Key? key,
    required this.expanseModel,
    required this.onRemoveExpanse,
  }) : super(key: key);

  final List<ExpensesModel> expanseModel;

  final void Function(ExpensesModel expanse) onRemoveExpanse;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expanseModel.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(expanseModel[index]),
        onDismissed: (direction) => onRemoveExpanse(expanseModel[index]),
        child: ExpanseItems(
          expanseModelItem: expanseModel[index],
        ),
      ),
    );
  }
}
