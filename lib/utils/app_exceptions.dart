class FetchDataError implements Exception {
  final String message;
  FetchDataError({this.message = "Error during communication"});

  @override
  String toString()=>message;
  }

class NotFoundError implements Exception {
  final String message;
  NotFoundError({this.message = "Data not found"});
  @override
  String toString()=>message;
}

class NetworkError implements Exception {
  final String message;
  NetworkError({this.message = "No internet"});
  @override
  String toString()=>message;
}

class UnKnownError implements Exception {
  final String message;
  UnKnownError({this.message = "Something went wrong"});
  @override
  String toString()=>message;
}

class CacheError implements Exception {
  final String message;
  CacheError({this.message = "Cache error occurred"});
  @override
  String toString()=>message;
}