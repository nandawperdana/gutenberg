import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:gutenberg/app/route/route_navigation_observer.dart';

class GutenbergApp extends StatefulWidget {
  const GutenbergApp({super.key});

  @override
  State<StatefulWidget> createState() => _GutenbergAppState();
}

class _GutenbergAppState extends State<GutenbergApp> {
  UniqueKey _key = UniqueKey();
  GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  void restart() {
    setState(() {
      _key = UniqueKey();
      _navigatorKey = GlobalKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: _key,
      navigatorKey: _navigatorKey,
      title: 'Gutenberg',
      debugShowCheckedModeBanner: kDebugMode,
      navigatorObservers: [
        RouteNavigationObserver(),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
