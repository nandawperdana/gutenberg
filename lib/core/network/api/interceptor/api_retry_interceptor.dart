import 'package:dio/dio.dart';

import 'package:gutenberg/core/network/api/ext/dio_exception.dart';
import 'package:gutenberg/domain/base/exception.dart';

class ApiRetryInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.isApiError) {
      _handleError(ApiException(err), err, handler);
    } else {
      super.onError(err, handler);
    }
  }

  void _handleError(
    Object e,
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    if (e.runtimeType == DioException) {
      super.onError(e as DioException, handler);
    } else {
      super.onError(
        DioException(
          requestOptions: err.requestOptions,
          response: null,
          type: DioExceptionType.connectionTimeout,
          error: RetryException(),
        ),
        handler,
      );
    }
  }
}
