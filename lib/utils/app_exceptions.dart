class BadRequestException implements Exception {
  final String message;
  BadRequestException({this.message = "Bad request"});
}

class NotFoundError implements Exception {
  final String message;
  NotFoundError({this.message = "Data not found"});
}

class NetworkError implements Exception {
  final String message;
  NetworkError(this.message);
}

class UnKnownError implements Exception {
  final String message;
  UnKnownError({this.message = "Something went wrong"});
}

class CacheError implements Exception {
  final String message;
  CacheError({this.message = "Cache error occurred"});
}