import 'package:expenses/models/expenses_model.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:intl/intl.dart';

class ExpanseTextField extends StatefulWidget {
  const ExpanseTextField({super.key});

  @override
  State<ExpanseTextField> createState() => _ExpanseTextFieldState();
}

class _ExpanseTextFieldState extends State<ExpanseTextField> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  DateTime? _selectedDate;

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
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    label: Text('Amount'),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'NoSelectedDate'
                          : DateFormat.yMd().format(_selectedDate!),
                    ),
                    IconButton(
                      onPressed: () async {
                        final now = DateTime.now();
                        final firstDate =
                            DateTime(now.year - 1, now.month, now.day);
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
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  log(titleController.text);
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
