import 'package:cean_model/model/counter_model.dart';
import 'package:clean_data/data/service/service_counter.dart';
import 'package:injectable/injectable.dart';


@LazySingleton(as: ServiceCounter)
class Internals  implements ServiceCounter{
  @override
  Future<CounterModel> getDefaultCounter() async{
    return const CounterModel(counter: 0);
  }

  @override
  Future<CounterModel> getCounter(int counter)async {
    return  CounterModel(counter: counter);
  }
}