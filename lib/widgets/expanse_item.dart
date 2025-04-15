// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expenses/constants/constant_key.dart';
import 'package:flutter/material.dart';

import 'package:expenses/models/expenses_model.dart';

class ExpanseItems extends StatelessWidget {
  const ExpanseItems({
    Key? key,
    required this.expanseModelItem,
  }) : super(key: key);

  final ExpensesModel expanseModelItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Text(
              expanseModelItem.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Row(
              children: [
                Text(
                  '\$${expanseModelItem.amount.toStringAsFixed(2)}',
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(kCategoryIcons[expanseModelItem.category]),
                    Text(expanseModelItem.getFormattedDate),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
