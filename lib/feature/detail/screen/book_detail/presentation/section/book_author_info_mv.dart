import 'package:flutter/material.dart';

import 'package:feather_icons/feather_icons.dart';

import 'package:gutenberg/core/design/atomic/text/text_av.dart';
import 'package:gutenberg/core/design/measurement/app_dimen.dart';
import 'package:gutenberg/core/design/style/app_color.dart';
import 'package:gutenberg/core/design/style/app_text_style.dart';
import 'package:gutenberg/data/book/remote/response/author.dart';

class BookAuthorInfoMV extends StatelessWidget {
  const BookAuthorInfoMV({
    Key? key,
    required this.authors,
    this.onTap,
  }) : super(key: key);

  final List<Author> authors;
  final void Function(String name)? onTap;

  @override
  Widget build(BuildContext context) {
    if (authors.isEmpty) return const SizedBox.shrink();
    return Column(
      children: authors.map(
        (author) {
          return InkWell(
            onTap: () {
              if (onTap != null) onTap!(author.name);
            },
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
  }
}
