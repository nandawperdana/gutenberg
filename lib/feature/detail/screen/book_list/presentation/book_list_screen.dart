import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gutenberg/core/design/atomic/text/text_av.dart';
import 'package:gutenberg/core/design/style/app_color.dart';
import 'package:gutenberg/core/design/style/app_text_style.dart';
import 'package:gutenberg/core/ext/context.dart';
import 'package:gutenberg/core/locator/locator.dart';
import 'package:gutenberg/core/route/transporter.dart';
import 'package:gutenberg/domain/book/usecase/fetch_books_use_case.dart';
import 'package:gutenberg/feature/detail/screen/book_list/bloc/book_list_bloc.dart';
import 'package:gutenberg/feature/detail/screen/book_list/presentation/book_list_content.dart';

class BookListScreen extends StatelessWidget {
  const BookListScreen({
    Key? key,
    required this.keyword,
  }) : super(key: key);

  final String keyword;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookListBloc(
        fetchBooksUseCase: locator<FetchBooksUseCase>(),
        transporter: locator<Transporter>(),
      )..add(FetchEvent(keyword: keyword)),
      child: BookListView(keyword: keyword),
    );
  }
}

class BookListView extends StatelessWidget {
  const BookListView({
    Key? key,
    required this.keyword,
  }) : super(key: key);

  final String keyword;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.systemWhite,
          foregroundColor: AppColor.systemBlack,
          elevation: 0,
          title: TextAV(text: keyword, style: AppText.subheading18),
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.none,
            background: Column(
              children: [
                SizedBox(
                  height: context.mediaQuery.padding.top,
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: BlocBuilder<BookListBloc, BookListState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: BookListContent(keyword: keyword),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
