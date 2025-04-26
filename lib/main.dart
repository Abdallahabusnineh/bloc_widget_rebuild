import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:test_widget_rebuild/bloc_observer.dart';
import 'package:test_widget_rebuild/test/presentation/screen/screen_home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ScreenHome(),
    );
  }
}
