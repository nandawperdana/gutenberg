import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:gutenberg/app/entry/home/home_route.dart';
import 'package:gutenberg/app/route/route_navigation_observer.dart';
import 'package:gutenberg/core/design/style/app_theme.dart';
import 'package:gutenberg/core/ext/context.dart';
import 'package:gutenberg/core/locator/locator.dart';
import 'package:gutenberg/core/route/transporter.dart';

class GutenbergApp extends StatefulWidget {
  final List<Locale> locales;

  final List<LocalizationsDelegate> localeDelegates;

  const GutenbergApp({
    super.key,
    required this.locales,
    required this.localeDelegates,
  });

  @override
  State<StatefulWidget> createState() => _GutenbergAppState();
}

class _GutenbergAppState extends State<GutenbergApp> {
  final _transporter = locator<Transporter>();
  UniqueKey _key = UniqueKey();

  @override
  void initState() {
    super.initState();
  }

  void restart() {
    setState(() {
      _key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: _key,
      debugShowCheckedModeBanner: kDebugMode,
      title: 'Gutenberg',
      localizationsDelegates: [
        ...widget.localeDelegates,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: widget.locales,
      initialRoute: HomeRoute.home.name,
      onGenerateRoute: _transporter.generateRoute,
      builder: (context, child) => MediaQuery(
        // Lock font to always use 1.0 or normal,
        data: context.mediaQuery.copyWith(textScaleFactor: 1.0),
        child: child ?? const SizedBox(),
      ),
      navigatorKey: _transporter.rootNavigationKey,
      navigatorObservers: [
        RouteNavigationObserver(),
      ],
      theme: AppTheme.theme,
    );
  }
}
