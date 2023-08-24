import 'package:flutter/widgets.dart';

import 'package:gutenberg/core/design/style/app_text_style.dart';

abstract class TextBaseAV extends StatelessWidget {
  final String text;

  final Color? color;

  final TextAlign align;

  final AppTextStyle style;

  final TextOverflow? overflow;

  final int? maxLines;

  final bool isUnderline;

  const TextBaseAV({
    Key? key,
    this.color,
    required this.text,
    required this.align,
    required this.style,
    required this.maxLines,
    this.overflow,
    required this.isUnderline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: style.fontSize,
        fontWeight: style.fontWeight,
        fontFamily: style.fontFamily,
        decoration: style.getDecoration(isUnderline),
      ),
    );
  }
}
