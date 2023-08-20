import 'package:flutter/material.dart';

import 'package:gutenberg/core/design/atomic/text/text_base_av.dart';
import 'package:gutenberg/core/design/style/app_color.dart';
import 'package:gutenberg/core/design/style/app_text_style.dart';

class TextAV extends TextBaseAV {
  const TextAV({
    Key? key,
    Color? color = AppColor.gray100,
    TextAlign align = TextAlign.start,
    required String text,
    required AppTextStyle style,
    TextOverflow? overflow,
    int? maxLines,
    bool isUnderline = false,
  }) : super(
          key: key,
          color: color,
          text: text,
          align: align,
          style: style,
          overflow: overflow,
          maxLines: maxLines,
          isUnderline: isUnderline,
        );
}
