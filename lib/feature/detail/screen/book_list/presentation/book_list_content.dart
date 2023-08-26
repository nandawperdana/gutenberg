import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:gutenberg/core/design/measurement/app_dimen.dart';
import 'package:gutenberg/core/design/molecule/book/book_card_mv.dart';
import 'package:gutenberg/core/design/molecule/shimmer/shimmer_mv.dart';
import 'package:gutenberg/data/book/remote/response/book.dart';
import 'package:gutenberg/domain/base/load.dart';
import 'package:gutenberg/feature/detail/screen/book_list/bloc/book_list_bloc.dart';

class BookListContent extends StatefulWidget {
  const BookListContent({Key? key, required this.keyword}) : super(key: key);

  final String keyword;

  @override
  State<StatefulWidget> createState() => BookListContentState();
}

class BookListContentState extends State<BookListContent> {
  final PagingController<int, Book> pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    pagingController.addPageRequestListener((pageKey) {
      if (pageKey == 1) return;
      context
          .read<BookListBloc>()
          .add(FetchEvent(keyword: widget.keyword, page: pageKey));
    });
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookListBloc, BookListState>(
      listener: (context, state) {
        if (state.books.isError) {
          pagingController.error = state.books.error;
        }

        pagingController.value = PagingState(
          nextPageKey: state.isLastPage ? null : state.page,
          itemList: state.books.isSuccess ? state.books.data : null,
          error: state.books.isError ? state.books.error : null,
        );
      },
      builder: (context, state) {
        return PagedListView.separated(
          pagingController: pagingController,
          padding: const EdgeInsets.symmetric(
            vertical: AppDimen.paddingSmall,
            horizontal: AppDimen.paddingMedium,
          ),
          builderDelegate: PagedChildBuilderDelegate<Book>(
            itemBuilder: (context, item, index) {
              return BookCardMV(
                id: item.id,
                title: item.title,
                imageUrl: item.getImageUrl(),
                languages: item.languages ?? [],
                authors: item.authors?.map((e) => e.name).toList() ?? [],
                downloadCount: item.downloadCount,
                onTap: () {
                  context
                      .read<BookListBloc>()
                      .add(NavigateToBookScreenEvent(id: item.id));
                },
              );
            },
            firstPageProgressIndicatorBuilder: (context) {
              return ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.only(
                      bottom: AppDimen.paddingMedium,
                    ),
                    child: ShimmerMV(height: 120.0),
                  );
                },
              );
            },
            newPageProgressIndicatorBuilder: (context) {
              return const Padding(
                padding: EdgeInsets.all(AppDimen.paddingMedium),
                child: CupertinoActivityIndicator(),
              );
            },
          ),
          shrinkWrap: true,
          addAutomaticKeepAlives: false,
          addRepaintBoundaries: false,
          physics: const BouncingScrollPhysics(),
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: AppDimen.paddingMedium);
          },
        );
      },
    );
  }
}
