import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import 'package:gutenberg/core/env/environment_config.dart';
import 'package:gutenberg/core/network/api/client/config.dart';
import 'package:gutenberg/core/network/api/interceptor/api_retry_interceptor.dart';
import 'package:gutenberg/core/network/api/interceptor/network_interceptor.dart';

class ApiDio extends DioForNative {
  // late final ApiRetryInterceptor _apiRetryInterceptor;
  //
  // late final NetworkCheckingInterceptor _networkCheckingInterceptor;

  ApiDio({
    required ApiRetryInterceptor apiRetryInterceptor,
    required NetworkCheckingInterceptor networkCheckingInterceptor,
    BaseOptions? options,
  }) : super(options) {
    // _apiRetryInterceptor = apiRetryInterceptor;
    // _networkCheckingInterceptor = networkCheckingInterceptor;

    _configureOptions();
    _configureInterceptors();
  }

  void _configureOptions() {
    options.baseUrl = EnvironmentConfig.apiUrl;
    options.connectTimeout = timeOutDuration;
    options.receiveTimeout = timeOutDuration;
    options.sendTimeout = timeOutDuration;
    options.maxRedirects = maxRetry;
    options.extra[keyCacheDuration] = cacheDuration;
  }

  void _configureInterceptors() {
    // interceptors
    //   ..add(_networkCheckingInterceptor)
    //   ..add(_apiRetryInterceptor);
  }
}
