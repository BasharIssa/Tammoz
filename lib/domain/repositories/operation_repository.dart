//lib/domain/repositories/operation_repository.dart

import 'package:dartz/dartz.dart';
import 'package:local_tammoz_chat/domain/failures/failures.dart';

import '../entities/operation.dart';
import '../entities/operation_type.dart';
import '../entities/plant_shape.dart';
import '../entities/plant_type.dart';

abstract class OperationRepository{
  Future<Either<Failure,List<Operation>>> getAllOperations();
  Future<Either<Failure, Operation>> getOperationById(int id);
  Future<Either<Failure, int>> addOperation(Operation operation);
  Future<Either<Failure, Unit>> updateOperation(Operation operation);
  Future<Either<Failure, Unit>> deleteOperation(int id);

  Future<Either<Failure, List<OperationType>>> getAllOperationsTypes();

  Future<Either<Failure,T>> runInTransaction<T> (Future<Either<Failure, T>> Function() action);

}