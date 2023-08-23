import 'package:flutter/material.dart';

List<Locale> get supportedLocales {
  return const <Locale>[
    Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
  ];
}
