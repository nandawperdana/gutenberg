import 'package:flutter/material.dart';

import 'package:mockito/annotations.dart';

import 'package:gutenberg/domain/book/usecase/fetch_books_use_case.dart';
import '../../core/mock/mock.dart';
import 'mock.mocks.dart';

@GenerateMocks([
  FetchBooksUseCase,
])
@visibleForTesting
void initMockUseCase() {
  locatorForTest.allowReassignment = true;

  locatorForTest.registerSingleton<FetchBooksUseCase>(MockFetchBooksUseCase());
}
