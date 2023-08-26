import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:gutenberg/core/network/api/client/api_dio.dart';
import 'package:gutenberg/core/network/api/interceptor/api_retry_interceptor.dart';
import 'package:gutenberg/core/network/api/interceptor/network_interceptor.dart';
import 'package:gutenberg/core/network/connection/internet_connection_checker.dart';
import 'package:gutenberg/core/route/transporter.dart';
import 'mock.mocks.dart';

GetIt locatorForTest = GetIt.instance;

@visibleForTesting
@GenerateMocks([
  ApiDio,
  ApiRetryInterceptor,
  NetworkCheckingInterceptor,
  InternetConnectionChecker,
])
void initMockNetwork() {
  locatorForTest.allowReassignment = true;

  locatorForTest.registerSingleton<ApiDio>(MockApiDio());
  locatorForTest
      .registerSingleton<ApiRetryInterceptor>(MockApiRetryInterceptor());
  locatorForTest.registerSingleton<NetworkCheckingInterceptor>(
      MockNetworkCheckingInterceptor());
  locatorForTest.registerSingleton<InternetConnectionChecker>(
      MockInternetConnectionChecker());
}

@GenerateMocks([
  Transporter,
])
@visibleForTesting
void initMockTransporter() {
  locatorForTest.allowReassignment = true;

  final mockTransporter = MockTransporter();
  final route = MaterialPageRoute(
    builder: (context) => const SizedBox(),
  );

  locatorForTest.registerLazySingleton<Transporter>(() => mockTransporter);

  when(mockTransporter.rootNavigationKey)
      .thenAnswer((_) => GlobalKey<NavigatorState>());
  when(mockTransporter.generateRoute(any)).thenAnswer((_) => route);
  when(mockTransporter.registerRoute(any, any)).thenAnswer((_) => {});
  when(mockTransporter.getActiveRouteName()).thenAnswer((_) => 'route');
}
