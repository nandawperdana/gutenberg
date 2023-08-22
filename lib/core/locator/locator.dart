import 'package:get_it/get_it.dart';

import 'package:gutenberg/core/network/locator/module.dart' as network;
import 'package:gutenberg/core/route/locator/module.dart' as route;

GetIt locator = GetIt.I;

Future<void> initCore() async {
  network.registerModules(locator);
  route.registerModules(locator);
}
