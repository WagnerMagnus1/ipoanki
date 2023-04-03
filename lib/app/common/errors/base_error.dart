abstract class Failure implements Exception {
  String? get message;
}

class DatasourceError extends Failure {
  @override
  final String? message;

  DatasourceError({
    this.message,
  });
}
