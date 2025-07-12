// lib/features/operation/domain/failures/operation_failures.dart

import 'package:local_tammoz_chat/domain/failures/failures.dart';

class OperationDatabaseFailure extends Failure {
  const OperationDatabaseFailure({required super.message, super.stackTrace});
}

class OperationNotFoundFailure extends Failure {
  const OperationNotFoundFailure({required super.message});
}

class OperationValidationFailure extends Failure {
  const OperationValidationFailure({required super.message});
}
