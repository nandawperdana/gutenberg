typedef LazyFactory<T> = T Function();

class Lazy<T> {
  final LazyFactory<T> _factory;

  const Lazy(this._factory);

  T get value => _factory();
}
