import 'package:clean_data/initialize_services.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@InjectableInit()
void initializeServices() {
  final getIt = GetIt.instance;
  getIt.init();
}
