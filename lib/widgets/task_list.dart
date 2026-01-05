import 'package:flutter/material.dart';
import 'package:note_app/models/task_model.dart';
import 'package:note_app/widgets/task.dart';

class TaskList extends StatelessWidget {
  final List<TaskModel> tasks;
  final void Function(int oldIndex, int newIndex) onReorder;

  const TaskList({
    super.key,
    required this.tasks,
    required this.onReorder,
  });

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      onReorder: onReorder,
      children: [
        for (final task in tasks)
          Dismissible(
            key: ValueKey(task.order),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              tasks.remove(task);
            },
            background: Container(
              margin: const EdgeInsets.symmetric(vertical: 4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                gradient: LinearGradient(
                  colors: [
                    Colors.red.shade300,
                    Colors.red.shade100,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Icon(Icons.delete),
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 4.0),
              decoration: BoxDecoration(
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
          ),
      ],
    );
  }
}
