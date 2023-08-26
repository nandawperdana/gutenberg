import 'package:flutter/material.dart';

import 'package:feather_icons/feather_icons.dart';

import 'package:gutenberg/core/design/atomic/button/button_base_av.dart';
import 'package:gutenberg/core/design/atomic/text/text_av.dart';
import 'package:gutenberg/core/design/measurement/app_dimen.dart';
import 'package:gutenberg/core/design/molecule/book/book_small_card_mv.dart';
import 'package:gutenberg/core/design/style/app_color.dart';
import 'package:gutenberg/core/design/style/app_text_style.dart';
import 'package:gutenberg/data/book/remote/response/book.dart';
import 'package:gutenberg/feature/detail/util/constant.dart';

class BookListByKeywordMV extends StatelessWidget {
  const BookListByKeywordMV({
    Key? key,
    this.height = 120,
    required this.type,
    required this.keyword,
    required this.books,
    this.shouldShowSeeAll = true,
    this.onTap,
    this.onTapSeeAll,
  }) : super(key: key);

  final double height;
  final KeywordType type;
  final String keyword;
  final List<Book> books;
  final bool shouldShowSeeAll;
  final Function(int id)? onTap;
  final OnTap? onTapSeeAll;

  @override
  Widget build(BuildContext context) {
    if (books.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: TextAV(
                text: type == KeywordType.topic
                    ? 'Other books in this topic'
                    : 'More books by $keyword',
                style: AppText.body14Bold,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (shouldShowSeeAll) ...[
              const SizedBox(width: AppDimen.paddingMedium),
              InkWell(
                onTap: onTapSeeAll,
                child: const Row(
                  children: [
                    TextAV(
                      text: 'See All',
                      style: AppText.body14Bold,
                      align: TextAlign.center,
                    ),
                    Icon(
                      FeatherIcons.chevronRight,
                      color: AppColor.primary,
                      size: AppDimen.sizeIconMedium,
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: AppDimen.paddingMedium),
        SizedBox(
          height: height,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: books.length,
            itemBuilder: (context, index) {
              final item = books[index];
              return BookSmallCardMV(
                id: item.id,
                title: item.title,
                imageUrl: item.getImageUrl(),
                languages: item.languages ?? [],
                authors: item.authors?.map((e) => e.name).toList() ?? [],
                onTap: () {
                  if (onTap != null) onTap!(item.id);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
