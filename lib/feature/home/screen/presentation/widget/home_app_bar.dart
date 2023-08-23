import 'package:flutter/material.dart';

import 'package:gutenberg/core/design/atomic/text/text_av.dart';
import 'package:gutenberg/core/design/style/app_color.dart';
import 'package:gutenberg/core/design/style/app_text_style.dart';
import 'package:gutenberg/feature/home/ext/context.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextAV(
      text: context.locale.books,
      style: AppText.heading24,
      color: AppColor.systemWhite,
    );
  }
}
