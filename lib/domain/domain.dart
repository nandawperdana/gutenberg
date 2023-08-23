import 'package:gutenberg/core/feature/feature_registry.dart';
import 'package:gutenberg/core/locator/locator.dart';
import 'package:gutenberg/domain/locator/module.dart';

class Domain extends FeatureRegistry {
  @override
  Future initialize() async {
    registerModules(locator);
  }
}
