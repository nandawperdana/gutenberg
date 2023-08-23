import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:gutenberg/core/design/measurement/app_dimen.dart';
import 'package:gutenberg/data/book/remote/response/book.dart';
import 'package:gutenberg/domain/base/load.dart';
import 'package:gutenberg/feature/home/molecule/book_card_mv.dart';
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
          nextPageKey: state.page,
          itemList: state.books.data,
          error: state.books.error,
        );
      },
      builder: (context, state) {
        if (state.books.isSuccess) {
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
                );
              },
            ),
            shrinkWrap: true,
            addAutomaticKeepAlives: false,
            addRepaintBoundaries: false,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: AppDimen.paddingMedium);
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
