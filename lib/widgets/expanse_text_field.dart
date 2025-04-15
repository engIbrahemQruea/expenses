import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:intl/intl.dart';

import '../models/expenses_model.dart';

class ExpanseTextField extends StatefulWidget {
  const ExpanseTextField({super.key});

  @override
  State<ExpanseTextField> createState() => _ExpanseTextFieldState();
}

class _ExpanseTextFieldState extends State<ExpanseTextField> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  DateTime? _selectedDate;

  Category _selectedCategory = Category.Food;

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          TextField(
            controller: titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          TextField(
            controller: amountController,
            keyboardType: TextInputType.number,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Amount'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e.name),
                        ))
                    .toList(),
                onChanged: (newCat) {
                  if (newCat == null) return;
                  setState(() {
                    _selectedCategory = newCat;
                  });
                },
              ),
              Spacer(),
              Text(
                _selectedDate == null
                    ? 'NoSelectedDate'
                    : DateFormat.yMd().format(_selectedDate!),
              ),
              IconButton(
                onPressed: () async {
                  final now = DateTime.now();
                  final firstDate = DateTime(now.year - 1, now.month, now.day);
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: now,
                    firstDate: firstDate,
                    lastDate: now,
                  );
                  setState(() {
                    _selectedDate = pickedDate;
                  });
                },
                icon: Icon(Icons.calendar_month),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  final double? enteredAmount =
                      double.tryParse(amountController.text);
                  final bool amountIsInvaild =
                      enteredAmount == null || enteredAmount <= 0;
                  if (titleController.text.trim().isEmpty ||
                      amountIsInvaild ||
                      _selectedDate == null) {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                          title: Text('Invalid Input'),
                          content: Text(
                              'Please make sure all fields are valid title, amount and date.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(ctx);
                              },
                              child: const Text('OK'),
                            ),
                          ]),
                    );
                  }
                },
                child: const Text('Save Expanses'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
