import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:gutenberg/core/design/molecule/book/book_card_mv.dart';
import 'package:gutenberg/core/route/transporter.dart';
import 'package:gutenberg/domain/book/usecase/fetch_books_use_case.dart';
import 'package:gutenberg/feature/home/screen/bloc/home_bloc.dart';
import 'package:gutenberg/feature/home/screen/presentation/widget/home_book_content.dart';
import '../../../../../core/mock/mock.dart';
import '../../../../../core/mock/mock.mocks.dart';
import '../../../../../data/book/mock/book_mock.dart';
import '../../../../../domain/mock/mock.dart';
import '../../../../../domain/mock/mock.mocks.dart';
import '../../../../../suite/component.dart';

void main() {
  late MockFetchBooksUseCase mockFetchBooksUseCase;
  late MockTransporter mockTransporter;

  setUp(() {
    initMockTransporter();
    initMockUseCase();

    mockFetchBooksUseCase =
        locatorForTest<FetchBooksUseCase>() as MockFetchBooksUseCase;
    mockTransporter = locatorForTest<Transporter>() as MockTransporter;
  });

  testBlocComponent<HomeBloc>(
    'Validate HomeBookContent to show success response',
    onCreateTest: (context) => HomeBloc(
      fetchBooksUseCase: mockFetchBooksUseCase,
      transporter: mockTransporter,
    )..add(const FetchEvent()),
    component: const HomeBookContent(),
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

      expect(find.byType(BookCardMV), findsWidgets);
    },
  );
}
