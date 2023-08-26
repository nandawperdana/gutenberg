import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:gutenberg/data/book/repository/book_repository.dart';
import '../../mock/mock.dart';
import '../../mock/mock.mocks.dart';
import '../mock/book_mock.dart';

void main() {
  setUpAll(() {
    initMockRepository();
  });

  group('BookService', () {
    late BookRepository bookRepository;

    setUp(() {
      bookRepository = MockBookRepository();
    });

    test('fetchBooks returns expected result', () async {
      when(bookRepository.fetchBooks())
          .thenAnswer((_) => Future.value(mockBookBaseResponse));

      final result = await bookRepository.fetchBooks();

      expect(result, equals(mockBookBaseResponse));
    });
  });
}
