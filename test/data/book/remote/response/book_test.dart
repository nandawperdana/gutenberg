import 'package:flutter_test/flutter_test.dart';

import 'package:gutenberg/data/book/remote/response/author.dart';
import 'package:gutenberg/data/book/remote/response/book.dart';

void main() {
  group('Book', () {
    test('fromJson creates correct object', () {
      final json = {
        'id': 1,
        'title': 'Book Title',
        'authors': [
          {'name': 'Author 1'},
          {'name': 'Author 2'},
        ],
        'subjects': ['Subject 1', 'Subject 2'],
      };

      final book = Book.fromJson(json);

      expect(book.id, 1);
      expect(book.title, 'Book Title');
      expect(book.authors?.length, 2);
    });

    test('toJson returns correct JSON', () {
      final book = Book(
        id: 1,
        title: 'Book Title',
        authors: [
          Author(name: 'Author 1', birthYear: 1910, deathYear: 1999),
          Author(name: 'Author 2', birthYear: 1910, deathYear: 1999),
        ],
        subjects: ['Subject 1', 'Subject 2'],
      );

      final json = book.toJson();

      expect(json['id'], 1);
      expect(json['title'], 'Book Title');
      expect(json['authors'], isA<List>());
    });

    test('getImageUrl returns correct URL', () {
      final book = Book(
        id: 1,
        title: 'Book Title',
        formats: {
          'image/jpeg': 'http://example.com/image.jpg',
        },
      );

      final imageUrl = book.getImageUrl();

      expect(imageUrl, 'http://example.com/image.jpg');
    });

    test('getTextBookUrl returns correct URL', () {
      final book = Book(
        id: 1,
        title: 'Book Title',
        formats: {
          'text/html': 'http://example.com/text.html',
          'text/plain': 'http://example.com/text.txt',
        },
      );

      final textBookUrl = book.getTextBookUrl();

      expect(textBookUrl, 'http://example.com/text.html');
    });

    test('getAudioBookUrl returns correct URL', () {
      final book = Book(
        id: 1,
        title: 'Book Title',
        formats: {
          'audio/mp4': 'http://example.com/audio.mp4',
          'audio/mpeg': 'http://example.com/audio.mp3',
        },
      );

      final audioBookUrl = book.getAudioBookUrl();

      expect(audioBookUrl, 'http://example.com/audio.mp4');
    });
  });
}
