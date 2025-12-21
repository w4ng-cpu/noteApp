class TaskModel {
  String name;
  String? description;
  String order;
  String priority;

  TaskModel({required this.name, this.description, required this.order, required this.priority});
}