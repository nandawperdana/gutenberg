import 'package:gutenberg/core/locale/delegate.dart';
import 'package:gutenberg/core/locator/locator.dart';
import 'package:gutenberg/core/route/transporter.dart';

abstract class FeatureRegistry {
  FeatureRegistry() {
    initRoute(locator<Transporter>());
  }

  Future initialize() async {}

  void initRoute(Transporter transporter) {}

  LocaleDelegate? getLocaleDelegate() {
    return null;
  }
}
