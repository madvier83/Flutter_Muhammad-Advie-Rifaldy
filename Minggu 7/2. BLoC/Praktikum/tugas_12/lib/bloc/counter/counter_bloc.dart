import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugas_12/bloc/counter/counter_event.dart';
import 'package:tugas_12/bloc/counter/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(value: 0)) {
    on<Increment>(
      (event, emit) => emit(
        CounterState(value: state.value + 1),
      ),
    );
    on<Decrement>(
      (event, emit) => emit(
        CounterState(value: state.value - 1),
      ),
    );
  }
}
