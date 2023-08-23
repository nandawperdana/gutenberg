import 'package:flutter/material.dart';

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
  final OnTap? onTap;

  const BookCardMV({
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
      onTap: () {},
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          AnimatedContainer(
            clipBehavior: Clip.antiAlias,
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOutQuad,
            padding: const EdgeInsets.all(AppDimen.paddingMedium),
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
                  dimension: const Dimension(width: 10, height: 50),
                ),
                const SizedBox(width: AppDimen.paddingMedium),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextAV(
                        text: title,
                        style: AppText.body14Bold,
                        maxLines: 3,
                      ),
                      ListView.builder(
                        itemCount: authors.length,
                        itemBuilder: (context, index) {
                          return TextAV(
                            text: '${authors[index]}, ',
                            style: AppText.caption10,
                          );
                        },
                      ),
                      TextAV(
                        text: title,
                        style: AppText.body14Bold,
                        maxLines: 3,
                      ),
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
