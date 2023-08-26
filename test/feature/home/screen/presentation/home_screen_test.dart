import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:gutenberg/core/route/transporter.dart';
import 'package:gutenberg/domain/book/usecase/fetch_books_use_case.dart';
import 'package:gutenberg/feature/home/locale/delegate.dart';
import 'package:gutenberg/feature/home/screen/bloc/home_bloc.dart';
import 'package:gutenberg/feature/home/screen/presentation/home_screen.dart';
import 'package:gutenberg/feature/home/screen/presentation/widget/home_book_content.dart';
import 'package:gutenberg/feature/home/screen/presentation/widget/home_search_bar.dart';
import '../../../../core/mock/mock.dart';
import '../../../../core/mock/mock.mocks.dart';
import '../../../../data/book/mock/book_mock.dart';
import '../../../../domain/mock/mock.dart';
import '../../../../domain/mock/mock.mocks.dart';
import '../../../../suite/component.dart';

void main() {
  late MockFetchBooksUseCase mockFetchBooksUseCase;
  late MockTransporter mockTransporter;

  setUpAll(() {
    initMockTransporter();
    initMockUseCase();

    mockFetchBooksUseCase =
        locatorForTest<FetchBooksUseCase>() as MockFetchBooksUseCase;
    mockTransporter = locatorForTest<Transporter>() as MockTransporter;
  });

  testBlocComponent<HomeBloc>(
    'Validate HomeScree to show all widgets',
    localeDelegate: [
      const HomeLocaleDelegate(),
    ],
    onCreateTest: (context) => HomeBloc(
      fetchBooksUseCase: mockFetchBooksUseCase,
      transporter: mockTransporter,
    ),
    component: const HomeScreen(),
    onSetupTest: () async {
      when(mockFetchBooksUseCase.execute(
              page: anyNamed('page'), keyword: anyNamed('keyword')))
          .thenAnswer((_) => Future.value(mockBooksSuccessResponse));
    },
    onRunTest: (tester) async {
      await tester.pumpAndSettle();
      for (var i = 0; i < 5; i++) {
        await tester.pump(const Duration(seconds: 1));
      }

      expect(find.byType(HomeBookContent), findsWidgets);
      expect(find.byType(HomeSearchBar), findsOneWidget);
    },
  );
}
