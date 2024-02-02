class Failure extends Error {
  Failure([this.message = 'Something went wrong', this.st]);

  final String? message;
  final StackTrace? st;
}
