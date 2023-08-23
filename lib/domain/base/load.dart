import 'package:equatable/equatable.dart';

/// A simple class that represent a loading state of a resource
///
/// Initial : The resource is not yet loaded
/// Loading : The resource is loading
/// Success : The resource is successfully loaded
/// Error   : There is an error when loading a resource
class Load<T> {
  const Load._();

  const factory Load.initial() = Initial<T>;

  const factory Load.loading() = Loading<T>;

  const factory Load.success(T value) = Success<T>;

  const factory Load.error(dynamic error) = Error<T>;
}

class Initial<T> extends Load<T> {
  const Initial() : super._();
}

class Loading<T> extends Load<T> {
  const Loading() : super._();
}

class Error<T> extends Load<T> with EquatableMixin {
  const Error(this.error) : super._();

  final dynamic error;

  @override
  List<Object?> get props => [error];
}

class Success<T> extends Load<T> with EquatableMixin {
  const Success(this.data) : super._();

  final T data;

  @override
  List<Object?> get props => [data];
}

extension LoadExt<T> on Load<T> {
  bool get isLoading => this is Loading;

  bool get isSuccess => this is Success;

  bool get isError => this is Error;

  bool get isInitial => this is Initial;

  bool get isInitialOrLoading => this is Initial || this is Loading;

  T get data => (this as Success).data;

  T? get dataOrNull => this is Success ? data : null;

  Exception get error => (this as Error).error;
}
