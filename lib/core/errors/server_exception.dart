/// A custom exception class that is thrown when there is a server-related error.
///
/// The [ServerException] class holds both an error message and an error code to
/// describe the nature of the error in more detail.
class ServerException implements Exception {
  final String errorMessage;
  final int errorCode;

  const ServerException({
    required this.errorMessage,
    required this.errorCode,
  });

  /// Returns a string representation of the exception, including the error code and message.
  @override
  String toString() {
    return 'Error code: $errorCode. \n$errorMessage';
  }
}
