import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cubit_to_cubit_communication_using_streamsubscription/business_layer/color_cubit/color_cubit.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  int incrementSize = 1;
  final ColorCubit colorCubit;
  late StreamSubscription colorSubscription;

  CounterCubit({required this.colorCubit}) : super(CounterState.initial()) {
    colorSubscription = colorCubit.stream.listen((colorCubit) {
      if (ColorState.initial().color == Colors.red) {
        incrementSize = 1;
      } else if (ColorState.initial().color == Colors.green) {
        incrementSize = 10;
      } else if (ColorState.initial().color == Colors.blue) {
        incrementSize = 100;
      } else if (ColorState.initial().color == Colors.black) {
        emit(state.copyWith(counter: state.counter - 100));
      }
    });
  }

  void changeCounter() {
    emit(state.copyWith(counter: state.counter + incrementSize));
  }

  @override
  Future<void> close() {
    colorSubscription.cancel();
    return super.close();
  }
}
