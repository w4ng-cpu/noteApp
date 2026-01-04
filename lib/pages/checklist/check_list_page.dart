import 'package:flutter/material.dart';
import 'package:note_app/models/task_model.dart';
import 'package:note_app/widgets/task.dart';
import 'package:note_app/widgets/add_task_bottom_sheet.dart';

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
      description:
          "Description for Task 3 Superlong description that might overflow the screen if not handled properly",
      order: "3",
    ),
    TaskModel(
      name: "Motorcycle Theory Study",
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
// Task List Section
            Expanded(
              child: ReorderableListView(
                onReorder: (oldIndex, newIndex) {
                  setState(() {
                    if (newIndex > oldIndex) {
                      newIndex -= 1;
                    }
                    final TaskModel item = tasks.removeAt(oldIndex);
                    tasks.insert(newIndex, item);
                  });
                },
                children: [
                  for (final task in tasks)
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 4.0),
                      key: ValueKey(task.order),
                      decoration: BoxDecoration(
                        // color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8.0),
                        gradient: LinearGradient(
                          colors: [
                            Colors.grey.shade300,
                            Colors.grey.shade100,
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                      child: Task(task),
                    ),
                ],
              ),
            ),
// New Task Input Section Below
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
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
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        return const AddTaskBottomSheet();
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
