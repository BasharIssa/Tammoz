// في ملف domain/failures/general_failures.dart
import 'failures.dart';

class DatabaseFailure extends Failure {
  const DatabaseFailure({required super.message, super.stackTrace});
}

class NetworkFailure extends Failure {
  const NetworkFailure({required super.message, super.stackTrace});
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message, super.stackTrace});
}

class CacheFailure extends Failure {
  const CacheFailure({required super.message, super.stackTrace});
}

class NotFoundFailure extends Failure {
  const NotFoundFailure({super.stackTrace})
      : super(message: 'العنصر المطلوب غير موجود');
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure({super.stackTrace})
      : super(message: 'غير مصرح بالوصول');
}

class ValidationFailure extends Failure {
  const ValidationFailure({required super.message, super.stackTrace});
}