/// copied from https://pub.dev/packages/internet_connection_checker
/// at version 1.0.0+1
part of internet_connection_checker;

/// Helper class that contains the address options and indicates whether
/// opening a socket to it succeeded.
class AddressCheckResult {
  /// [AddressCheckResult] constructor
  AddressCheckResult(
    this.options, {
    required this.isSuccess,
  });

  /// AddressCheckOptions
  final AddressCheckOptions options;

  /// bool val to store result
  final bool isSuccess;

  @override
  String toString() => 'AddressCheckResult($options, $isSuccess)';
}
