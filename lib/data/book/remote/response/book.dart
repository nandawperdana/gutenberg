import 'package:json_annotation/json_annotation.dart';

import 'package:gutenberg/data/book/remote/response/author.dart';

part 'book.g.dart';

@JsonSerializable()
class Book {
  final int id;
  final String title;
  final List<Author>? authors;
  final List<String>? subjects;
  final Map<String, String>? formats;
  final List<String>? languages;
  @JsonKey(name: 'download_count')
  final int? downloadCount;

  Book({
    required this.id,
    required this.title,
    this.authors,
    this.subjects,
    this.formats,
    this.languages,
    this.downloadCount,
  });

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  Map<String, dynamic> toJson() => _$BookToJson(this);

  String getImageUrl() {
    return formats?['image/jpeg'] ?? '';
  }
}
