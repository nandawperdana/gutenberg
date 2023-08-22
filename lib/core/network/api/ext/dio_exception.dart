import 'package:dio/dio.dart';

extension DioExceptionExt on DioException {
  bool get isNeedToRetry {
    switch (type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return true;
      case DioExceptionType.badResponse:
        return false;
      default:
        return false;
    }
  }
}
