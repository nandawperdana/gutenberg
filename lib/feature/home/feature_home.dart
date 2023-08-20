import 'package:flutter/cupertino.dart';

import 'package:gutenberg/app/entry/home/home_route.dart';
import 'package:gutenberg/core/feature/feature_registry.dart';
import 'package:gutenberg/core/route/transporter.dart';

class FeatureHome extends FeatureRegistry {
  @override
  void initRoute(Transporter transporter) {
    transporter.registerRoute(
      HomeRoute.home,
      (context, information) => const SizedBox(),
    );
  }
}
