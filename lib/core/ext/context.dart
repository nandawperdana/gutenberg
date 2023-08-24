import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  MediaQueryData get mediaQuery {
    return MediaQuery.of(this);
  }

  int? getImageCacheSize(double? size) {
    if (size == null) return null;
    return (mediaQuery.devicePixelRatio * size).round();
  }
}
