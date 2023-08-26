import 'dart:async';

import 'package:flutter/foundation.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gutenberg/app/entry/detail/detail_route.dart';
import 'package:gutenberg/core/ext/string.dart';
import 'package:gutenberg/core/route/transporter.dart';
import 'package:gutenberg/data/book/remote/response/book.dart';
import 'package:gutenberg/domain/base/load.dart';
import 'package:gutenberg/domain/base/response.dart' as api;
import 'package:gutenberg/domain/book/usecase/fetch_books_use_case.dart';

part 'home_state.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  late final FetchBooksUseCase _fetchBooksUseCase;
  late final Transporter _transporter;

  HomeBloc({
    required FetchBooksUseCase fetchBooksUseCase,
    required Transporter transporter,
  }) : super(const HomeState()) {
    _fetchBooksUseCase = fetchBooksUseCase;
    _transporter = transporter;

    on<FetchEvent>(_fetchBooks);
    on<SearchEvent>(_search);
    on<NavigateToBookScreenEvent>(_navigateToBookScreenEvent);
  }

  Future<void> _fetchBooks(FetchEvent event, Emitter<HomeState> emit) async {
    if (state.books.isLoading) return;

    try {
      final isRefreshEvent = event == const FetchEvent();

      /// initial state
      emit(state.copyWith(
        books: isRefreshEvent ? const Load.loading() : state.books,
      ));

      /// fetch book data
      final response = await _fetchBooksUseCase.execute(
        page: event.page,
        keyword: state.keyword,
      );

      /// set data
      if (response.isSuccess) {
        final successResponse = response as api.Success<List<Book>>;
        final currentItem = state.books.isSuccess ? state.books.data : <Book>[];
        final books =
            (isRefreshEvent ? <Book>[] : currentItem) + (response.data ?? []);
        final lastPage = successResponse.next == 0;

        emit(state.copyWith(
          books: Load.success(books),
          page: lastPage ? event.page : event.page + 1,
          isLastPage: lastPage,
        ));
      } else {
        emit(state.copyWith(books: Load.error(response.error)));
      }
    } catch (error) {
      emit(state.copyWith(books: Load.error(error)));
    }
  }

  Future<void> _search(
    SearchEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      if (event.keyword.toLowerCase() != state.keyword?.orEmpty.toLowerCase()) {
        emit(state.copyWith(keyword: event.keyword));

        add(const FetchEvent());
      }
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print('$error\n$stacktrace');
      }
    }
  }

  Future<void> _navigateToBookScreenEvent(
    NavigateToBookScreenEvent event,
    Emitter<HomeState> _,
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
