import 'package:gutenberg/data/book/remote/response/book.dart';
import 'package:gutenberg/data/book/repository/book_repository.dart';
import 'package:gutenberg/domain/base/response.dart';
import 'package:gutenberg/domain/base/util.dart';

class FetchBooksUseCase {
  late final BookRepository _bookRepository;

  FetchBooksUseCase({
    required BookRepository bookRepository,
  }) : _bookRepository = bookRepository;

  Future<Response<List<Book>>> execute({
    int page = 0,
    String keyword = '',
  }) async {
    try {
      final response = await _bookRepository.fetchBooks(
        page: page,
        keyword: keyword,
      );
      return Success(response.results, response.getNextPage());
    } catch (error) {
      return Error(error);
    }
  }
}
