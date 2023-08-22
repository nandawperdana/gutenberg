import 'package:dio/dio.dart';

import 'package:gutenberg/core/network/api/client/api_dio.dart';
import 'package:gutenberg/core/network/api/ext/dio_exception.dart';
import 'package:gutenberg/domain/base/exception.dart';

class ApiRetryInterceptor extends Interceptor {
  late final ApiDio _apiDio;

  ApiRetryInterceptor({
    required ApiDio apiDio,
  }) {
    _apiDio = apiDio;
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.isNeedToRetry && err.requestOptions.maxRedirects > 0) {
      final newRequestOptions = err.requestOptions;
      newRequestOptions.maxRedirects--;
      try {
        final newResponse = await _apiDio.fetch(newRequestOptions);
        handler.resolve(newResponse);
      } catch (e) {
        _handleError(e, err, handler);
      }
    } else {
      super.onError(err, handler);
    }
  }

  void _handleError(
    Object e,
    DioException dioError,
    ErrorInterceptorHandler handler,
  ) {
    if (e.runtimeType == DioException) {
      super.onError(e as DioException, handler);
    } else {
      super.onError(
        DioException(
          requestOptions: dioError.requestOptions,
          response: null,
          type: DioExceptionType.connectionTimeout,
          error: RetryException(),
        ),
        handler,
      );
    }
  }
}
