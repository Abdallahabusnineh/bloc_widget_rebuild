import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_widget_rebuild/test/presentation/bloc/screen_bloc.dart';
import 'package:test_widget_rebuild/button.dart';
import 'package:test_widget_rebuild/test/presentation/screen/widget_for_view_rebuild_count.dart';

class TestWithContextWatchScreen extends StatelessWidget {
  const TestWithContextWatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ScreenTestBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Test With context.watch',
            style: TextStyle(fontSize: 15),
          ),
          actions: [],
        ),
        // to track rebuild
        body: const TestWithContextWatchContent(),
      ),
    );
  }
}

class TestWithContextWatchContent extends StatelessWidget {
  const TestWithContextWatchContent({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<ScreenTestBloc>();
    var blocListener = context.watch<ScreenTestBloc>();
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: RebuildCounter(
        label: "TestWithContextWatchContent",
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 40,
          children: [
            const SizedBox(height: 10),
            RebuildCounter(
              label: "TextField",
              child: TextField(
                enabled: false,
                decoration: InputDecoration(
                  hintText: "Enter your name",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            RebuildCounter(
              label: "Button",
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      bloc.add(ScreenTestIncrementEvent());
                    },
                    child: Icon(Icons.add, size: 30),
                  ),
                ],
              ),
            ),

            RebuildCounter(
              label: "Toggle ",
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      bloc.add(ScreenTestToggleEvent());
                    },
                    child: Container(
                      width: 150,
                      height: 100,
                      decoration: BoxDecoration(
                        color:
                            blocListener.isToggled ? Colors.blue : Colors.black,
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
                ],
              ),
            ),

            RebuildCounter(
              label: "ListView 1 ",
              child: SizedBox(
                height: 80,
                child: ListView.builder(
                  itemCount: bloc.categories.length,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var categories = bloc.categories;
                    return MyButton(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      color:
                          blocListener.selectedCategory == categories[index]
                              ? Colors.red
                              : Colors.green,
                      borderColor:
                          blocListener.selectedCategory == categories[index]
                              ? Colors.red
                              : Colors.green,

                      title: categories[index],
                      onPressed: () {
                        bloc.add(ScreenTestSetCategoryEvent(categories[index]));
                      },
                    );
                  },
                ),
              ),
            ),

            RebuildCounter(
              label: "ListView 2 ",
              child: SizedBox(
                height: 80,
                child: ListView.builder(
                  itemCount: bloc.categories2.length,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var categories = bloc.categories2;
                    return MyButton(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      color:
                          blocListener.selectedCategory2 == categories[index]
                              ? Colors.blueGrey
                              : Colors.blue,
                      borderColor:
                          blocListener.selectedCategory2 == categories[index]
                              ? Colors.blueGrey
                              : Colors.blue,

                      title: categories[index],
                      onPressed: () {
                        bloc.add(
                          ScreenTestSetCategory2Event(categories[index]),
                        );
                      },
                    );
                  },
                ),
              ),
            ),

            RebuildCounter(
              label: "ListView 3 ",
              child: SizedBox(
                height: 80,
                child: ListView.builder(
                  itemCount: bloc.categories3.length,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var categories = bloc.categories3;
                    return MyButton(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      color:
                          blocListener.selectedCategory3 == categories[index]
                              ? Colors.purple
                              : Colors.tealAccent,
                      borderColor:
                          blocListener.selectedCategory3 == categories[index]
                              ? Colors.purple
                              : Colors.tealAccent,

                      title: categories[index],
                      onPressed: () {
                        bloc.add(
                          ScreenTestSetCategory3Event(categories[index]),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
