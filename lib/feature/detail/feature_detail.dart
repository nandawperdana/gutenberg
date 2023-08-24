import 'package:gutenberg/app/entry/detail/detail_route.dart';
import 'package:gutenberg/core/feature/feature_registry.dart';
import 'package:gutenberg/core/locale/delegate.dart';
import 'package:gutenberg/core/route/transporter.dart';
import 'package:gutenberg/feature/detail/screen/book_detail/presentation/book_detail_screen.dart';

class FeatureDetail extends FeatureRegistry {
  @override
  void initRoute(Transporter transporter) {
    transporter.registerRoute(
      DetailRoute.bookDetail,
      (context, information) {
        final bookId = information.argument as int;
        return BookDetailScreen(bookId: bookId);
      },
    );
  }

  @override
  LocaleDelegate? getLocaleDelegate() => null;
}
