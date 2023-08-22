import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  final int count;
  final String? next;
  final String? previous;
  final List<T> results;

  BaseResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BaseResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(
    Object? Function(T value) toJsonT,
  ) =>
      _$BaseResponseToJson(this, toJsonT);
}
