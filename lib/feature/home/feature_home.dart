import 'package:gutenberg/app/entry/home/home_route.dart';
import 'package:gutenberg/core/feature/feature_registry.dart';
import 'package:gutenberg/core/locale/delegate.dart';
import 'package:gutenberg/core/route/transporter.dart';
import 'package:gutenberg/feature/home/locale/delegate.dart';
import 'package:gutenberg/feature/home/screen/presentation/home_screen.dart';

class FeatureHome extends FeatureRegistry {
  @override
  void initRoute(Transporter transporter) {
    transporter.registerRoute(
      HomeRoute.home,
      (context, information) => const HomeScreen(),
    );
  }

  @override
  LocaleDelegate? getLocaleDelegate() => const HomeLocaleDelegate();
}
