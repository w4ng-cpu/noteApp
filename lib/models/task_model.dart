enum Priority { low, medium, high, normal }

class TaskModel {
  String name;
  bool isCompleted = false;
  String? description;
  String order;
  Priority priority;
  DateTime? dueDate;

  TaskModel({
    required this.name,
    this.isCompleted = false,
    this.description = '',
    required this.order,
    this.priority = Priority.normal,
    this.dueDate,
  });
}
