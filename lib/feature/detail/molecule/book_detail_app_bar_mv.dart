import 'package:flutter/material.dart';

import 'package:gutenberg/core/design/atomic/image/image_av.dart';
import 'package:gutenberg/core/design/measurement/dimension.dart';
import 'package:gutenberg/core/design/style/app_color.dart';
import 'package:gutenberg/core/ext/context.dart';
import 'package:gutenberg/data/book/remote/response/book.dart';

class BookDetailAppBarMV extends StatelessWidget {
  final bool isLoading;
  final Book? item;

  const BookDetailAppBarMV({
    Key? key,
    required this.isLoading,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (item is Book && !isLoading) {
      final data = item as Book;
      final flexibleHeight = context.mediaQuery.size.height / 2.5;
      return SliverAppBar(
        expandedHeight: flexibleHeight,
        backgroundColor: AppColor.systemWhite,
        foregroundColor: AppColor.systemBlack,
        elevation: 0,
        flexibleSpace: FlexibleSpaceBar(
          background: ImageAV(
            source: data.getImageUrl(),
            boxFit: BoxFit.fitHeight,
            dimension: Dimension(
              width: context.mediaQuery.size.width,
              height: 120,
            ),
          ),
        ),
        floating: false,
        pinned: true,
        snap: false,
        centerTitle: true,
        actions: const [],
      );
    }

    return SliverAppBar(
      backgroundColor: AppColor.systemWhite,
      foregroundColor: AppColor.systemBlack,
      pinned: true,
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
    );
  }
}
