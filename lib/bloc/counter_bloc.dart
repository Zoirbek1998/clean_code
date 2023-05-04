import 'package:bloc/bloc.dart';
import 'package:clean_data/data/counter_data.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(InitState()) {
    on<Increment>((event, emit) {
      emit(CounterState(counter: state.counter + 1));
    });
    on<Decrement>((event, emit) {
      emit(CounterState(counter: state.counter - 1));
    });
  }
}
