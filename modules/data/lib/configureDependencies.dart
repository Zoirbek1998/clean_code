import 'dart:developer';

import 'package:clean_data/data/counter_data.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'data/service.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)

void configureDependencies() => getIt;
