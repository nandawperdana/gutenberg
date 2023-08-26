import 'package:flutter/material.dart';

import 'package:gutenberg/core/design/atomic/button/button_base_av.dart';
import 'package:gutenberg/core/design/atomic/image/image_av.dart';
import 'package:gutenberg/core/design/atomic/text/text_av.dart';
import 'package:gutenberg/core/design/measurement/app_dimen.dart';
import 'package:gutenberg/core/design/measurement/dimension.dart';
import 'package:gutenberg/core/design/style/app_color.dart';
import 'package:gutenberg/core/design/style/app_text_style.dart';

class BookSmallCardMV extends StatelessWidget {
  final int id;
  final String title;
  final String imageUrl;
  final List<String> authors;
  final List<String> languages;
  final OnTap? onTap;

  const BookSmallCardMV({
    Key? key,
    required this.id,
    required this.title,
    this.imageUrl = '',
    this.authors = const [],
    this.languages = const [],
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 182.0,
            width: 120.0,
            clipBehavior: Clip.antiAlias,
            padding: const EdgeInsets.all(2.0),
            decoration: const BoxDecoration(color: AppColor.systemWhite),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageAV(
                  source: imageUrl,
                  dimension: const Dimension(width: 100.0, height: 150.0),
                ),
                const SizedBox(width: AppDimen.paddingSmall),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextAV(
                        text: title,
                        style: AppText.caption10Bold,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (authors.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(
                            right: AppDimen.paddingExtraSmall,
                          ),
                          child: TextAV(
                            text: authors.first,
                            style: AppText.caption08,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
