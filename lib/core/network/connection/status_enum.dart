/// copied from https://pub.dev/packages/internet_connection_checker
/// at version 1.0.0+1
part of internet_connection_checker;

/// Represents the status of the data connection.
/// Returned by [InternetConnectionChecker.connectionStatus]
enum InternetConnectionStatus {
  /// connected to internet
  connected,

  /// disconnected from internet
  disconnected,
}
