import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  MediaQueryData getMediaQuery() {
    return MediaQuery.of(this);
  }

  int? getImageCacheSize(double? size) {
    if (size == null) return null;
    return (getMediaQuery().devicePixelRatio * size).round();
  }
}
