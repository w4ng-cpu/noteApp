import 'package:flutter/material.dart';
import 'package:note_app/models/task_model.dart';

class AddTaskBottomSheet extends StatefulWidget {
  final void Function(TaskModel) onAdd;

  const AddTaskBottomSheet({super.key, required this.onAdd});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void createTask() {
    final String name = _nameController.text.trim();
    final String description = _descriptionController.text.trim();

    if (name.isNotEmpty) {
      final TaskModel newTask = TaskModel(
        name: name,
        description: description.isNotEmpty ? description : null,
        order: DateTime.now().millisecondsSinceEpoch.toString(),
      );

      widget.onAdd(newTask);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: 20,
          left: 20,
          right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Create New Task"),
          const SizedBox(height: 16),
          TextField(
            autofocus: true,
            textInputAction: TextInputAction.next,
            controller: _nameController,
            decoration: const InputDecoration(
              hintText: 'Name',
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            textInputAction: TextInputAction.done,
            controller: _descriptionController,
            decoration: const InputDecoration(
              hintText: 'Description',
            ),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {
              createTask();
              Navigator.of(context).pop();
            },
            style: const ButtonStyle(
              padding: WidgetStatePropertyAll<EdgeInsets>(EdgeInsets.all(24.0)),
              backgroundColor: WidgetStatePropertyAll<Color>(Colors.blue),
              foregroundColor: WidgetStatePropertyAll<Color>(Colors.white),
            ),
            child: const Text('Add Task'),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
