part of 'counter_bloc.dart';

@freezed
abstract class CounterEvent with _$CounterEvent {
  const factory CounterEvent.reset() = CounterResetEvent;
  const factory CounterEvent.increment() = CounterIncrementEvent;
}



