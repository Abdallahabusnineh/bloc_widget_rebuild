part of 'task_bloc.dart';

@immutable
sealed class TaskManagementEvent {}

class TaskManagementGetTasksEvent extends TaskManagementEvent {}

class TaskManagementAddTaskEvent extends TaskManagementEvent {}

class TaskManagementDeleteTaskEvent extends TaskManagementEvent {
  final String taskId;
  final int index;
  TaskManagementDeleteTaskEvent({required this.taskId, required this.index});
}
class TaskManagementUpdateStatusTaskEvent extends TaskManagementEvent {
  final bool isDone;
  final String taskId;
  final int index;
  TaskManagementUpdateStatusTaskEvent({required this.isDone, required this.taskId, required this.index});
}