import 'package:flutter/material.dart';
import 'package:note_app/models/task_model.dart';
import 'package:note_app/widgets/task_list.dart';
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
          children: [
            Expanded(
              child: TaskList(
                tasks: tasks,
                onReorder: (oldIndex, newIndex) {
                  setState(() {
                    if (newIndex > oldIndex) {
                      newIndex -= 1;
                    }
                    final TaskModel item = tasks.removeAt(oldIndex);
                    tasks.insert(newIndex, item);
                  });
                },
                onRemoveTask: (TaskModel task) {
                  setState(() {
                    tasks.remove(task);
                  });
                },
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      padding: WidgetStatePropertyAll<EdgeInsets>(
                          EdgeInsets.all(24.0)),
                      backgroundColor:
                          WidgetStatePropertyAll<Color>(Colors.blue),
                      foregroundColor:
                          WidgetStatePropertyAll<Color>(Colors.white),
                    ),
                    onPressed: () {
                      showModalBottomSheet<void>(
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return AddTaskBottomSheet(
                            onAdd: (TaskModel task) {
                              setState(() {
                                tasks.add(task);
                              });
                            },
                          );
                        },
                      );
                    },
                    child: const Text(
                      'New Task',
                    ),
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
