import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:gutenberg/core/design/molecule/search_bar/search_bar_mv.dart';
import 'package:gutenberg/feature/home/locale/delegate.dart';
import 'package:gutenberg/feature/home/locale/locale.dart';
import 'package:gutenberg/feature/home/screen/presentation/widget/home_search_bar.dart';
import '../../../../../suite/component.dart';

void main() {
  late HomeLocale homeLocale;

  setUpAll(() {
    homeLocale = HomeLocale();
  });

  testComponent(
    'Validate HomeSearchBar to show correct widgets',
    localeDelegate: [
      const HomeLocaleDelegate(),
    ],
    component: const HomeSearchBar(),
    onRunTest: (tester) async {
      await tester.pumpAndSettle();

      expect(find.byType(SearchBarMV), findsOneWidget);
      expect(find.text(homeLocale.searchPlaceholder), findsOneWidget);
      expect(FocusScope.of(tester.element(find.byType(SearchBarMV))).hasFocus,
          isTrue);
    },
  );
}
