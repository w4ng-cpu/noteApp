import 'package:flutter/material.dart';

class NewTaskDialog extends StatefulWidget {
  const NewTaskDialog({super.key});

  @override
  State<NewTaskDialog> createState() => _NewTaskDialogState();
}

class _NewTaskDialogState extends State<NewTaskDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text("Create New Task"),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Name',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Description',
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
