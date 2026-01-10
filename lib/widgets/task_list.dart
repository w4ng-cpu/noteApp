import 'package:flutter/material.dart';
import 'package:note_app/models/task_model.dart';
import 'package:note_app/widgets/task.dart';

class TaskList extends StatefulWidget {
  final List<TaskModel> tasks;
  final void Function(int oldIndex, int newIndex) onReorder;
  final void Function(TaskModel) onRemoveTask;

  const TaskList({
    super.key,
    required this.tasks,
    required this.onReorder,
    required this.onRemoveTask,
  });

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      onReorder: widget.onReorder,
      children: [
        for (final task in widget.tasks)
          Dismissible(
            key: ValueKey(task.order),
            direction: DismissDirection.horizontal,
            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart) {
                widget.onRemoveTask(task);
              } else if (direction == DismissDirection.startToEnd) {
                setState(() {
                  task.isCompleted = true;
                });
              }
            },
            confirmDismiss: (direction) {
              if (direction == DismissDirection.startToEnd) {
                setState(() {
                  task.isCompleted = true;
                });
                return Future.value(false);
              }
              return Future.value(true);
            },
            background: Container(
              margin: const EdgeInsets.symmetric(vertical: 4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                gradient: LinearGradient(
                  colors: [
                    Colors.green.shade300,
                    Colors.green.shade100,
                  ],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                ),
              ),
              child: Icon(Icons.check),
            ),
            secondaryBackground: Container(
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
