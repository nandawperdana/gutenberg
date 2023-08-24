import 'package:gutenberg/core/locale/delegate.dart';
import 'package:gutenberg/feature/home/locale/locale.dart';
import 'message/messages_all_locales.dart';

class HomeLocaleDelegate extends LocaleDelegate<HomeLocale> {
  const HomeLocaleDelegate() : super();

  @override
  HomeLocale createLocale() => HomeLocale();

  @override
  Future<bool> initialize(String localeName) => initializeMessages(localeName);
}
