import 'package:gutenberg/core/locator/locator.dart';
import 'package:gutenberg/core/route/transporter.dart';

void registerModules() {
  locator.registerLazySingleton(() => Transporter());
}
