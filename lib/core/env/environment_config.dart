// Let's assume we have different configuration for production & staging
// For the security purpose we also can add it to .gitignore

/// Development environment
class EnvironmentConfig {
  const EnvironmentConfig._();

  static const String activeEnvironment = 'development';
  static const String apiUrl = 'http://gutendex.com';
}

/// Production environment
// class EnvironmentConfig {
//   const EnvironmentConfig._();
//
//   static const String activeEnvironment = 'production';
//   static const String apiUrl = 'http://gutendex.com';
// }
