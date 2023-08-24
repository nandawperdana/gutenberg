import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:gutenberg/core/design/atomic/text/text_av.dart';
import 'package:gutenberg/core/design/style/app_color.dart';
import 'package:gutenberg/core/design/style/app_text_style.dart';

class ScreenHost extends StatelessWidget {
  final String route;

  final Widget screen;

  const ScreenHost({
    Key? key,
    required this.route,
    required this.screen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kReleaseMode) return screen;

    return Stack(
      children: [
        screen,
        SafeArea(
          child: Align(
            alignment: Alignment.topCenter,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                child: TextAV(
                  key: const Key('text-debug'),
                  text: 'Debug ($route)',
                  style: AppText.caption12Bold,
                  color: AppColor.yellow,
                ),
                onTap: () {},
              ),
            ),
          ),
        ),
      ],
    );
  }
}
