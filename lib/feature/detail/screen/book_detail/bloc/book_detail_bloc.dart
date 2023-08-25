import 'dart:async';

import 'package:flutter/foundation.dart';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:gutenberg/app/entry/detail/detail_route.dart';
import 'package:gutenberg/core/ext/string.dart';
import 'package:gutenberg/core/route/transporter.dart';
import 'package:gutenberg/data/book/remote/response/book.dart';
import 'package:gutenberg/domain/base/exception.dart';
import 'package:gutenberg/domain/base/load.dart';
import 'package:gutenberg/domain/base/response.dart';
import 'package:gutenberg/domain/book/usecase/fetch_books_use_case.dart';
import 'package:gutenberg/feature/detail/util/constant.dart';

part 'book_detail_event.dart';

part 'book_detail_state.dart';

class BookDetailBloc extends Bloc<BookDetailEvent, BookDetailState> {
  late final FetchBooksUseCase _fetchBooksUseCase;
  late final Transporter _transporter;

  BookDetailBloc({
    required FetchBooksUseCase fetchBooksUseCase,
    required Transporter transporter,
  }) : super(const BookDetailState()) {
    _fetchBooksUseCase = fetchBooksUseCase;
    _transporter = transporter;

    on<FetchDetailEvent>(_fetchDetail);
    on<FetchMoreBooksEvent>(
      _fetchMoreBooksEvent,
      transformer: sequential(),
    );
    on<NavigateToBookScreenEvent>(_navigateToBookScreenEvent);
    on<NavigateToBookListScreenEvent>(_navigateToBookListScreenEvent);
    on<OnTapPreviewEvent>(_onTapPreviewEvent);
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
        final book = response.data.first;
        emit(state.copyWith(book: Load.success(book)));

        /// Fetch more books by authors
        final authors = book.authors?.map((e) => e.name).join(' ');
        add(FetchMoreBooksEvent(
          keyword: authors.orEmpty,
          type: KeywordType.author,
        ));

        /// Fetch more books by topic
        final bookshelves = book.bookshelves ?? [];
        if (bookshelves.isNotEmpty) {
          add(FetchMoreBooksEvent(
            keyword: bookshelves.first,
            type: KeywordType.topic,
          ));
        }
      } else {
        emit(state.copyWith(book: Load.error(response.error)));
      }
    } catch (e) {
      emit(state.copyWith(book: Load.error(e)));
    }
  }

  Future<void> _fetchMoreBooksEvent(
    FetchMoreBooksEvent event,
    Emitter<BookDetailState> emit,
  ) async {
    if (event.keyword.isEmpty) return;

    try {
      switch (event.type) {
        case KeywordType.author:
          emit(state.copyWith(moreBooksAuthor: const Load.loading()));

          /// fetch more book data
          final response = await _fetchBooksUseCase.execute(
            keyword: event.keyword,
          );

          if (response.isSuccess) {
            if (state.book.dataOrNull != null) {
              // remove main book
              response.data.removeWhere((e) {
                return e.id == state.book.data.id;
              });
            }

            emit(state.copyWith(moreBooksAuthor: Load.success(response.data)));
          } else {
            emit(state.copyWith(moreBooksAuthor: Load.error(response.error)));
          }
          break;
        case KeywordType.topic:
          emit(state.copyWith(moreBooksTopic: const Load.loading()));

          /// fetch more book data
          final response = await _fetchBooksUseCase.execute(
            topic: event.keyword,
          );

          if (response.isSuccess) {
            if (state.book.dataOrNull != null) {
              // remove main book
              response.data.removeWhere((e) {
                return e.id == state.book.data.id;
              });
            }

            emit(state.copyWith(moreBooksTopic: Load.success(response.data)));
          } else {
            emit(state.copyWith(moreBooksTopic: Load.error(response.error)));
          }
          break;
      }
    } catch (e) {
      emit(state.copyWith(
        moreBooksAuthor: Load.error(e),
        moreBooksTopic: Load.error(e),
      ));
    }
  }

  Future<void> _navigateToBookScreenEvent(
    NavigateToBookScreenEvent event,
    Emitter<BookDetailState> _,
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

  Future<void> _navigateToBookListScreenEvent(
    NavigateToBookListScreenEvent event,
    Emitter<BookDetailState> _,
  ) async {
    try {
      unawaited(
        _transporter.rootNavigateTo(DetailRoute.bookList, event.keyword),
      );
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print('$error\n$stacktrace');
      }
    }
  }

  Future<void> _onTapPreviewEvent(
    OnTapPreviewEvent event,
    Emitter<BookDetailState> _,
  ) async {
    try {
      if (!await launchUrl(Uri.parse(event.url),
          mode: LaunchMode.externalApplication)) {
        throw UnknownException('Could not launch ${event.url}');
      }
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print('$error\n$stacktrace');
      }
    }
  }
}
