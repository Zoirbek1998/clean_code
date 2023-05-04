part of 'counter_bloc.dart';

@immutable
class CounterState {
  int counter;
  CounterState({required this.counter});
}

class InitState extends CounterState {
  InitState() : super(counter: CounterRepo().getIncrement() );
}
