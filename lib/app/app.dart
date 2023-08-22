import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:gutenberg/app/route/route_navigation_observer.dart';
import 'package:gutenberg/core/ext/context.dart';
import 'package:gutenberg/core/locator/locator.dart';
import 'package:gutenberg/core/route/transporter.dart';

class GutenbergApp extends StatefulWidget {
  const GutenbergApp({super.key});

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
      navigatorKey: _transporter.rootNavigationKey,
      title: 'Gutenberg',
      debugShowCheckedModeBanner: kDebugMode,
      onGenerateRoute: _transporter.generateRoute,
      builder: (context, child) => MediaQuery(
        // Lock font to always use 1.0 or normal,
        data: context.getMediaQuery().copyWith(textScaleFactor: 1.0),
        child: child ?? const SizedBox(),
      ),
      navigatorObservers: [
        RouteNavigationObserver(),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
