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
  final bool? copyright;

  @JsonKey(name: 'media_type')
  final String? mediaType;

  @JsonKey(name: 'download_count')
  final int? downloadCount;

  @JsonKey(name: 'bookshelves')
  final List<String>? bookshelves;

  Book({
    required this.id,
    required this.title,
    this.authors,
    this.subjects,
    this.formats,
    this.languages,
    this.copyright,
    this.mediaType,
    this.downloadCount,
    this.bookshelves,
  });

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  Map<String, dynamic> toJson() => _$BookToJson(this);

  String getImageUrl() {
    return formats?['image/jpeg'] ?? '';
  }

  String getTextBookUrl() {
    final textHtml = formats?['text/html'] ?? '';
    if (textHtml.isNotEmpty) return textHtml;

    final textPlain = formats?['text/plain'] ?? '';
    if (textPlain.isNotEmpty) return textPlain;

    return '';
  }

  String getAudioBookUrl() {
    if (getTextBookUrl().isNotEmpty) return getTextBookUrl();

    final audioMp4 = formats?['audio/mp4'] ?? '';
    if (audioMp4.isNotEmpty) return audioMp4;

    final audioMpeg = formats?['audio/mpeg'] ?? '';
    if (audioMpeg.isNotEmpty) return audioMpeg;

    final audioOgg = formats?['audio/ogg'] ?? '';
    if (audioOgg.isNotEmpty) return audioOgg;

    return '';
  }
}
