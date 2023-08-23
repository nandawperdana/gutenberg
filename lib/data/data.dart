import 'package:gutenberg/core/feature/feature_registry.dart';
import 'package:gutenberg/core/locator/locator.dart';
import 'package:gutenberg/data/locator/module.dart';

class Data extends FeatureRegistry {
  @override
  Future initialize() async {
    registerModules(locator);
  }
}
