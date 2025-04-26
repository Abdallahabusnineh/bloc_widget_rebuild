part of 'screen_bloc.dart';

@immutable
sealed class ScreenTestEvent {}

class InitEvent extends ScreenTestEvent {}
class ScreenTestIncrementEvent extends ScreenTestEvent {


}
class ScreenTestToggleEvent extends ScreenTestEvent {

}

class ScreenTestSetCategoryEvent extends ScreenTestEvent {
  final String category;
  ScreenTestSetCategoryEvent(this.category);
}

class ScreenTestSetCategory2Event extends ScreenTestEvent {
  final String category;
  ScreenTestSetCategory2Event(this.category);
}

class ScreenTestSetCategory3Event extends ScreenTestEvent {
  final String category;
  ScreenTestSetCategory3Event(this.category);
}

