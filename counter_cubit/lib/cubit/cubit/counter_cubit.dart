import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState.initial());
  void increment() {
    final newstate = state.copyWith(counter: state.counter + 1);
    if (kDebugMode) {
      print("this is increment $newstate");
    }
    emit(newstate);
  }

  void decrement() {
    emit(
      state.copyWith(counter: state.counter - 1),
    );
  }
}
