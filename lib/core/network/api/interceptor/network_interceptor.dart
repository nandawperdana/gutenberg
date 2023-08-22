import 'package:dio/dio.dart';

import 'package:gutenberg/core/network/connection/internet_connection_checker.dart';
import 'package:gutenberg/domain/base/exception.dart';

class NetworkCheckingInterceptor extends Interceptor {
  late final InternetConnectionChecker _internetConnectionChecker;

  NetworkCheckingInterceptor({
    required InternetConnectionChecker internetConnectionChecker,
  }) {
    _internetConnectionChecker = internetConnectionChecker;
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (await _internetConnectionChecker.hasConnection) {
      super.onRequest(options, handler);
    } else {
      _sendConnectionError(options, handler);
    }
  }

  void _sendConnectionError(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    handler.reject(
      DioException(
        requestOptions: options,
        response: null,
        type: DioExceptionType.connectionTimeout,
        error: NoInternetException(),
      ),
    );
  }
}
