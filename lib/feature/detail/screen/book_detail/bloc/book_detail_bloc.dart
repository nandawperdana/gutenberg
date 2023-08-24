import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gutenberg/data/book/remote/response/book.dart';
import 'package:gutenberg/domain/base/load.dart';
import 'package:gutenberg/domain/base/response.dart';
import 'package:gutenberg/domain/book/usecase/fetch_books_use_case.dart';

part 'book_detail_event.dart';

part 'book_detail_state.dart';

class BookDetailBloc extends Bloc<BookDetailEvent, BookDetailState> {
  late final FetchBooksUseCase _fetchBooksUseCase;

  BookDetailBloc({
    required FetchBooksUseCase fetchBooksUseCase,
  }) : super(const BookDetailState()) {
    _fetchBooksUseCase = fetchBooksUseCase;

    on<FetchDetailEvent>(_fetchDetail);
  }

  Future<void> _fetchDetail(
    FetchDetailEvent event,
    Emitter<BookDetailState> emit,
  ) async {
    try {
      if (state.book.isLoading) return;

      /// initial state
      emit(state.copyWith(book: const Load.loading()));

      /// fetch book data
      final response = await _fetchBooksUseCase.execute(
        ids: [event.bookId.toString()],
      );

      if (response.isSuccess) {
        emit(state.copyWith(book: Load.success(response.data.first)));
      } else {
        emit(state.copyWith(book: Load.error(response.error)));
      }
    } catch (error) {
      emit(state.copyWith(book: Load.error(error)));
    }
  }
}
