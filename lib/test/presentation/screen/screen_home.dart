import 'package:flutter/material.dart';
import 'package:test_widget_rebuild/test/presentation/screen/test_with_context_watch_screen.dart';
import 'package:test_widget_rebuild/test/presentation/screen/tset_with_blocbuilder_with_buildwhen_screen.dart';
import 'package:test_widget_rebuild/test/presentation/screen/tset_with_blocbuilder_without_buildwhen_screen.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 50,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TestWithContextWatchScreen(),
                  ),
                );
              },
              child: const Text("Test With context.watch"),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            const TsetWithBlocBuilderWithBuildWhenScreen(),
                  ),
                );
              },
              child: const Text("Test With BlocBuilder with buildWhen"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            const TsetWithBlocbuilderWithoutBuildwhenScreen(),
                  ),
                );
              },
              child: const Text("Test With BlocBuilder without buildWhen"),
            ),
          ],
        ),
      ),
    );
  }
}
