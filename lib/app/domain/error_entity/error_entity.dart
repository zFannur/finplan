import 'package:firebase_auth/firebase_auth.dart';

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

    if (error is FirebaseException) {
      String message = "";

      switch(error.code) {
        case 'user-not-found':
          message = 'No user found for that email.';
          break;
        case 'wrong-password':
          message = 'Wrong password provided for that user.';
          break;
        case 'weak-password':
          message = 'The password provided is too weak.';
          break;
        case 'email-already-in-use':
          message = 'The account already exists for that email.';
          break;
        case 'requires-recent-login':
          message = 'Повторите аутентификацию пользователя.';
          break;
      }
      return ErrorEntity(
        message: error.message ?? "Неизвестная ошибка",
        errorMessage: message,
        error: error,
        stackTrace: error.stackTrace,
      );
    }

    return entity;
  }
}
