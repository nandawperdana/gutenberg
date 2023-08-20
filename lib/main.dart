import 'dart:async';

import 'package:flutter/material.dart';

import 'package:gutenberg/app/app.dart';

void main() {
  runZonedGuarded(() {
    WidgetsFlutterBinding.ensureInitialized();

    runApp(const GutenbergApp());
  }, (error, stack) {
    // Log error
  });
}
