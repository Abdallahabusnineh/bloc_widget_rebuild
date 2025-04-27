import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_widget_rebuild/task/presentaion/bloc/task_bloc.dart';
import 'package:test_widget_rebuild/task/presentaion/screen/task_content.dart';
import 'package:test_widget_rebuild/test/presentation/screen/widget_for_view_rebuild_count.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => TaskManagementBloc()..add(TaskManagementGetTasksEvent()),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Colors.blue, Colors.purple]),
              ),
            ),
            //***************************************** make bloc builder for update appbar depend on state and value ********************************************************
            //?   BlocBuilder: The BlocBuilder is used here to rebuild the AppBar
            //?   title whenever the state of the TaskManagementBloc changes.
            //?   It checks if the state is TaskLoadingState (indicating that tasks are being loaded)
            //?   and displays a loading message, otherwise, it shows the number of tasks.
            title: BlocBuilder<TaskManagementBloc, TaskManagementState>(
              builder: (context, state) {
                var bloc = context.read<TaskManagementBloc>();
                if (state is TaskLoadingState) {
                  return const Text('Loading...');
                }
                return Text(
                  'Number of tasks: ${bloc.tasks.length}',
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                );
              },
            ),
            actions: [
              // !!!!!!!!!!  use builder for create fresh context from BlocProvider to access bloc  !!!!!!!!!!
              //?     Builder inside actions: The Builder widget is used within the actions of the AppBar to create a
              //?     fresh context. This is important because, in some cases,
              //?     you might not be able to directly access the Bloc in the actions without creating a fresh context using Builder.
              //?     This allows you to trigger an event (like refreshing the tasks) without needing to pass the TaskManagementBloc explicitly.
              Builder(
                builder:
                    (context) => IconButton(
                      onPressed: () {
                        context.read<TaskManagementBloc>().add(
                          TaskManagementGetTasksEvent(),
                        );
                      },
                      icon: const Icon(Icons.refresh, color: Colors.white),
                    ),
              ),
            ],
          ),
          body: BlocListener<TaskManagementBloc, TaskManagementState>(
            listener: (context, state) {
              if (state is TaskSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.green,
                    content: Text('Tasks loaded successfully'),
                  ),
                );
              }
              if (state is TaskAddedSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.green,
                    content: Text('Task added successfully'),
                  ),
                );
              }
              if (state is TaskDeletedSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.red,
                    content: Text('Task deleted successfully'),
                  ),
                );
              }
              if (state is TaskAddedErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.red,
                    content: Text(state.message),
                  ),
                );
              }
              if (state is TaskAddedErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.red,
                    content: Text(state.message),
                  ),
                );
              }
            },
            child: const TaskContent(),
          ),
        ),
      ),
    );
  }
}
