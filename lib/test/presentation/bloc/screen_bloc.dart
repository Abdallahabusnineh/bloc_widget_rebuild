import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'screen_test_event.dart';
part 'screen_test_state.dart';

class ScreenTestBloc extends Bloc<ScreenTestEvent, ScreenTestState> {
  // Controllers
  final TextEditingController fromCrl = TextEditingController();
  final TextEditingController toCrl = TextEditingController();

  // State variables
  String selectedCategory = 'All';
  String selectedCategory2 = 'Recent';
  String selectedCategory3 = 'Abdallah';
  int counter = 0;
  bool isToggled = false;
  List<String> categories = [
    'All',
    'General',
    'Politics',
    'Economy',
    'Business',
    'Entertainment',
    'Sports',
  ];

  List<String> categories2 = ["Recent", "Popular", "Trending"];

  List<String> categories3 = [
    "Abdallah",
    "Abdulrahman",
    "Abdulaziz",
    "Carlos",
    "Cesar",
    "Diana",
    "Elsa",
    "Fernanda",
  ];

  ScreenTestBloc() : super(ScreenTestInitialState()) {
    on<InitEvent>(_onInit);
    on<ScreenTestSetCategoryEvent>(_onSetCategory);
    on<ScreenTestSetCategory2Event>(_onSetCategory2);
    on<ScreenTestSetCategory3Event>(_onSetCategory3);
    on<ScreenTestIncrementEvent>(_onIncrement);
    on<ScreenTestToggleEvent>(_onToggle);
  }

  FutureOr<void> _onInit(
    InitEvent event,
    Emitter<ScreenTestState> emit,
  ) async {
    emit(ScreenTestLoadingState());

    // Initialize with default category
    selectedCategory = 'All';

    emit(ScreenTestLoadedState());
  }

  FutureOr<void> _onSetCategory(
    ScreenTestSetCategoryEvent event,
    Emitter<ScreenTestState> emit,
  ) {
    selectedCategory = event.category;
    emit(ScreenTestCategoryChangedState());
  }

  FutureOr<void> _onSetCategory2(
    ScreenTestSetCategory2Event event,
    Emitter<ScreenTestState> emit,
  ) {
    selectedCategory2 = event.category;
    emit(ScreenTestCategory2ChangedState());
  }

  FutureOr<void> _onSetCategory3(
    ScreenTestSetCategory3Event event,
    Emitter<ScreenTestState> emit,
  ) {
    selectedCategory3 = event.category;
    emit(ScreenTestCategory3ChangedState());
  }

  FutureOr<void> _onIncrement(
    ScreenTestIncrementEvent event,
    Emitter<ScreenTestState> emit,
  ) {
    counter++;
    emit(ScreenTestIncrementState());
  }

  FutureOr<void> _onToggle(
    ScreenTestToggleEvent event,
    Emitter<ScreenTestState> emit,
  ) {
    isToggled = !isToggled;
    emit(ScreenTestToggleState());
  }
}
