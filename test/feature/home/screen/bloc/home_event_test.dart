import 'package:flutter_test/flutter_test.dart';

import 'package:gutenberg/feature/home/screen/bloc/home_bloc.dart';

void main() {
  group('HomeEvent', () {
    test('FetchEvent creates correct props', () {
      const fetchEvent = FetchEvent(page: 1);
      expect(fetchEvent.props, [1]);
    });

    test('SearchEvent creates correct props', () {
      const searchEvent = SearchEvent(keyword: 'Test Keyword');
      expect(searchEvent.props, ['Test Keyword']);
    });

    test('NavigateToBookScreenEvent creates correct props', () {
      const navigateEvent = NavigateToBookScreenEvent(id: 123);
      expect(navigateEvent.props, [123]);
    });
  });
}
