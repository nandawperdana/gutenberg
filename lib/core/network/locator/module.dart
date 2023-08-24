import 'package:get_it/get_it.dart';

import 'package:gutenberg/core/network/api/client/api_dio.dart';
import 'package:gutenberg/core/network/api/interceptor/api_retry_interceptor.dart';
import 'package:gutenberg/core/network/api/interceptor/network_interceptor.dart';
import 'package:gutenberg/core/network/connection/internet_connection_checker.dart';

void registerModules(GetIt locator) {
  _registerInterceptorModules(locator);
  _registerClients(locator);
}

void _registerClients(GetIt locator) {
  locator.registerLazySingleton(() => ApiDio(
      apiRetryInterceptor: locator<ApiRetryInterceptor>(),
      networkCheckingInterceptor: locator<NetworkCheckingInterceptor>()));
}

void _registerInterceptorModules(GetIt locator) {
  locator.registerLazySingleton(() => InternetConnectionChecker());

  locator.registerLazySingleton(() => ApiRetryInterceptor());

  locator.registerLazySingleton(() => NetworkCheckingInterceptor(
      internetConnectionChecker: locator<InternetConnectionChecker>()));
}
