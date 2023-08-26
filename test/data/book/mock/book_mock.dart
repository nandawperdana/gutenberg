import 'package:gutenberg/data/base/remote/response/base_response.dart';
import 'package:gutenberg/data/book/remote/response/book.dart';
import 'package:gutenberg/domain/base/response.dart';

final mockBook = Book(id: 1, title: 'Mock Title');

final mockBooks = <Book>[
  mockBook,
];

final mockBookSuccessResponse = Success<Book>(mockBook, count: 1);

final mockBooksSuccessResponse = Success<List<Book>>(
  mockBooks,
  count: 1,
  next: 0,
);

final mockBookBaseResponse = BaseResponse(count: 1, results: mockBooks);
