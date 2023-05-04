 import 'package:cean_model/model/counter_model.dart';
import 'package:clean_data/data/service.dart';
import 'package:injectable/injectable.dart';

@injectable
class CounterRepo implements ServiceCounter{
  var counter = const CounterModel(counter: 0);
  @override
  int getIncrement() => counter.counter;
}
