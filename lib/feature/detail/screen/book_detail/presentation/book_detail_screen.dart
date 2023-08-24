import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gutenberg/core/locator/locator.dart';
import 'package:gutenberg/domain/base/load.dart';
import 'package:gutenberg/domain/book/usecase/fetch_books_use_case.dart';
import 'package:gutenberg/feature/detail/molecule/book_detail_app_bar_mv.dart';
import 'package:gutenberg/feature/detail/molecule/book_detail_section_mv.dart';
import 'package:gutenberg/feature/detail/screen/book_detail/bloc/book_detail_bloc.dart';

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen({
    Key? key,
    required this.bookId,
  }) : super(key: key);

  final int bookId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookDetailBloc(
        fetchBooksUseCase: locator<FetchBooksUseCase>(),
      )..add(FetchDetailEvent(bookId)),
      child: const BookDetailView(),
    );
  }
}

class BookDetailView extends StatelessWidget {
  const BookDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<BookDetailBloc, BookDetailState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                BookDetailAppBarMV(
                  isLoading: state.book.isLoading,
                  item: state.book.dataOrNull,
                ),
                SliverToBoxAdapter(
                  child: state.book.isSuccess
                      ? BookDetailSectionMV(book: state.book.data)
                      : SizedBox(
                          height: MediaQuery.of(context).size.height -
                              kToolbarHeight,
                          child: const Center(
                            child: CupertinoActivityIndicator(),
                          ),
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
