import 'package:flutter/material.dart';

import 'package:marquee/marquee.dart';

import 'package:gutenberg/core/design/style/app_color.dart';
import 'package:gutenberg/core/design/style/app_text_style.dart';

class TextMarqueeAV extends StatelessWidget {
  const TextMarqueeAV({
    Key? key,
    required this.text,
    this.style,
    this.color = AppColor.gray100,
  }) : super(key: key);

  final String text;
  final AppTextStyle? style;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Marquee(
      text: text,
      style:
          style != null ? style?.toTextStyle() : AppText.body14.toTextStyle(),
      scrollAxis: Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.start,
      blankSpace: 20.0,
      velocity: 100.0,
      pauseAfterRound: const Duration(seconds: 1),
      startPadding: 10.0,
      accelerationDuration: const Duration(seconds: 1),
      accelerationCurve: Curves.linear,
      decelerationDuration: const Duration(milliseconds: 500),
      decelerationCurve: Curves.easeOut,
    );
  }
}
