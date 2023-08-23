import 'dart:async';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

abstract class LocaleDelegate<T> extends LocalizationsDelegate<T> {
  const LocaleDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<T> load(Locale locale) async {
    String localeName = _extractLocaleName(locale);
    if (!await initialize(localeName)) {
      localeName = _extractLocaleName(fallback);
      await initialize(localeName);
    }

    final instance = createLocale();
    return instance;
  }

  String _extractLocaleName(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();

    return Intl.canonicalizedLocale(name);
  }

  @override
  bool shouldReload(LocalizationsDelegate<T> old) => false;

  Locale get fallback => const Locale('messages');

  T createLocale();

  Future<bool> initialize(String localeName);
}
