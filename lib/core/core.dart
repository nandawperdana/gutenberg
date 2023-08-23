import 'package:gutenberg/core/feature/feature_registry.dart';
import 'package:gutenberg/core/locator/locator.dart';

class Core extends FeatureRegistry {
  @override
  Future initialize() async {
    initCore();
  }
}
