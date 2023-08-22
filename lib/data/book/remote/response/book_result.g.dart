// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookResult _$BookResultFromJson(Map<String, dynamic> json) => BookResult(
      id: json['id'] as int,
      title: json['title'] as String,
      authors: (json['authors'] as List<dynamic>)
          .map((e) => Author.fromJson(e as Map<String, dynamic>))
          .toList(),
      subjects:
          (json['subjects'] as List<dynamic>).map((e) => e as String).toList(),
      formats: Map<String, String>.from(json['formats'] as Map),
      downloadCount: json['downloadCount'] as int,
    );

Map<String, dynamic> _$BookResultToJson(BookResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'authors': instance.authors,
      'subjects': instance.subjects,
      'formats': instance.formats,
      'downloadCount': instance.downloadCount,
    };
