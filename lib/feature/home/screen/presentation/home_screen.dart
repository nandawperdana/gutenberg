import 'package:flutter/material.dart';

import 'package:gutenberg/core/design/molecule/app_bar/app_bar_mv.dart';
import 'package:gutenberg/feature/home/screen/presentation/widget/home_app_bar.dart';
import 'package:gutenberg/feature/home/screen/presentation/widget/home_book_content.dart';
import 'package:gutenberg/feature/home/screen/presentation/widget/home_search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: const Scaffold(
        appBar: AppBarMV(
          title: HomeAppBar(),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeSearchBar(),
              Expanded(child: HomeBookContent()),
            ],
          ),
        ),
      ),
    );
  }
}
