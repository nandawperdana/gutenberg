import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:gutenberg/core/design/atomic/text/text_av.dart';
import 'package:gutenberg/core/design/measurement/app_dimen.dart';
import 'package:gutenberg/core/design/molecule/book/book_card_mv.dart';
import 'package:gutenberg/core/design/molecule/shimmer/shimmer_mv.dart';
import 'package:gutenberg/core/design/style/app_text_style.dart';
import 'package:gutenberg/data/book/remote/response/book.dart';
import 'package:gutenberg/domain/base/load.dart';
import 'package:gutenberg/feature/home/ext/context.dart';
import 'package:gutenberg/feature/home/screen/bloc/home_bloc.dart';

class HomeBookContent extends StatefulWidget {
  const HomeBookContent({super.key});

  @override
  State<StatefulWidget> createState() => HomeBookContentState();
}

class HomeBookContentState extends State<HomeBookContent> {
  final PagingController<int, Book> pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    pagingController.addPageRequestListener((pageKey) {
      if (pageKey == 1) return;
      context.read<HomeBloc>().add(FetchEvent(page: pageKey));
    });
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
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
                      .read<HomeBloc>()
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
            noItemsFoundIndicatorBuilder: (context) {
              return Padding(
                padding: const EdgeInsets.all(AppDimen.paddingMedium),
                child: TextAV(
                  text: context.locale.keywordNotFound,
                  align: TextAlign.center,
                  style: AppText.body14,
                ),
              );
            },
            firstPageErrorIndicatorBuilder: (context) {
              return TextAV(
                text: state.books.error.toString(),
                align: TextAlign.center,
                style: AppText.body14,
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
