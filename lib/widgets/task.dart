import 'package:flutter/material.dart';
import 'package:note_app/models/task_model.dart';

class Task extends StatefulWidget {
  const Task(this.taskModel, {super.key});

  final TaskModel taskModel;
  
  @override
  State<StatefulWidget> createState() {
    return _Task();
  }
}

class _Task extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.grey[200],
      child: Column(
        children: [
          Text(
            widget.taskModel.name,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            widget.taskModel.description ?? '',
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
