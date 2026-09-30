class TaskItem {
  final String id;
  String title;
  String priority;
  bool isCompleted;
  String category;
  String description;

  TaskItem({
    required this.id,
    required this.title,
    required this.priority,
    this.isCompleted = false,
    required this.category,
    this.description = '',
  });
}