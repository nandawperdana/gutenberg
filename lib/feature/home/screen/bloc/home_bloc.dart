import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gutenberg/data/book/remote/response/book.dart';
import 'package:gutenberg/domain/base/load.dart';
import 'package:gutenberg/domain/base/response.dart';
import 'package:gutenberg/domain/book/usecase/fetch_books_use_case.dart';

part 'home_state.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  late final FetchBooksUseCase _fetchBooksUseCase;

  HomeBloc({required FetchBooksUseCase fetchBooksUseCase})
      : super(const HomeState()) {
    _fetchBooksUseCase = fetchBooksUseCase;

    on<FetchEvent>(_fetchBooks);
  }

  Future<void> _fetchBooks(FetchEvent event, Emitter<HomeState> emit) async {
    if (state.books.isLoading) return;

    try {
      /// initial state
      emit(
        state.copyWith(
          error: null,
          books: const Load.loading(),
        ),
      );

      /// fetch book data
      final response = await _fetchBooksUseCase.execute(
        page: event.page,
        keyword: state.keyword ?? '',
      );

      /// set data
      if (response.isSuccess) {
        emit(state.copyWith(books: Load.success(response.data)));
      } else {
        emit(state.copyWith(books: Load.error(response.error)));
      }
    } catch (error) {
      emit(state.copyWith(books: Load.error(error)));
    }
  }
}
