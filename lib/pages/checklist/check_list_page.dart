import 'package:flutter/material.dart';
import 'package:note_app/models/task_model.dart';
import 'package:note_app/widgets/task.dart';
import 'package:note_app/widgets/new_task_dialog.dart';

class CheckListPage extends StatefulWidget {
  const CheckListPage({super.key});

  @override
  State<CheckListPage> createState() => _CheckListPageState();
}

class _CheckListPageState extends State<CheckListPage> {
  final List<TaskModel> tasks = [
    TaskModel(
      name: "Task 1",
      description: "Description for Task 1",
      order: "1",
    ),
    TaskModel(
      name: "Task 2",
      order: "2",
    ),
    TaskModel(
      name:
          "Task 3 Super long name that might overflow the screen if not handled properly",
      description: "Description for Task 3 Superlong description that might overflow the screen if not handled properly",
      order: "3",
    ),
    TaskModel(
      name: "Task 4",
      description: "4",
      order: "4",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checklist'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Task(tasks[index]);
                },
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Create a task...',
                  ),
                  onChanged: null,
                ),
                const SizedBox(height: 10),
                TextButton(
                  style: const ButtonStyle(
                    padding: WidgetStatePropertyAll<EdgeInsets>(
                        EdgeInsets.all(24.0)),
                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.blue),
                    foregroundColor:
                        WidgetStatePropertyAll<Color>(Colors.white),
                  ),
                  onPressed: () => {
                    showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return const NewTaskDialog();
                      },
                    )
                  },
                  child: const Text(
                    'New Task',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
