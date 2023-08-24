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

  String get keywordNotFound {
    return Intl.message(
      'Sorry, it seems like we couldn\'t find any books with the keyword you searched for.\nPlease try using a different keyword.',
      name: 'searchPlaceholder',
    );
  }
}
