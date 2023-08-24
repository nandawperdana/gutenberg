import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:collection/collection.dart';
import 'package:get_it/get_it.dart';

import 'package:gutenberg/app/app.dart';
import 'package:gutenberg/core/locale/supported_locale.dart';
import 'package:gutenberg/core/locator/locator.dart';
import 'package:gutenberg/core/locator/module.dart' as core_module;
import 'package:gutenberg/data/locator/module.dart' as data_module;
import 'package:gutenberg/domain/locator/module.dart' as domain_module;
import 'package:gutenberg/feature/detail/feature_detail.dart';
import 'package:gutenberg/feature/home/feature_home.dart';
import 'core/feature/feature_registry.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await launchApp();
}

Future<void> launchApp() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) async {
    /// Modules init
    initModules(locator);

    /// Features init
    final features = initFeatures();

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
  });
}

void initModules(GetIt locator) {
  core_module.registerModules(locator);
  data_module.registerModules(locator);
  domain_module.registerModules(locator);
}

List<FeatureRegistry> initFeatures() {
  return [
    FeatureHome(),
    FeatureDetail(),
  ];
}

Future<void> clearLocators() async {
  await locator.reset(dispose: true);
}
