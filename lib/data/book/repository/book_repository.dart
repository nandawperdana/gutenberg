import 'package:gutenberg/data/base/remote/response/base_response.dart';
import 'package:gutenberg/data/book/remote/response/book_result.dart';
import 'package:gutenberg/data/book/remote/service/book_service.dart';

class BookRepository {
  late final BookService _bookService;

  BookRepository({required BookService bookService})
      : _bookService = bookService;

  Future<BaseResponse<BookResult>> fetchBooks({
    int page = 0,
    String keyword = '',
  }) {
    return _bookService.fetchBooks(page: page, keyword: keyword);
  }
}
