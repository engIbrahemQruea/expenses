import 'package:flutter/material.dart';
import 'dart:developer';

class ExpanseTextField extends StatefulWidget {
  const ExpanseTextField({super.key});

  @override
  State<ExpanseTextField> createState() => _ExpanseTextFieldState();
}

class _ExpanseTextFieldState extends State<ExpanseTextField> {
  final titleController = TextEditingController();

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
          ElevatedButton(
            onPressed: () {
              log(titleController.text);
            },
            child: const Text('Save Expanses'),
          ),
        ],
      ),
    );
  }
}
