import 'package:flutter/material.dart';

import 'package:mockito/annotations.dart';

import 'package:gutenberg/data/book/remote/service/book_service.dart';
import 'package:gutenberg/data/book/repository/book_repository.dart';
import '../../core/mock/mock.dart';
import 'mock.mocks.dart';

@GenerateMocks([
  BookRepository,
])
@visibleForTesting
void initMockRepository() {
  locatorForTest.allowReassignment = true;

  locatorForTest.registerSingleton<BookRepository>(MockBookRepository());
}

@GenerateMocks([
  BookService,
])
@visibleForTesting
void initMockService() {
  locatorForTest.allowReassignment = true;

  locatorForTest.registerSingleton<BookService>(MockBookService());
}
