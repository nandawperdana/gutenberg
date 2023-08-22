import 'package:dio/dio.dart';

import 'package:gutenberg/core/env/environment_config.dart';
import 'package:gutenberg/core/network/api/client/dio_client.dart';
import 'package:gutenberg/domain/base/exception.dart';

class DioClientImpl implements DioClient {
  late Dio _dio;

  DioClientImpl._();

  static final DioClientImpl _dioClient = DioClientImpl._();

  ///Initialize [DioClient] only once (Singleton) for API usage
  factory DioClientImpl.initialize() {
    const timeOutDuration = Duration(seconds: 10);

    final dioInstance = Dio(
      BaseOptions(
        baseUrl: EnvironmentConfig.apiUrl,
        connectTimeout: timeOutDuration,
        receiveTimeout: timeOutDuration,
        sendTimeout: timeOutDuration,
        receiveDataWhenStatusError: true,
      ),
    );
    return _dioClient.._dio = dioInstance;
  }

  @override
  Future<Response<dynamic>> get(
    String uriPath, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.get(
        uriPath,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      throw ApiException(_handleDioError(e));
    } catch (e) {
      throw ApiException(_handleDioError(e));
    }
  }

  @override
  Future<Response<dynamic>> post(
    String uriPath, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.post(
        uriPath,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      throw ApiException(_handleDioError(e));
    } catch (e) {
      throw ApiException(_handleDioError(e));
    }
  }

  String _handleDioError(dynamic error) {
    var errorDescription = '';
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.cancel:
          errorDescription = 'Request to server was cancelled';
          break;
        case DioExceptionType.connectionTimeout:
          errorDescription = 'Connection timeout with server';
          break;
        case DioExceptionType.connectionError:
          errorDescription =
              'Connection to server failed due to internet connection';
          break;
        case DioExceptionType.receiveTimeout:
          errorDescription = 'Receive timeout in connection with server';
          break;
        case DioExceptionType.badResponse:
          errorDescription = error.response?.statusCode != null
              ? 'Received invalid status code: ${error.response?.statusCode}'
              // ignore: lines_longer_than_80_chars
              : 'Oops something went wrong :\n ${error.response?.statusMessage != null ? error.response!.statusMessage : 'Unknown error'}';
          break;
        case DioExceptionType.sendTimeout:
          errorDescription = 'Send timeout in connection with server';
          break;
        case DioExceptionType.badCertificate:
          errorDescription = 'Oops Bad Certificate';
          break;
        case DioExceptionType.unknown:
          errorDescription = 'Oops unknown error';
          break;
      }
    } else {
      errorDescription = '$error';
    }
    if (errorDescription.isEmpty) {
      errorDescription = 'Oops something went wrong';
    }
    return errorDescription;
  }
}
