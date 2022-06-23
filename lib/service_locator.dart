import 'package:get_it/get_it.dart';
import 'package:scope_model/scope_models/home_model.dart';

import 'services/storage_service.dart';

GetIt locator = GetIt.asNewInstance();

void setUplocator() {
  locator.registerLazySingleton<StorageService>(() => StorageService());
  locator.registerFactory<homeModel>(() => homeModel());
}
