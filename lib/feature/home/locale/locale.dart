import 'package:intl/intl.dart';

class HomeLocale {
  String get books {
    return Intl.message(
      'Books',
      name: 'books',
    );
  }

  String get searchPlaceholder {
    return Intl.message(
      'Search here...',
      name: 'searchPlaceholder',
    );
  }
}
