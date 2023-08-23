import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:collection/collection.dart';

import 'package:gutenberg/app/app.dart';
import 'package:gutenberg/core/core.dart';
import 'package:gutenberg/core/locale/supported_locale.dart';
import 'package:gutenberg/core/locator/locator.dart';
import 'package:gutenberg/data/data.dart';
import 'package:gutenberg/domain/domain.dart';
import 'package:gutenberg/feature/home/feature_home.dart';
import 'core/feature/feature_registry.dart';

void main() {}

Future<void> launchApp() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) async {
    runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();

      /// Features init
      final features = initFeature();
      for (final f in features) {
        await f.initialize();
      }
      final localeDelegates = <LocalizationsDelegate>[
        ...features.map((e) => e.getLocaleDelegate()).whereNotNull(),
      ];

      runApp(
        GutenbergApp(
          locales: supportedLocales,
          localeDelegates: localeDelegates,
        ),
      );
    }, (error, stack) {
      clearLocators();
    });
  });
}

List<FeatureRegistry> initFeature() {
  return [
    Core(),
    Data(),
    Domain(),
    FeatureHome(),
  ];
}

Future<void> clearLocators() async {
  await locator.reset(dispose: true);
}
