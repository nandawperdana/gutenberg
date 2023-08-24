import 'package:gutenberg/core/env/environment_config.dart';
import 'package:gutenberg/core/env/flavor.dart';

class Environment {
  const Environment._();

  static Flavor getAppEnvironment() {
    return Flavor.values.firstWhere(
      (f) => f.name == EnvironmentConfig.activeEnvironment,
    );
  }
}
