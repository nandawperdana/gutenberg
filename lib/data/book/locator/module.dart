import 'package:get_it/get_it.dart';

import 'package:gutenberg/core/network/api/client/api_dio.dart';
import 'package:gutenberg/data/book/remote/service/book_service.dart';
import 'package:gutenberg/data/book/repository/book_repository.dart';

void registerModules(GetIt locator) {
  locator.registerLazySingleton(() => BookService(locator<ApiDio>()));
  locator.registerLazySingleton(
      () => BookRepository(bookService: locator<BookService>()));
}
