import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';

void initializeWindowSize(WidgetTester tester) {
  tester.view.physicalSize = const Size(750, 1334);
  tester.view.devicePixelRatio = 1;
}
