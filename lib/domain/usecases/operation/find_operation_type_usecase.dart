// domain/usecases/find_operation_type_usecase.dart

import 'package:dartz/dartz.dart';
import 'package:local_tammoz_chat/domain/entities/operation_type.dart';
import 'package:local_tammoz_chat/domain/failures/failures.dart';
import 'package:local_tammoz_chat/domain/failures/operation_failures.dart';

class FindOperationTypeUseCase {
  /// يبحث في قائمة أنواع العمليات عن النوع الذي يطابق الاسم [name]
  /// يعيد Either<Failure, OperationType>
  Either<Failure, OperationType> call(List<OperationType> operationTypes, String name) {
    try {
      final opType = operationTypes.firstWhere((op) => op.name == name);
      return Right(opType);
    } catch (e) {
      return Left(OperationNotFoundFailure(message: 'نوع العملية "$name" غير موجود'));
    }
  }
}
