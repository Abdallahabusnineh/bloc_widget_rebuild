// import 'dart:async';
// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// part 'test_event.dart';
// part 'test_state.dart';

// class ScreenTestBloc2 extends Bloc<ScreenTest2Event, ScreenTest2State> {
//   // Controllers
//   final TextEditingController fromCrl = TextEditingController();
//   final TextEditingController toCrl = TextEditingController();

//   // State variables
//   String selectedCategory = 'All';
//   String selectedCategory2 = 'Recent';
//   String selectedCategory3 = 'Abdallah';
//   int counter = 0;
//   bool isToggled = false;
//   List<String> categories = [
//     'All',
//     'General',
//     'Politics',
//     'Economy',
//     'Business',
//     'Entertainment',
//     'Sports',
//   ];
//   List<String> categories2 = ["Recent", "Popular", "Trending"];

//   List<String> categories3 = [
//     "Abdallah",
//     "Abdulrahman",
//     "Abdulaziz",
//     "Carlos",
//     "Cesar",
//     "Diana",
//     "Elsa",
//     "Fernanda",
//   ];

//   ScreenTestBloc2() : super(ScreenTest2InitialState()) {
//     on<InitEvent>(_onInitNews);
//     on<ScreenTest2SetCategoryEvent>(_onSetCategory);
//     on<ScreenTest2SetCategory2Event>(_onSetCategory2);
//     on<ScreenTest2SetCategory3Event>(_onSetCategory3);
//     on<ScreenTest2IncrementEvent>(_onIncrement);
//     on<ScreenTest2ToggleEvent>(_onToggle);
//   }

//   FutureOr<void> _onInitNews(
//     InitEvent event,
//     Emitter<ScreenTest2State> emit,
//   ) async {
//     emit(ScreenTest2LoadingState());

//     // Initialize with default category
//     selectedCategory = 'All';

//     emit(ScreenTest2LoadedState());
//   }

//   FutureOr<void> _onSetCategory(
//     ScreenTest2SetCategoryEvent event,
//     Emitter<ScreenTest2State> emit,
//   ) {
//     selectedCategory = event.category;
//     emit(ScreenTest2CategoryChangedState());
//   }

//   FutureOr<void> _onSetCategory2(
//     ScreenTest2SetCategory2Event event,
//     Emitter<ScreenTest2State> emit,
//   ) {
//     selectedCategory2 = event.category;
//     emit(ScreenTest2Category2ChangedState());
//   }

//   FutureOr<void> _onSetCategory3(
//     ScreenTest2SetCategory3Event event,
//     Emitter<ScreenTest2State> emit,
//   ) {
//     selectedCategory3 = event.category;
//     emit(ScreenTest2Category3ChangedState());
//   }

//   FutureOr<void> _onIncrement(
//     ScreenTest2IncrementEvent event,
//     Emitter<ScreenTest2State> emit,
//   ) {
//     counter++;
//     emit(ScreenTest2IncrementState());
//   }

//   FutureOr<void> _onToggle(
//     ScreenTest2ToggleEvent event,
//     Emitter<ScreenTest2State> emit,
//   ) {
//     isToggled = !isToggled;
//     emit(ScreenTest2ToggleState());
//   }
// }
