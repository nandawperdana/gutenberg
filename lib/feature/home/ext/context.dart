import 'package:flutter/material.dart';

import 'package:gutenberg/feature/home/locale/locale.dart';

extension BuildContextExt on BuildContext {
  HomeLocale get locale {
    return Localizations.of(this, HomeLocale);
  }
}
