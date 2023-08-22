import 'package:gutenberg/data/book/remote/response/book_result.dart';
import 'package:gutenberg/data/book/repository/book_repository.dart';
import 'package:gutenberg/domain/base/response.dart';
import 'package:gutenberg/domain/base/util.dart';

class FetchBooksUseCase {
  late final BookRepository _bookRepository;

  FetchBooksUseCase({
    required BookRepository bookRepository,
  }) : _bookRepository = bookRepository;

  Future<Response<List<BookResult>>> execute({
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
