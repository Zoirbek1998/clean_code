import 'package:bloc/bloc.dart';
import 'package:cean_model/model/counter_model.dart';
import 'package:clean_data/data/service/service_counter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'counter_bloc.freezed.dart';

part 'counter_event.dart';

part 'counter_state.dart';

@injectable
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final ServiceCounter serviceCounter;
  CounterBloc({required this.serviceCounter}) : super(const CounterState.initial()) {

    on<CounterResetEvent>((event, emit) async {
      emit(const CounterState.loading());
      await Future.delayed(const Duration(milliseconds: 1500));
      emit( CounterState.loaded(counter: await serviceCounter.getDefaultCounter()));
    });

    on<CounterIncrementEvent>((event, emit) async {

      if (state is _CounterLoadedState) {
        final counter = (state as _CounterLoadedState).counter;

        emit(const CounterState.loading());
        await Future.delayed(const Duration(milliseconds: 500));
        emit(CounterState.loaded(
            counter:await serviceCounter.getCounter(counter.counter+1)));
      }
    });
  }
}
