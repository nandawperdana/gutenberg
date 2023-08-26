import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:gutenberg/data/book/remote/service/book_service.dart';
import '../../../mock/mock.dart';
import '../../../mock/mock.mocks.dart';
import '../../mock/book_mock.dart';

void main() {
  setUpAll(() {
    initMockService();
  });

  group('BookService', () {
    late BookService bookService;

    setUp(() {
      bookService = MockBookService();
    });

    test('fetchBooks returns expected result', () async {
      when(bookService.fetchBooks())
          .thenAnswer((_) => Future.value(mockBookBaseResponse));

      final result = await bookService.fetchBooks();

      expect(result, equals(mockBookBaseResponse));
    });
  });
}
