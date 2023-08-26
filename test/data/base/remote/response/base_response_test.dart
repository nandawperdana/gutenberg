import 'package:flutter_test/flutter_test.dart';

import 'package:gutenberg/data/base/remote/response/base_response.dart';
import 'package:gutenberg/data/book/remote/response/book.dart';

void main() {
  group('BaseResponse', () {
    test('fromJson creates correct object', () {
      final json = <String, dynamic>{
        'count': 10,
        'next': 'http://example.com/next',
        'previous': 'http://example.com/previous',
        'results': [
          {'id': 1, 'title': 'Item 1'},
          {'id': 2, 'title': 'Item 2'},
        ],
      };

      final response = BaseResponse.fromJson(
          json, (json) => Book.fromJson(json as Map<String, dynamic>));

      expect(response.count, 10);
      expect(response.next, 'http://example.com/next');
      expect(response.previous, 'http://example.com/previous');
      expect(response.results.length, 2);
    });

    test('toJson returns correct JSON', () {
      final response = BaseResponse<Book>(
        count: 5,
        next: 'http://example.com/next',
        previous: 'http://example.com/previous',
        results: [
          Book(id: 1, title: 'Item 1'),
          Book(id: 2, title: 'Item 2'),
        ],
      );

      final json = response.toJson((item) => item.toJson());

      expect(json['count'], 5);
      expect(json['next'], 'http://example.com/next');
      expect(json['previous'], 'http://example.com/previous');
      expect(json['results'], isA<List>());
      expect(json['results'][0]['id'], 1);
      expect(json['results'][1]['title'], 'Item 2');
    });
  });
}
