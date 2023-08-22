import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'package:gutenberg/core/network/api/client/api_dio.dart';
import 'package:gutenberg/data/base/remote/response/base_response.dart';
import 'package:gutenberg/data/book/remote/response/book_result.dart';

part 'book_service.g.dart';

@RestApi()
abstract class BookService {
  factory BookService(ApiDio dio, {String baseUrl}) = _BookService;

  /// Fetch books
  @GET('/books')
  Future<BaseResponse<BookResult>> fetchBooks({
    @Query('page') int? page,
    @Query('search') String? keyword,
  });
}
