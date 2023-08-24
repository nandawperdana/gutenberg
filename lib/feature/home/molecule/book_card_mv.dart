import 'package:flutter/material.dart';

import 'package:feather_icons/feather_icons.dart';

import 'package:gutenberg/core/design/atomic/button/button_base_av.dart';
import 'package:gutenberg/core/design/atomic/image/image_av.dart';
import 'package:gutenberg/core/design/atomic/text/text_av.dart';
import 'package:gutenberg/core/design/measurement/app_dimen.dart';
import 'package:gutenberg/core/design/measurement/dimension.dart';
import 'package:gutenberg/core/design/style/app_color.dart';
import 'package:gutenberg/core/design/style/app_text_style.dart';

class BookCardMV extends StatelessWidget {
  final int id;
  final String title;
  final String imageUrl;
  final List<String> authors;
  final List<String> languages;
  final int? downloadCount;
  final OnTap? onTap;

  const BookCardMV({
    Key? key,
    required this.id,
    required this.title,
    this.imageUrl = '',
    this.authors = const [],
    this.languages = const [],
    this.downloadCount,
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
            height: 120.0,
            clipBehavior: Clip.antiAlias,
            padding: const EdgeInsets.all(AppDimen.paddingSmall),
            decoration: BoxDecoration(
              color: AppColor.systemWhite,
              borderRadius: BorderRadius.circular(AppDimen.paddingSmall),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0.0, 2.0),
                  blurRadius: AppDimen.radiusExtraSmall,
                  spreadRadius: 0.0,
                  color: AppColor.gray100.withOpacity(0.1),
                ),
              ],
            ),
            child: Row(
              children: [
                ImageAV(
                  source: imageUrl,
                  dimension: const Dimension(width: 86.0, height: 120.0),
                ),
                const SizedBox(width: AppDimen.paddingSmall),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextAV(
                        text: title,
                        style: AppText.caption12Bold,
                        maxLines: 3,
                      ),
                      const SizedBox(width: AppDimen.paddingSmall),
                      if (authors.isNotEmpty)
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: authors.map(
                            (author) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                  right: AppDimen.paddingExtraSmall,
                                ),
                                child: TextAV(
                                  text: author,
                                  style: AppText.caption10,
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (languages.isNotEmpty)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: languages.map(
                                (lang) {
                                  return Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 2,
                                      horizontal: AppDimen.paddingExtraSmall,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        AppDimen.radiusMedium,
                                      ),
                                      border: Border.all(
                                          width: 1, color: AppColor.primary),
                                      color: Colors.transparent,
                                    ),
                                    child: TextAV(
                                      text: lang.toUpperCase(),
                                      style: AppText.caption10,
                                      color: AppColor.primary,
                                    ),
                                  );
                                },
                              ).toList(),
                            ),
                          if (downloadCount != null)
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(
                                    right: AppDimen.paddingExtraSmall,
                                  ),
                                  child: Icon(
                                    FeatherIcons.download,
                                    size: AppDimen.sizeIconSmall,
                                    color: AppColor.gray70,
                                  ),
                                ),
                                TextAV(
                                  text: '$downloadCount',
                                  style: AppText.caption10,
                                  color: AppColor.gray70,
                                )
                              ],
                            ),
                        ],
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
