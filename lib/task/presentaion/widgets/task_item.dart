import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_widget_rebuild/task/presentaion/bloc/task_bloc.dart';
import 'package:test_widget_rebuild/test/presentation/screen/widget_for_view_rebuild_count.dart';

class TaskItem extends StatelessWidget {
  final int index;

  const TaskItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var tasksBloc = context.read<TaskManagementBloc>();
    var task = tasksBloc.tasks[index];
    return BlocSelector<
      TaskManagementBloc,
      TaskManagementState,
      (bool isLoadingForUpdate, bool isLoadingForDelete)
    >(
      selector: (state) {
        final isLoadingForUpdate =
            state is TaskUpdateStatusLoadingState &&
            tasksBloc.updateStatusIndex == index;
        final isLoadingForDelete =
            state is TaskDeletedLoadingState && tasksBloc.deleteIndex == index;
        return (isLoadingForUpdate, isLoadingForDelete);
      },
      builder: (context, isLoading) {
        final (isLoadingForUpdate, isLoadingForDelete) = isLoading;
        print("is loading: $isLoading");
        return RebuildCounter(
          label: 'Task item Rebuild',
          child: ListTile(
            title: Text(task.title),
            subtitle: Text(task.description),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                isLoadingForUpdate
                    ? const CircularProgressIndicator()
                    : IconButton(
                      icon:
                          task.isDone
                              ? const Icon(
                                Icons.check_circle,
                                size: 30,
                                color: Colors.green,
                              )
                              : const Icon(
                                Icons.check_circle_outline,
                                size: 30,
                              ),
                      onPressed: () {
                        tasksBloc.add(
                          TaskManagementUpdateStatusTaskEvent(
                            taskId: task.id,
                            isDone: !task.isDone,
                            index: index,
                          ),
                        );
                      },
                    ),
                isLoadingForDelete
                    ? const CircularProgressIndicator()
                    : IconButton(
                      icon: const Icon(
                        Icons.delete,
                        size: 30,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        tasksBloc.add(
                          TaskManagementDeleteTaskEvent(
                            taskId: task.id,
                            index: index,
                          ),
                        );
                      },
                    ),
              ],
            ),
          ),
        );
      },
    );
  }
}
