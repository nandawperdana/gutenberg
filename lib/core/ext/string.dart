extension NullableStringExt on String? {
  bool get isNullOrEmpty {
    return this == null || this!.isEmpty;
  }

  String get orEmpty {
    return this ?? '';
  }
}
