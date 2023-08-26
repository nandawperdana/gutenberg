import 'dart:async';

import 'package:flutter/foundation.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gutenberg/app/entry/detail/detail_route.dart';
import 'package:gutenberg/core/route/transporter.dart';
import 'package:gutenberg/data/book/remote/response/book.dart';
import 'package:gutenberg/domain/base/load.dart';
import 'package:gutenberg/domain/base/response.dart' as api;
import 'package:gutenberg/domain/base/response.dart';
import 'package:gutenberg/domain/book/usecase/fetch_books_use_case.dart';

part 'book_list_event.dart';

part 'book_list_state.dart';

class BookListBloc extends Bloc<BookListEvent, BookListState> {
  late final FetchBooksUseCase _fetchBooksUseCase;
  late final Transporter _transporter;

  BookListBloc({
    required FetchBooksUseCase fetchBooksUseCase,
    required Transporter transporter,
  }) : super(const BookListState()) {
    _fetchBooksUseCase = fetchBooksUseCase;
    _transporter = transporter;

    on<FetchEvent>(_fetchEvent);
    on<NavigateToBookScreenEvent>(_navigateToBookScreenEvent);
  }

  Future<void> _fetchEvent(
    FetchEvent event,
    Emitter<BookListState> emit,
  ) async {
    try {
      if (state.books.isLoading) return;

      /// initial state
      emit(state.copyWith(books: state.books));

      /// fetch book data
      final response = await _fetchBooksUseCase.execute(
        page: event.page,
        keyword: event.keyword,
      );

      if (response.isSuccess) {
        final successResponse = response as api.Success<List<Book>>;

        final currentItem = state.books.isSuccess ? state.books.data : <Book>[];

        final books = currentItem + (response.data ?? []);
        final lastPage = successResponse.next == 0;

        emit(state.copyWith(
          books: Load.success(books),
          page: lastPage ? event.page : event.page + 1,
          isLastPage: lastPage,
        ));
      } else {
        emit(state.copyWith(books: Load.error(response.error)));
      }
    } catch (e) {
      emit(state.copyWith(books: Load.error(e)));
    }
  }

  Future<void> _navigateToBookScreenEvent(
    NavigateToBookScreenEvent event,
    Emitter<BookListState> _,
  ) async {
    try {
      unawaited(
        _transporter.rootNavigateTo(DetailRoute.bookDetail, event.id),
      );
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print('$error\n$stacktrace');
      }
    }
  }
}
