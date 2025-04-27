class TaskModel {
  final String id;
  final String title;
  bool isDone;
  bool isFavorite;
  final String description;
  TaskModel({
    required this.id,
    required this.title,
    required this.isDone,
    required this.isFavorite,
    required this.description,
  });
}
