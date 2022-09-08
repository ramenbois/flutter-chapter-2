part of 'counter_bloc.dart';

@immutable
abstract class CounterState {
  final int number;

  const CounterState(this.number);
}

class CounterInitial extends CounterState {
  const CounterInitial() : super(0);
}

class CounterLoaded extends CounterState {
  const CounterLoaded(int number) : super(number);
}
