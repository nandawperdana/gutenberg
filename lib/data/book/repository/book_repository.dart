import 'package:gutenberg/data/base/remote/response/base_response.dart';
import 'package:gutenberg/data/book/remote/response/book.dart';
import 'package:gutenberg/data/book/remote/service/book_service.dart';

class BookRepository {
  late final BookService _bookService;

  BookRepository({required BookService bookService})
      : _bookService = bookService;

  Future<BaseResponse<Book>> fetchBooks({
    int page = 1,
    String? keyword,
    String? ids,
  }) {
    return _bookService.fetchBooks(
      page: page,
      keyword: keyword,
      ids: ids,
    );
  }
}
