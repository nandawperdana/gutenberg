import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:gutenberg/app/entry/detail/detail_route.dart';
import 'package:gutenberg/core/route/transporter.dart';
import 'package:gutenberg/domain/base/load.dart';
import 'package:gutenberg/domain/book/usecase/fetch_books_use_case.dart';
import 'package:gutenberg/feature/home/screen/bloc/home_bloc.dart';
import '../../../../core/mock/mock.dart';
import '../../../../core/mock/mock.mocks.dart';
import '../../../../data/book/mock/book_mock.dart';
import '../../../../domain/mock/mock.dart';
import '../../../../domain/mock/mock.mocks.dart';

void main() {
  group('HomeBloc', () {
    late MockFetchBooksUseCase mockFetchBooksUseCase;
    late MockTransporter mockTransporter;
    late HomeBloc homeBloc;

    setUpAll(() {
      initMockTransporter();
      initMockUseCase();
      mockFetchBooksUseCase =
          locatorForTest<FetchBooksUseCase>() as MockFetchBooksUseCase;
      mockTransporter = locatorForTest<Transporter>() as MockTransporter;
    });

    setUp(() {
      homeBloc = HomeBloc(
          fetchBooksUseCase: mockFetchBooksUseCase,
          transporter: mockTransporter);
    });

    blocTest<HomeBloc, HomeState>(
      'emits correct state when FetchEvent is added',
      build: () => homeBloc,
      act: (bloc) => bloc.add(const FetchEvent(page: 1)),
      setUp: () {
        when(mockFetchBooksUseCase.execute(
                page: anyNamed('page'), keyword: anyNamed('keyword')))
            .thenAnswer((_) => Future.value(mockBooksSuccessResponse));
      },
      expect: () => [
        const HomeState(books: Load.loading()),
        HomeState(
          books: Load.success(mockBooksSuccessResponse.data ?? []),
          page: 1,
          isLastPage: true,
        ),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'emits correct state when SearchEvent is added',
      build: () => homeBloc,
      act: (bloc) => bloc.add(const SearchEvent(keyword: 'Test Keyword')),
      expect: () => [
        const HomeState(keyword: 'Test Keyword'),
        const HomeState(keyword: 'Test Keyword', books: Load.loading()),
        HomeState(
          books: Load.success(mockBooksSuccessResponse.data ?? []),
          keyword: 'Test Keyword',
          page: 1,
          isLastPage: true,
        ),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'triggers navigation when NavigateToBookScreenEvent is added',
      build: () => homeBloc,
      act: (bloc) => bloc.add(const NavigateToBookScreenEvent(id: 1)),
      setUp: () {
        when(mockTransporter.rootNavigateTo(DetailRoute.bookDetail, 1))
            .thenAnswer((_) => Future.value());
      },
      verify: (_) {
        verify(mockTransporter.rootNavigateTo(DetailRoute.bookDetail, 1))
            .called(1);
      },
    );
  });
}
