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
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
            width: 30,
            child: Transform.scale(
              scale: 1.4,
              child: Checkbox(
                value: widget.taskModel.isCompleted,
                splashRadius: 50,
                shape: const CircleBorder(),
                onChanged: (value) {
                  setState(() {
                    widget.taskModel.isCompleted = value ?? false;
                  });
                },
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.taskModel.name,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    decoration: widget.taskModel.isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
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
          SizedBox(
            width: 10,
            child: FloatingActionButton.small(
                onPressed: () {},
                elevation: 0,
                backgroundColor: Colors.transparent,
                child: const Icon(Icons.more_vert_rounded)),
          ),
        ],
      ),
    );
  }
}
