part of 'task_bloc.dart';

@immutable
sealed class TaskManagementState {}

final class TaskInitialState extends TaskManagementState {}

class TaskLoadingState extends TaskManagementState {}

class TaskSuccessState extends TaskManagementState {}

class TaskErrorState extends TaskManagementState {
  final String message;

  TaskErrorState({required this.message});
}

class TaskAddedLoadingState extends TaskManagementState {}

class TaskAddedSuccessState extends TaskManagementState {}

class TaskAddedErrorState extends TaskManagementState {
  final String message;

  TaskAddedErrorState({required this.message});
}

class TaskDeletedLoadingState extends TaskManagementState {}

class TaskDeletedSuccessState extends TaskManagementState {}

class TaskDeletedErrorState extends TaskManagementState {
  final String message;

  TaskDeletedErrorState({required this.message});
}
class TaskUpdateStatusLoadingState extends TaskManagementState {}

class TaskUpdateStatusSuccessState extends TaskManagementState {}

class TaskUpdateStatusErrorState extends TaskManagementState {
  final String message;

  TaskUpdateStatusErrorState({required this.message});
}