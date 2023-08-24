import 'package:flutter/material.dart';

const keyCurrentRoute = 'currentRoute';

class RouteNavigationObserver extends RouteObserver<PageRoute<Object?>> {
  RouteNavigationObserver();

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    if (route is PageRoute) {
      _dispatchRoute(route);
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute is PageRoute) {
      _dispatchRoute(newRoute);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute is PageRoute && route is PageRoute) {
      _dispatchRoute(previousRoute);
    }
  }

  void _dispatchRoute(PageRoute<Object?> route) {
    // final routeName = route.settings.name ?? '';
    // _saveCurrentRoute(routeName);
  }
}
