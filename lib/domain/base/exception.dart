class NoInternetException implements Exception {}

class RetryException implements Exception {}

class ApiException implements Exception {
  late Object _error;

  Object get error => _error;

  ApiException(Object error) {
    _error = error;
  }

  @override
  String toString() {
    return _error.toString();
  }
}

class UnknownException implements Exception {
  late Object _error;

  Object get error => _error;

  UnknownException(Object error) {
    _error = error;
  }

  @override
  String toString() {
    return _error.toString();
  }
}
