// lib/features/operation/domain/failures/operation_failures.dart

import 'package:local_tammoz_chat/domain/failures/failures.dart';

class OperationDatabaseFailure extends Failure {
  const OperationDatabaseFailure({required String message, StackTrace? stackTrace})
      : super(message: message, stackTrace: stackTrace);
}

class OperationNotFoundFailure extends Failure {
  const OperationNotFoundFailure({required String message})
      : super(message: message);
}

class OperationValidationFailure extends Failure {
  const OperationValidationFailure({required String message})
      : super(message: message);
}
