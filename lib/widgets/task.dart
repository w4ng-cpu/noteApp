import 'package:flutter/material.dart';
import 'package:note_app/models/task_model.dart';

class Task extends StatefulWidget {
  const Task(this.taskModel, {super.key});

  final TaskModel taskModel;

  @override
  State<StatefulWidget> createState() {
    return _TaskState();
  }
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            value: widget.taskModel.isCompleted,
            onChanged: (value) {
              setState(() {
                widget.taskModel.isCompleted = value ?? false;
              });
            },
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.taskModel.name,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    decoration: widget.taskModel.isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                  ),
                ),
                Text(
                  widget.taskModel.description ?? '',
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
