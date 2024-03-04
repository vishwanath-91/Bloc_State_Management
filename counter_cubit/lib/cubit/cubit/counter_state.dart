part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int counter;
  const CounterState({required this.counter});

  CounterState copyWith({int? counter}) {
    return CounterState(counter: counter ?? this.counter);
  }

  factory CounterState.initial() {
    return const CounterState(counter: 0);
  }

  @override
  String toString() => 'CounterState(counter:$counter)';

  @override
  List<Object> get props => [counter];
}
