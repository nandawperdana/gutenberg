import 'package:get_it/get_it.dart';

import 'package:gutenberg/domain/book/locator/module.dart' as book;

void registerModules(GetIt locator) {
  book.registerModules(locator);
}
