// lib/domain/repositories/storage_repository.dart

import 'package:dartz/dartz.dart';
import '../entities/storage.dart';
import '../failures/failures.dart';

abstract class StorageRepository {
  Future<Either<Failure, List<Storage>>> getAllStorages();

  Future<Either<Failure, Storage>> getStorageById(int id);

  Future<Either<Failure, int>> addStorage(Storage storage);

  Future<Either<Failure, Unit>> updateStorage(Storage storage);

  Future<Either<Failure, Unit>> deleteStorage(int id);

  Future<Either<Failure, int>> getTotalQuantityByType(String type);

  Future<Either<Failure, Unit>> increaseQuantity({
    required int storageId,
    required int amount,
  });

  Future<Either<Failure, Unit>> decreaseQuantity({
    required int storageId,
    required int amount,
  });

  Future<Either<Failure, List<Storage>>> searchStorages({
    String? plantTypeName,
    String? plantShapeName,
  });

  Future<Either<Failure, bool>> checkQuantityAvailability({
    required int storageId,
    required int requiredQuantity,
  });
}