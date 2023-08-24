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
    int page = 1,
    String? keyword,
    List<String>? ids,
  }) async {
    try {
      final response = await _bookRepository.fetchBooks(
        page: page,
        keyword: ids == null ? keyword : null,
        ids: ids?.join(','),
      );
      return Success(
        response.results,
        count: response.count,
        next: response.getNextPage(),
      );
    } catch (error) {
      return Error(error);
    }
  }
}
