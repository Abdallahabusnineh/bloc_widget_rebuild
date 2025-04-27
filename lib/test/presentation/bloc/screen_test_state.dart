part of 'screen_bloc.dart';

@immutable
sealed class ScreenTestState {}

class ScreenTestInitialState extends ScreenTestState {}

class ScreenTestLoadingState extends ScreenTestState {}

class ScreenTestLoadedState extends ScreenTestState {}

class ScreenTestErrorState extends ScreenTestState {}

class ScreenTestCategoryChangedState extends ScreenTestState {}
class ScreenTestCategory2ChangedState extends ScreenTestState {}
class ScreenTestCategory3ChangedState extends ScreenTestState {}

class ScreenTestIncrementState extends ScreenTestState {}
class ScreenTestLoadingIncrementState extends ScreenTestState {}
class ScreenTestToggleState extends ScreenTestState {}




