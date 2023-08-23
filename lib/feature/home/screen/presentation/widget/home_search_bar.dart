import 'package:flutter/material.dart';

import 'package:gutenberg/core/design/measurement/app_dimen.dart';
import 'package:gutenberg/core/design/molecule/search_bar/search_bar_mv.dart';
import 'package:gutenberg/feature/home/ext/context.dart';

class HomeSearchBar extends StatefulWidget {
  const HomeSearchBar({super.key});

  @override
  State<StatefulWidget> createState() => HomeSearchBarState();
}

class HomeSearchBarState extends State<HomeSearchBar> {
  final textController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    focusNode.requestFocus();

    return Padding(
      padding: const EdgeInsets.only(
        top: AppDimen.paddingMedium,
        bottom: AppDimen.paddingMedium,
        right: AppDimen.paddingMedium,
      ),
      child: SearchBarMV(placeholder: context.locale.searchPlaceholder),
    );
  }
}
