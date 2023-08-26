import 'package:flutter/material.dart';

import 'package:collection/collection.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Iterable<LocalizationsDelegate<dynamic>> getLocalizationsDelegates(
    List<LocalizationsDelegate?>? localeDelegate) {
  final List<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    GlobalWidgetsLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  if (localeDelegate != null) {
    localizationsDelegates.addAll(localeDelegate.whereNotNull());
  }

  return localizationsDelegates;
}
