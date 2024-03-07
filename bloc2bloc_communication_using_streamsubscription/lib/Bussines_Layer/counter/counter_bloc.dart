import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc2bloc_communication_using_streamsubscription/Bussines_Layer/color/color_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int incrementSize = 1;
  final ColorBloc colorbloc;
  late final StreamSubscription colorSubscription;
  CounterBloc({required this.colorbloc}) : super(CounterState.initial()) {
    colorSubscription = colorbloc.stream.listen((ColorState colorstate) {
      if (colorstate.color == Colors.red) {
        incrementSize = 1;
      } else if (colorstate.color == Colors.green) {
        incrementSize = 10;
      } else if (colorstate.color == Colors.blue) {
        incrementSize = 100;
      } else if (colorstate.color == Colors.black) {
        incrementSize = -100;
        add(ChangeCounterEvent());
      }
    });
    on<ChangeCounterEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter + incrementSize));
    });
  }

  @override
  Future<void> close() {
    colorSubscription.cancel();
    return super.close();
  }
}
