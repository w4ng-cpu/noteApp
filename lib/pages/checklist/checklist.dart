import 'package:flutter/material.dart';
import 'package:note_app/models/task_model.dart';
import 'package:note_app/widgets/task.dart';

class CheckList extends StatelessWidget {
  CheckList({super.key});

  final List<TaskModel> tasks = [
    TaskModel(name: "Task 1", description: "Description for Task 1", order: "1", priority: "High"),
    TaskModel(name: "Task 2", order: "2", priority: "Medium"),
    TaskModel(name: "Task 3", description: "Description for Task 3", order: "3", priority: "Low"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checklist'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Task(tasks[0]),
                  SizedBox(height: 10),
                  Task(tasks[1]),
                  SizedBox(height: 10),
                  Task(tasks[2]),
                ],
              ),
              Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Create a task...',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll<Color>(Colors.blue),
                      foregroundColor:
                          WidgetStatePropertyAll<Color>(Colors.white),
                    ),
                    onPressed: () {},
                    child: Text('Add Task'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
