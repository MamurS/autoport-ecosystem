class ServerException implements Exception {
  final String message;

  ServerException(this.message);

  @override
  String toString() => message;
}

class CacheException implements Exception {
  final String message;

  CacheException(this.message);

  @override
  String toString() => message;
}

class NetworkException implements Exception {
  final String message;

  NetworkException(this.message);

  @override
  String toString() => message;
}

class AuthException implements Exception {
  final String message;

  AuthException(this.message);

  @override
  String toString() => message;
} 