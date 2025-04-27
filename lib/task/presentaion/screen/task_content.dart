import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_widget_rebuild/task/presentaion/bloc/task_bloc.dart';
import 'package:test_widget_rebuild/task/presentaion/widgets/task_item.dart';
import 'package:test_widget_rebuild/test/presentation/screen/widget_for_view_rebuild_count.dart';

class TaskContent extends StatelessWidget {
  const TaskContent({super.key});

  @override
  Widget build(BuildContext context) {
    var tasksBloc = context.read<TaskManagementBloc>();
    print(
      "****************************** All tasks content Rebuild is build **********************************************",
    );
    return RebuildCounter(
      label: 'All tasks content Rebuild',
      child: BlocSelector<TaskManagementBloc, TaskManagementState, bool>(
        selector: (isLoading) {
          if (isLoading is TaskLoadingState) {
            return true;
          }
          return false;
        },
        builder: (context, isLoading) {
          return isLoading
              ? Expanded(
                child: const Center(
                  child: CircularProgressIndicator(color: Colors.blue),
                ),
              )
              : Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate([
                          Form(
                            key: tasksBloc.formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RebuildCounter(
                                  label: 'title TextFormField Rebuild',
                                  child: TextFormField(
                                    controller: tasksBloc.titleController,
                                    decoration: const InputDecoration(
                                      hintText: 'Title',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                        gapPadding: 10,
                                      ),
                                    ),
                                    validator:
                                        (value) =>
                                            value == null || value.isEmpty
                                                ? 'Please enter a title'
                                                : null,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                RebuildCounter(
                                  label: 'description TextFormField Rebuild',
                                  child: TextFormField(
                                    controller: tasksBloc.descriptionController,
                                    decoration: const InputDecoration(
                                      hintText: 'Description',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                        gapPadding: 10,
                                      ),
                                    ),
                                    validator:
                                        (value) =>
                                            value == null || value.isEmpty
                                                ? 'Please enter a description'
                                                : null,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                RebuildCounter(
                                  label: 'ElevatedButton Rebuild',
                                  child: BlocSelector<
                                    TaskManagementBloc,
                                    TaskManagementState,
                                    bool
                                  >(
                                    selector:
                                        (state) =>
                                            state is TaskAddedLoadingState,
                                    builder: (context, isLoading) {
                                      return isLoading
                                          ? const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Center(
                                              child: CircularProgressIndicator(
                                                color: Colors.blue,
                                              ),
                                            ),
                                          )
                                          : ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              minimumSize: const Size(
                                                double.infinity,
                                                50,
                                              ),
                                              backgroundColor: Colors.blue,
                                              foregroundColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            onPressed: () {
                                              if (tasksBloc
                                                  .formKey
                                                  .currentState!
                                                  .validate()) {
                                                tasksBloc.add(
                                                  TaskManagementAddTaskEvent(),
                                                );
                                              }
                                            },
                                            child: const Text(
                                              'Add Task',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17,
                                              ),
                                            ),
                                          );
                                    },
                                  ),
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ),

                    BlocBuilder<TaskManagementBloc, TaskManagementState>(
                      buildWhen:
                          (_, state) =>
                              state is TaskLoadingState ||
                              state is TaskSuccessState ||
                              state is TaskErrorState ||
                              state is TaskAddedSuccessState ||
                              state is TaskDeletedSuccessState,
                      builder: (context, state) {
                        if (state is TaskLoadingState) {
                          return const SliverFillRemaining(
                            child: Center(
                              child: CircularProgressIndicator(
                                color: Colors.blue,
                              ),
                            ),
                          );
                        }
                        return SliverPadding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          sliver: SliverList.separated(
                            itemBuilder:
                                (context, index) => TaskItem(index: index),
                            separatorBuilder:
                                (context, index) => const Divider(),
                            itemCount: tasksBloc.tasks.length,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
        },
      ),
    );
  }
}
