import 'package:flutter/material.dart';

import 'package:gutenberg/core/design/atomic/text/text_av.dart';
import 'package:gutenberg/core/design/measurement/app_dimen.dart';
import 'package:gutenberg/core/design/style/app_text_style.dart';

class BookInfoMV extends StatelessWidget {
  const BookInfoMV({
    Key? key,
    required this.itemList,
    this.height = 80,
  }) : super(key: key);

  final List<BookInfoItem> itemList;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          final item = itemList[index];
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppDimen.paddingSmall),
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
            padding: EdgeInsets.symmetric(vertical: AppDimen.paddingMedium),
            child: VerticalDivider(thickness: 2.0),
          );
        },
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
