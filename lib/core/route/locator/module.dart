import 'package:get_it/get_it.dart';

import 'package:gutenberg/core/route/transporter.dart';

void registerModules(GetIt locator) {
  locator.registerLazySingleton(() => Transporter());
}
