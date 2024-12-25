class ServerException implements Exception {
  final String errorMessage;

  const ServerException({
    required this.errorMessage,
  });

  @override
  String toString() {
    return errorMessage;
  }
}
