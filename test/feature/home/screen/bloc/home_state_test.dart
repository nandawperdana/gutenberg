import 'package:flutter_test/flutter_test.dart';

import 'package:gutenberg/data/book/remote/response/book.dart';
import 'package:gutenberg/domain/base/load.dart';
import 'package:gutenberg/feature/home/screen/bloc/home_bloc.dart';

void main() {
  group('HomeState', () {
    test('creates correct props', () {
      const load = Load<List<Book>>.initial();
      const state = HomeState(
        books: load,
        isSearchActive: true,
        keyword: 'Test Keyword',
        isLastPage: true,
        page: 2,
      );

      expect(state.props, [load, true, 'Test Keyword', true, 2]);
    });

    test('copyWith method works', () {
      const initialState = HomeState();
      final updatedState = initialState.copyWith(
        books: const Load.loading(),
        keyword: 'Updated Keyword',
        isSearchActive: false,
        isLastPage: true,
        page: 3,
      );

      expect(updatedState.books.isLoading, true);
      expect(updatedState.keyword, 'Updated Keyword');
      expect(updatedState.isSearchActive, false);
      expect(updatedState.isLastPage, true);
      expect(updatedState.page, 3);
    });
  });
}
