import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:gutenberg/core/design/style/app_color.dart';

class AppTheme {
  const AppTheme._();

  static final ThemeData theme = ThemeData(
    bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),
    appBarTheme: const AppBarTheme().copyWith(
      backgroundColor: AppColor.primary,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: AppColor.primary,
    primarySwatch: _primarySwatch,
    canvasColor: Colors.transparent,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColor.accent,
      primary: AppColor.primary,
      background: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.white,
  );

  static const _primarySwatch = MaterialColor(
    0xFF234FE0,
    <int, Color>{
      50: Color(0xFFE3E7F8),
      100: Color(0xFFBAC0E7),
      200: Color(0xFF8E97D2),
      300: Color(0xFF626FBF),
      400: Color(0xFF4056B1),
      500: Color(0xFF234FE0),
      600: Color(0xFF1D45C7),
      700: Color(0xFF173CAE),
      800: Color(0xFF123293),
      900: Color(0xFF0A2173),
    },
  );
}
