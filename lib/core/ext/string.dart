extension NullableStringExt on String? {
  bool isNullOrEmpty() {
    return this == null || this!.isEmpty;
  }

  String orEmpty() {
    return this ?? '';
  }
}
