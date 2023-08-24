import 'package:get_it/get_it.dart';

import 'package:gutenberg/data/book/repository/book_repository.dart';
import 'package:gutenberg/domain/book/usecase/fetch_books_use_case.dart';

void registerModules(GetIt locator) {
  locator.registerLazySingleton(
      () => FetchBooksUseCase(bookRepository: locator<BookRepository>()));
}
