import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:test_widget_rebuild/task/data/model/task_model.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskManagementBloc
    extends Bloc<TaskManagementEvent, TaskManagementState> {
  TaskManagementBloc() : super(TaskInitialState()) {
    on<TaskManagementGetTasksEvent>(_onGetTasks);
    on<TaskManagementAddTaskEvent>(_onAddTask);
    on<TaskManagementDeleteTaskEvent>(_onDeleteTask);
    on<TaskManagementUpdateStatusTaskEvent>(_onUpdateStatusTask);
  }
  List<TaskModel> tasks = [];
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int taskId = 6;
  int deleteIndex = -1;
  int updateStatusIndex = -1;

  Future<void> _onGetTasks(
    TaskManagementGetTasksEvent event,
    Emitter<TaskManagementState> emit,
  ) async {
    if (tasks.isNotEmpty) {
      tasks.clear();
    }
    emit(TaskLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    tasks.addAll([
      TaskModel(
        id: '1',
        title: 'Task 1',
        isDone: false,
        isFavorite: false,
        description: 'Description 1',
      ),
      TaskModel(
        id: '2',
        title: 'Task 2',
        isDone: true,
        isFavorite: false,
        description: 'Description 2',
      ),
      TaskModel(
        id: '3',
        title: 'Task 3',
        isDone: false,
        isFavorite: false,
        description: 'Description 3',
      ),
      TaskModel(
        id: '4',
        title: 'Task 4',
        isDone: true,
        isFavorite: false,
        description: 'Description 4',
      ),
      TaskModel(
        id: '5',
        title: 'Task 5',
        isDone: false,
        isFavorite: false,
        description: 'Description 5',
      ),
    ]);
    emit(TaskSuccessState());
  }

  Future<void> _onAddTask(
    TaskManagementAddTaskEvent event,
    Emitter<TaskManagementState> emit,
  ) async {
    emit(TaskAddedLoadingState());
    tasks.add(
      TaskModel(
        id: (taskId).toString(),
        title: titleController.text,
        isDone: false,
        isFavorite: false,
        description: descriptionController.text,
      ),
    );
    taskId++;
    await Future.delayed(const Duration(seconds: 2));
    emit(TaskAddedSuccessState());
    FocusManager.instance.primaryFocus?.unfocus();
    titleController.clear();
    descriptionController.clear();
  }

  Future<void> _onDeleteTask(
    TaskManagementDeleteTaskEvent event,
    Emitter<TaskManagementState> emit,
  ) async {
    deleteIndex = event.index;
    emit(TaskDeletedLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    tasks.removeWhere((element) => element.id == event.taskId);
    deleteIndex = -1;
    emit(TaskDeletedSuccessState());
  }

  Future<void> _onUpdateStatusTask(
    TaskManagementUpdateStatusTaskEvent event,
    Emitter<TaskManagementState> emit,
  ) async {
    updateStatusIndex = event.index;
    emit(TaskUpdateStatusLoadingState());
    tasks.firstWhere((element) => element.id == event.taskId).isDone =
        event.isDone;
    await Future.delayed(const Duration(seconds: 1));

    emit(TaskUpdateStatusSuccessState());
    updateStatusIndex = -1;
  }
}
