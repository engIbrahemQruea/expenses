// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:expenses/models/expenses_model.dart';

import '../widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  const Chart({
    Key? key,
    required this.expanses,
  }) : super(key: key);

  final List<ExpensesModel> expanses;

  List<ExpanseBucket> get buckets {
    return [
      ExpanseBucket.forCategory(Category.Food, expanses),
      ExpanseBucket.forCategory(Category.Water, expanses),
      ExpanseBucket.forCategory(Category.Work, expanses),
    ];
  }

  double get maxTotalExpanse {
    double maxTotalExpanse = 0;
    for (var element in buckets) {
      if (element.totalExpanses > maxTotalExpanse) {
        maxTotalExpanse = element.totalExpanses;
      }
    }
    return maxTotalExpanse;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.3),
            Theme.of(context).colorScheme.primary.withOpacity(0.0),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final ele in buckets)
                  ChartBar(
                    fill: 2,
                  ),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: buckets
                .map(
                  (e) => Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(Icons.abc),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
