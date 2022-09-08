import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial()) {
    on<IncrementEvent>((event, emit) async {
      await Future.delayed(const Duration(seconds: 1));
      emit(state is CounterLoaded
          ? CounterLoaded(state.number + event.number)
          : CounterLoaded(event.number));
    });

    // on<IncrementEvent>((event, emit) async {
    //   await Future.delayed(const Duration(seconds: 1));
    //   emit(state is CounterLoaded
    //       ? CounterLoaded(state.number + event.number)
    //       : CounterLoaded(event.number));
    // }, transformer: sequential());

    // on<IncrementEvent>((event, emit) async {
    //   await Future.delayed(const Duration(seconds: 1));
    //   emit(state is CounterLoaded
    //       ? CounterLoaded(state.number + event.number)
    //       : CounterLoaded(event.number));
    // }, transformer: concurrent());

    // on<IncrementEvent>((event, emit) async {
    //   await Future.delayed(const Duration(seconds: 1));
    //   emit(state is CounterLoaded
    //       ? CounterLoaded(state.number + event.number)
    //       : CounterLoaded(event.number));
    // }, transformer: droppable());

    // on<IncrementEvent>((event, emit) async {
    //   await Future.delayed(const Duration(seconds: 1));
    //   emit(state is CounterLoaded
    //       ? CounterLoaded(state.number + event.number)
    //       : CounterLoaded(event.number));
    // }, transformer: restartable());

    on<DecrementEvent>((event, emit) {
      emit(state is CounterLoaded
          ? CounterLoaded(state.number - 1)
          : const CounterLoaded(-1));
    });
  }
}
