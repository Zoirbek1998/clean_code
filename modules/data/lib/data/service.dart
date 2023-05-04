import 'package:cean_model/model/counter_model.dart';
import 'package:injectable/injectable.dart';

@injectable
abstract class ServiceCounter {
  int getIncrement();
}