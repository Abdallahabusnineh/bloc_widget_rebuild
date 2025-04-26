import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_widget_rebuild/test/presentation/bloc/screen_bloc.dart';
import 'package:test_widget_rebuild/button.dart';
import 'package:test_widget_rebuild/test/presentation/screen/widget_for_view_rebuild_count.dart';

class TsetWithBlocBuilderWithBuildWhenScreen extends StatelessWidget {
  const TsetWithBlocBuilderWithBuildWhenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ScreenTestBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Test With BlocBuilder with buildWhen',   style: TextStyle(fontSize: 15),),
        ),
        body: const TsetWithBlocBuilderWithBuildWhenContent(),
      ),
    );
  }
}

class TsetWithBlocBuilderWithBuildWhenContent extends StatelessWidget {
  const TsetWithBlocBuilderWithBuildWhenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: RebuildCounter(
        label: "TsetWithBlocBuilderWithBuildWhenContent",
        child: Column(
          spacing: 40,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            RebuildCounter(
              label: 'TextField',
              child: const TextField(
                enabled: false,
                decoration: InputDecoration(
                  hintText: "Enter your name",
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            /// BUTTON
            RebuildCounter(
              label: "Button BlocBuilder",
              child: BlocBuilder<ScreenTestBloc, ScreenTestState>(
                buildWhen: (_, state) => state is ScreenTestIncrementState,
                builder: (context, state) {
                  final bloc = context.read<ScreenTestBloc>();
                  return RebuildCounter(
                    label: "Button",
                    child: TextButton(
                      onPressed: () {
                        bloc.add(ScreenTestIncrementEvent());
                      },
                      child: Icon(Icons.add, size: 30),
                    ),
                  );
                },
              ),
            ),

            /// TOGGLE BOX
            RebuildCounter(
              label: "Toggle BlocBuilder",
              child: BlocBuilder<ScreenTestBloc, ScreenTestState>(
                buildWhen: (_, state) => state is ScreenTestToggleState,
                builder: (context, state) {
                  final bloc = context.read<ScreenTestBloc>();
                  return RebuildCounter(
                    label: "Toggle",
                    child: GestureDetector(
                      key: const Key("toogle for testing"),
                      onTap: () {
                        bloc.add(ScreenTestToggleEvent());
                      },
                      child: Container(
                        width: 150,
                        height: 100,
                        decoration: BoxDecoration(
                          color: bloc.isToggled ? Colors.blue : Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Click me",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            /// CATEGORY LIST 1
            RebuildCounter(
              label: "ListView 1 BlocBuilder",
              child: BlocBuilder<ScreenTestBloc, ScreenTestState>(
                buildWhen:
                    (_, state) => state is ScreenTestCategoryChangedState,
                builder: (context, state) {
                  final bloc = context.read<ScreenTestBloc>();
                  return RebuildCounter(
                    label: "ListView 1",
                    child: SizedBox(
                      key: const Key("list view 1 for testing"),
                      height: 80,
                      child: ListView.builder(
                        itemCount: bloc.categories.length,
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        itemBuilder: (context, index) {
                          final category = bloc.categories[index];
                          return MyButton(
                            height: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            color:
                                bloc.selectedCategory == category
                                    ? Colors.red
                                    : Colors.green,
                            borderColor:
                                bloc.selectedCategory == category
                                    ? Colors.red
                                    : Colors.green,
                            title: category,
                            onPressed: () {
                              bloc.add(ScreenTestSetCategoryEvent(category));
                            },
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),

            /// CATEGORY LIST 2
            RebuildCounter(
              label: "ListView 2 BlocBuilder",
              child: BlocBuilder<ScreenTestBloc, ScreenTestState>(
                buildWhen:
                    (_, state) => state is ScreenTestCategory2ChangedState,
                builder: (context, state) {
                  final bloc = context.read<ScreenTestBloc>();
                  return RebuildCounter(
                    label: "ListView 2",
                    child: SizedBox(
                      key: const Key("list view 2 for testing"),
                      height: 80,
                      child: ListView.builder(
                        itemCount: bloc.categories2.length,
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        itemBuilder: (context, index) {
                          final category = bloc.categories2[index];
                          return MyButton(
                            height: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            color:
                                bloc.selectedCategory2 == category
                                    ? Colors.blueGrey
                                    : Colors.blue,
                            borderColor:
                                bloc.selectedCategory2 == category
                                    ? Colors.blueGrey
                                    : Colors.blue,
                            title: category,
                            onPressed: () {
                              bloc.add(ScreenTestSetCategory2Event(category));
                            },
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),

            /// CATEGORY LIST 3
            RebuildCounter(
              label: "ListView 3 BlocBuilder",
              child: BlocBuilder<ScreenTestBloc, ScreenTestState>(
                buildWhen:
                    (_, state) => state is ScreenTestCategory3ChangedState,
                builder: (context, state) {
                  final bloc = context.read<ScreenTestBloc>();
                  return RebuildCounter(
                    label: "ListView 3",
                    child: SizedBox(
                      key: const Key("list view 3 for testing"),
                      height: 80,
                      child: ListView.builder(
                        itemCount: bloc.categories3.length,
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        itemBuilder: (context, index) {
                          final category = bloc.categories3[index];
                          return MyButton(
                            height: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            color:
                                bloc.selectedCategory3 == category
                                    ? Colors.purple
                                    : Colors.tealAccent,
                            borderColor:
                                bloc.selectedCategory3 == category
                                    ? Colors.purple
                                    : Colors.tealAccent,
                            title: category,
                            onPressed: () {
                              bloc.add(ScreenTestSetCategory3Event(category));
                            },
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
