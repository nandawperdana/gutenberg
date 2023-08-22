// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Author _$AuthorFromJson(Map<String, dynamic> json) => Author(
      name: json['name'] as String,
      birthYear: json['birthYear'] as int,
      deathYear: json['deathYear'] as int,
    );

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
      'name': instance.name,
      'birthYear': instance.birthYear,
      'deathYear': instance.deathYear,
    };
