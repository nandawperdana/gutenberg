import 'package:gutenberg/domain/base/exception.dart';

abstract class Response<T> {}

class Empty<T> extends Response<T> {}

class Loading<T> extends Response<T> {}

class Error<T> extends Response<T> {
  late Exception _error;

  Exception get error => _error;

  Error(Object error) {
    if (error is Exception) {
      this._error = error;
    } else {
      this._error = UnknownException(error);
    }
  }
}

class Success<T> extends Response<T> {
  final T? data;
  final int? count;
  final int? next;

  // another meta data
  final Map<String, dynamic> meta = {};

  Success(
    this.data, {
    this.count,
    this.next,
    Map<String, dynamic>? meta,
  }) {
    if (meta != null) this.meta.addAll(meta);
  }
}

extension ResponseExt<T> on Response<T> {
  bool get isSuccess => this is Success<T>;

  bool get isError => this is Error<T>;

  T get data => (this as Success).data;

  T? get dataOrNull => this is Success<T> ? data : null;

  Exception get error => (this as Error).error;
}
