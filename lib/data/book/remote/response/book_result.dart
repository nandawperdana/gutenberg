import 'package:json_annotation/json_annotation.dart';

import 'package:gutenberg/data/book/remote/response/author.dart';

part 'book_result.g.dart';

@JsonSerializable()
class BookResult {
  final int id;
  final String title;
  final List<Author> authors;
  final List<String> subjects;
  final Map<String, String> formats;
  final int downloadCount;

  BookResult({
    required this.id,
    required this.title,
    required this.authors,
    required this.subjects,
    required this.formats,
    required this.downloadCount,
  });

  factory BookResult.fromJson(Map<String, dynamic> json) =>
      _$BookResultFromJson(json);

  Map<String, dynamic> toJson() => _$BookResultToJson(this);
}
