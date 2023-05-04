

import 'package:clean_business/block_factory.config.dart';
import 'package:clean_data/initialize_services.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@InjectableInit()
void initializeBlocs() {
  final getIt = GetIt.instance;
  initializeServices();
  getIt.init();
}
