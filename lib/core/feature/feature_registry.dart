import 'package:gutenberg/core/locator/locator.dart';
import 'package:gutenberg/core/route/transporter.dart';

abstract class FeatureRegistry {
  FeatureRegistry() {
    initRoute(locator<Transporter>());
  }

  void initRoute(Transporter transporter);
}
