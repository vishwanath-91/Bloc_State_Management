part of 'counter_bloc.dart';

sealed class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class ChangeCounterEvent extends CounterEvent {
  final int incrementSize;
  const ChangeCounterEvent(this.incrementSize);
  @override
  List<Object> get props => [incrementSize];
}
