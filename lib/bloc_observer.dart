import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class MyBlocObserver extends BlocObserver {
  static final MyBlocObserver _instance = MyBlocObserver._internal();

  factory MyBlocObserver() => _instance;

  MyBlocObserver._internal();

  final Set<String> loggedErrors = {};

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    debugPrint('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // final errorString = '$error${stackTrace.toString()}';

    // if (!loggedErrors.contains(errorString)) {
    //   loggedErrors.add(errorString);
    //   FirebaseCrashlytics.instance.recordError(
    //     error,
    //     stackTrace,
    //     reason: 'BLoC error: ${bloc.runtimeType}',
    //     fatal: false,
    //   );
    // }
    debugPrint('onError -- ${bloc.runtimeType}, $error, $stackTrace');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    debugPrint('onClose -- ${bloc.runtimeType}');
  }
}
