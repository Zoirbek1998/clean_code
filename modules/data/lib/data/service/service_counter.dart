
import 'package:cean_model/model/counter_model.dart';

abstract class ServiceCounter {
  Future<CounterModel> getDefaultCounter();
  Future<CounterModel> getCounter(int counter);
}