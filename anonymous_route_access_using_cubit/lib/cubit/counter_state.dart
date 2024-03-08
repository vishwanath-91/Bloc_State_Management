part of 'counter_cubit.dart';

final class CounterState extends Equatable {
  final int counter;
  const CounterState({required this.counter});

  factory CounterState.initial() {
    return const CounterState(counter: 0);
  }

  CounterState copyWith({int? counter}) {
    return CounterState(counter: counter!);
  }

  @override
  List<Object> get props => [counter];

  @override
  String toString() => 'CounterState(counter: $counter)';
}
