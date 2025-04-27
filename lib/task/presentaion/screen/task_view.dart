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
