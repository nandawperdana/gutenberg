import 'package:flutter/material.dart';

import 'package:feather_icons/feather_icons.dart';

import 'package:gutenberg/core/design/atomic/text/text_av.dart';
import 'package:gutenberg/core/design/measurement/app_dimen.dart';
import 'package:gutenberg/core/design/style/app_color.dart';
import 'package:gutenberg/core/design/style/app_text_style.dart';
import 'package:gutenberg/core/ext/string.dart';
import 'package:gutenberg/data/book/remote/response/book.dart';

class BookDetailSectionMV extends StatelessWidget {
  const BookDetailSectionMV({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

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
    final infoItems = _generateInfoItem();
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
          (() {
            final authors = book.authors ?? [];
            if (authors.isEmpty) return const SizedBox.shrink();
            return Column(
              children: authors.map(
                (author) {
                  return InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: AppDimen.paddingExtraSmall,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextAV(
                            text: author.name,
                            style: AppText.body16,
                            align: TextAlign.center,
                          ),
                          const Icon(
                            FeatherIcons.chevronRight,
                            color: AppColor.primary,
                            size: AppDimen.sizeIconLarge,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ).toList(),
            );
          }()),
          const SizedBox(height: AppDimen.paddingLarge),
          // Info
          SizedBox(
            height: 80,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: infoItems.length,
              itemBuilder: (context, index) {
                final item = infoItems[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDimen.paddingSmall),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextAV(
                            text: item.info,
                            style: AppText.body14Bold,
                          ),
                          const SizedBox(
                            height: AppDimen.paddingExtraSmall,
                          ),
                          TextAV(
                            text: item.type.getName(),
                            style: AppText.caption12,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: AppDimen.paddingMedium),
                  child: VerticalDivider(thickness: 2.0),
                );
              },
            ),
          ),
          const SizedBox(height: AppDimen.paddingLarge),
        ],
      ),
    );
  }
}

enum BookInfoType {
  lang,
  download,
  copyright,
  format;

  String getName() {
    switch (this) {
      case BookInfoType.lang:
        return 'Language';
      case BookInfoType.download:
        return 'Downloads';
      case BookInfoType.copyright:
        return 'Copyright';
      case BookInfoType.format:
        return 'Format';
    }
  }
}

class BookInfoItem {
  BookInfoItem({
    required this.type,
    required this.info,
  });

  final BookInfoType type;
  final String info;
}
