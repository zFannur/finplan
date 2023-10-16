class ErrorEntity {
  final String message;
  final String? errorMessage;
  final dynamic error;
  final StackTrace? stackTrace;

  ErrorEntity({
    required this.message,
    this.errorMessage,
    this.error,
    this.stackTrace,
  });

  factory ErrorEntity.fromException(dynamic error) {
    final entity = ErrorEntity(message: "неизвестная ошибка");

    if (error is ErrorEntity) return error;

    if (error) {
      return ErrorEntity(
        message: error.response?.data["message"] ?? "неизвестная ошибка",
        errorMessage: error.response?.data["error"] ?? "неизвестная ошибка",
        error: error,
        stackTrace: error.stackTrace,
      );
    }

    return entity;
  }
}
