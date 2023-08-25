import 'package:flutter/material.dart';

import 'package:feather_icons/feather_icons.dart';

import 'package:gutenberg/core/design/atomic/button/button_default_av.dart';
import 'package:gutenberg/core/design/atomic/text/text_av.dart';
import 'package:gutenberg/core/design/measurement/app_dimen.dart';
import 'package:gutenberg/core/design/style/app_button_style.dart';
import 'package:gutenberg/core/design/style/app_color.dart';
import 'package:gutenberg/core/design/style/app_text_style.dart';
import 'package:gutenberg/core/ext/string.dart';
import 'package:gutenberg/data/book/remote/response/book.dart';
import 'package:gutenberg/feature/detail/screen/book_detail/presentation/section/book_author_info_mv.dart';
import 'package:gutenberg/feature/detail/screen/book_detail/presentation/section/book_info_mv.dart';
import 'package:gutenberg/feature/detail/screen/book_detail/presentation/section/book_list_by_keyword_mv.dart';
import 'package:gutenberg/feature/detail/util/constant.dart';

class BookDetailSectionMV extends StatelessWidget {
  const BookDetailSectionMV({
    Key? key,
    required this.book,
    required this.moreBooksAuthor,
    required this.moreBooksTopic,
    this.onTapButton,
    this.onTapMoreBook,
    this.onTapAuthor,
    this.onTapSeeAll,
  }) : super(key: key);

  final Book book;
  final List<Book> moreBooksAuthor;
  final List<Book> moreBooksTopic;
  final void Function(String url)? onTapButton;
  final void Function(int id)? onTapMoreBook;
  final void Function(String name)? onTapAuthor;
  final void Function(String name)? onTapSeeAll;

  List<BookInfoItem> _generateInfoItem() {
    return [
      ...(book.languages ?? [])
          .map((e) =>
              BookInfoItem(type: BookInfoType.lang, info: e.toUpperCase()))
          .toList(),
      if (book.downloadCount != null)
        BookInfoItem(
            type: BookInfoType.download,
            info: (book.downloadCount ?? 0).toString()),
      if (book.mediaType != null)
        BookInfoItem(
          type: BookInfoType.format,
          info: book.mediaType.orEmpty,
        ),
      if (book.copyright != null)
        BookInfoItem(
          type: BookInfoType.copyright,
          info: book.copyright == true ? 'YES' : 'NO',
        ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final authors = book.authors ?? [];
    final bookshelves = book.bookshelves ?? [];
    final authorJoinName = authors.map((e) => e.name).join(' and ');

    return Padding(
      padding: const EdgeInsets.all(AppDimen.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextAV(
            text: book.title,
            style: AppText.heading24,
            align: TextAlign.center,
          ),
          const SizedBox(height: AppDimen.paddingSmall),
          BookAuthorInfoMV(
            authors: authors,
            onTap: (name) {
              if (onTapAuthor != null) onTapAuthor!(name);
            },
          ),
          const SizedBox(height: AppDimen.paddingMedium),
          (() {
            final format = book.mediaType.orEmpty == 'Text' ? 'Read' : 'Listen';
            final url = book.mediaType.orEmpty == 'Text'
                ? book.getTextBookUrl()
                : book.getAudioBookUrl();

            if (url.isEmpty) return const SizedBox.shrink();
            return Column(children: [
              ButtonDefaultAV(
                text: format,
                onTap: () {
                  onTapButton?.call(url);
                },
                style: AppButton.primary,
                suffixIcon: const Icon(
                  FeatherIcons.externalLink,
                  size: AppDimen.sizeIconMedium,
                  color: AppColor.systemWhite,
                ),
              ),
              const SizedBox(height: AppDimen.paddingMedium),
            ]);
          }()),
          // Info
          BookInfoMV(
            itemList: _generateInfoItem(),
            height: 80,
          ),
          if (bookshelves.isNotEmpty && moreBooksTopic.isNotEmpty) ...[
            const Divider(thickness: 1.5),
            const SizedBox(height: AppDimen.paddingLarge),
            BookListByKeywordMV(
              height: 188,
              type: KeywordType.topic,
              keyword: bookshelves.first,
              books: moreBooksTopic,
              shouldShowSeeAll: false,
              onTap: onTapMoreBook,
            ),
          ],
          const SizedBox(height: AppDimen.paddingSmall),
          if (!authorJoinName.isNullOrEmpty && moreBooksAuthor.isNotEmpty) ...[
            const Divider(thickness: 1.5),
            const SizedBox(height: AppDimen.paddingMedium),
            BookListByKeywordMV(
              height: 188,
              type: KeywordType.author,
              keyword: authorJoinName.orEmpty,
              books: moreBooksAuthor,
              onTap: onTapMoreBook,
              onTapSeeAll: () {
                onTapSeeAll?.call(authors.map((e) => e.name).join(' '));
              },
            ),
          ],
        ],
      ),
    );
  }
}
