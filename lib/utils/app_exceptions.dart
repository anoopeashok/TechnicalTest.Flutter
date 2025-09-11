
class NetworkError implements Exception {
  final String message;
  NetworkError(this.message);
}

class UnKnownError implements Exception {
  final String message;
  UnKnownError({this.message = "Something went wrong"});
}