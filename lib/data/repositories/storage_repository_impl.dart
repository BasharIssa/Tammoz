// في ملف data/repositories/storage_repository_impl.dart

import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:local_tammoz_chat/domain/repositories/storage_repository.dart';
import '../../domain/entities/storage.dart';
import '../../domain/failures/failures.dart';
import '../../domain/failures/general_failures.dart';
import '../../domain/failures/storage_failures.dart';
import '../local/local_database.dart';
import '../mappers/storage_mapper.dart';
import 'package:drift/drift.dart' as drift;

class StorageRepositoryImpl extends StorageRepository{
  final LocalDatabase db ;
  StorageRepositoryImpl(this.db);

  @override
  Future<Either<StorageFailure, List<Storage>>> getAllStorages() async {
    try {
      final query = db.select(db.storageTable).join([
        drift.innerJoin(db.plantTypesTable, db.plantTypesTable.id.equalsExp(db.storageTable.plantTypeId)),
        drift.innerJoin(db.plantShapesTable, db.plantShapesTable.id.equalsExp(db.storageTable.plantShapeId)),
        drift.leftOuterJoin(db.operationsTable, db.operationsTable.id.equalsExp(db.storageTable.parentOperationId)),
        drift.leftOuterJoin(db.operationTypesTable, db.operationTypesTable.id.equalsExp(db.operationsTable.operationTypeId)),
      ]);

      final rows = await query.get();

      final storages = rows.map((row) {
        final storageData = row.readTable(db.storageTable);
        final typeData = row.readTable(db.plantTypesTable);
        final shapeData = row.readTable(db.plantShapesTable);
        final operationData = row.readTableOrNull(db.operationsTable);
        final operationTypeData = row.readTableOrNull(db.operationTypesTable);

        return StorageMapper.toEntity(
          StorageMapper.fromTableData(
            data: storageData,
            plantTypeName: typeData.name,
            plantShapeName: shapeData.name,
            parentOperationDate: operationData?.date ,
            parentOperationName: operationTypeData?.name ,
          ),
        );
      }).toList();

      return Right(storages);
    } catch (e, st) {
      return Left(StorageFailure(message: 'فشل في جلب بيانات المخزن', stackTrace: st));
    }
  }


  @override
  Future<Either<Failure, Storage>> getStorageById(int id) async {
    try {
      final query = db.select(db.storageTable).join([
        innerJoin(db.plantTypesTable, db.plantTypesTable.id.equalsExp(db.storageTable.plantTypeId)),
        innerJoin(db.plantShapesTable, db.plantShapesTable.id.equalsExp(db.storageTable.plantShapeId)),
        leftOuterJoin(db.operationsTable, db.operationsTable.id.equalsExp(db.storageTable.parentOperationId)),
        leftOuterJoin(db.operationTypesTable, db.operationTypesTable.id.equalsExp(db.operationsTable.operationTypeId)),
      ])
        ..where(db.storageTable.id.equals(id));

      final row = await query.getSingleOrNull();
      if (row == null) {
        return Left(StorageNotFoundFailure());
      }

      final storageData = row.readTable(db.storageTable);
      final plantType = row.readTable(db.plantTypesTable);
      final plantShape = row.readTable(db.plantShapesTable);
      final operation = row.readTableOrNull(db.operationsTable);
      final operationType = row.readTableOrNull(db.operationTypesTable);

      final dto = StorageMapper.fromTableData(
          data: storageData,
          plantTypeName: plantType.name,
          plantShapeName: plantShape.name,
          parentOperationDate: operation?.date,
          parentOperationName: operationType?.name,
      );

      return Right(StorageMapper.toEntity(dto));
    } catch (e, stackTrace) {
      return Left(DatabaseFailure(
        message: 'فشل في جلب عنصر المخزن: ${e.toString()}',
        stackTrace: stackTrace,
      ));
    }
  }


  @override
  Future<Either<Failure, int>> addStorage(Storage storage) async {
    try {
      if (storage.plantType.isEmpty) {
        return Left(StorageInvalidDataFailure(message: 'نوع النبات مطلوب'));
      }
      if (storage.quantity <= 0) {
        return Left(StorageInvalidDataFailure(message: 'الكمية يجب أن تكون أكبر من الصفر'));
      }
      final typeIdResult = await _getPlantTypeIdByName(storage.plantType);
      final shapeIdResult = await _getPlantShapeIdByName(storage.plantShape);

      final parentOperationId = await _getParentOperationId(
        storage.parentOperationName,
        storage.parentOperationDate,
      );


      return typeIdResult.fold(
            (failure) => Left(failure),
            (plantTypeId) => shapeIdResult.fold(
              (failure) => Left(failure),
              (plantShapeId)  async {
            final dto = StorageMapper.toDto(
              storage,
              plantTypeId: plantTypeId,
              plantShapeId: plantShapeId,
              parentOperationId: parentOperationId,
              parentOperationDate: storage.parentOperationDate,
              parentOperationName: storage.parentOperationName,
            );

            final companion = StorageMapper.toTableCompanion(dto);

            final id = await db.into(db.storageTable).insert(companion);
            return Right(id);
          },
        ),

      );
    } catch (e, stackTrace) {
      return Left(DatabaseFailure(
        message: 'فشل في إضافة عنصر المخزن: ${e.toString()}',
        stackTrace: stackTrace,
      ));
    }
  }


  @override
  Future<Either<Failure, Unit>> updateStorage(Storage storage) async {
    try {
      if (storage.id == null) {
        return Left(StorageInvalidDataFailure(message: 'معرف العنصر غير موجود'));
      }

      final typeIdResult = await _getPlantTypeIdByName(storage.plantType);
      final shapeIdResult = await _getPlantShapeIdByName(storage.plantShape);
      final parentOperationId = await _getParentOperationId(
        storage.parentOperationName,
        storage.parentOperationDate,
      );

      return typeIdResult.fold(
            (failure) => Left(failure),
            (plantTypeId) => shapeIdResult.fold(
              (failure) => Left(failure),
              (plantShapeId)  async {
              final dto = StorageMapper.toDto(
                storage,
                plantTypeId: plantTypeId,
                plantShapeId: plantShapeId,
                parentOperationId: parentOperationId,
                parentOperationDate: storage.parentOperationDate,
                parentOperationName: storage.parentOperationName,
              );

              final companion = StorageMapper.toTableCompanion(dto);

              final updatedRows = await (db.update(db.storageTable)
                ..where((tbl) => tbl.id.equals(storage.id!)))
                  .write(companion);

              if (updatedRows > 0) {
                return Right(unit);
              } else {
                return Left(StorageNotFoundFailure());
              }
            },
          ),

      );
    } catch (e, st) {
      return Left(DatabaseFailure(message: 'فشل في تحديث عنصر المخزن', stackTrace: st));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteStorage(int id) async {
    try {
      final deletedRows = await (db.delete(db.storageTable)
        ..where((tbl) => tbl.id.equals(id)))
          .go();

      if (deletedRows > 0) {
        return Right(unit);
      } else {
        return Left(StorageNotFoundFailure());
      }
    } catch (e, st) {
      return Left(DatabaseFailure(message: 'فشل في حذف عنصر المخزن', stackTrace: st));
    }
  }


  @override
  Future<Either<Failure, Unit>> increaseQuantity({
    required int storageId,
    required int amount,
  }) async {
    try {
      if (amount <= 0) {
        return Left(StorageInvalidDataFailure(message: 'قيمة الزيادة يجب أن تكون موجبة'));
      }

      final storageResult = await getStorageById(storageId);
      return await storageResult.fold(
            (failure) => Left(failure),
            (storage) async {
          final newQuantity = storage.quantity + amount;
          // إنشاء نسخة جديدة يدوياً بدون copyWith
          // tider 18-6 : optimization needed: update db directly
          final updatedStorage = Storage(
            id: storage.id,
            plantType: storage.plantType,
            plantShape: storage.plantShape,
            quantity: newQuantity,
            
            parentOperationDate: storage.parentOperationDate,
            parentOperationName: storage.parentOperationName,
            notes: storage.notes,
          );
          return await updateStorage(updatedStorage);
        },
      );
    } catch (e, stackTrace) {
      return Left(DatabaseFailure(
        message: 'فشل في زيادة الكمية: ${e.toString()}',
        stackTrace: stackTrace,
      ));
    }
  }

  @override
  Future<Either<Failure, Unit>> decreaseQuantity({
    required int storageId,
    required int amount,
  }) async {
    try {
      if (amount <= 0) {
        return Left(StorageInvalidDataFailure(message: 'قيمة النقصان يجب أن تكون موجبة'));
      }

      final storageResult = await getStorageById(storageId);
      return await storageResult.fold(
            (failure) => Left(failure),
            (storage) async {
          if (storage.quantity < amount) {
            return Left(StorageQuantityExceededFailure());
          }
          final newQuantity = storage.quantity - amount;
          // إنشاء نسخة جديدة يدوياً بدون copyWith
          final updatedStorage = Storage(
            id: storage.id,
            plantType: storage.plantType,
            plantShape: storage.plantShape,
            quantity: newQuantity,

            parentOperationDate: storage.parentOperationDate,
            parentOperationName: storage.parentOperationName,
            notes: storage.notes,
          );
          return await updateStorage(updatedStorage);
        },
      );
    } catch (e, stackTrace) {
      return Left(DatabaseFailure(
        message: 'فشل في تقليل الكمية: ${e.toString()}',
        stackTrace: stackTrace,
      ));
    }
  }

  @override
  Future<Either<Failure, List<Storage>>> searchStorages({
    String? plantType,
    String? plantShape,
  }) async {
    try {
      final query = db.select(db.storageTable).join([
        innerJoin(db.plantTypesTable, db.plantTypesTable.id.equalsExp(db.storageTable.plantTypeId)),
        innerJoin(db.plantShapesTable, db.plantShapesTable.id.equalsExp(db.storageTable.plantShapeId)),
        drift.leftOuterJoin(db.operationsTable, db.operationsTable.id.equalsExp(db.storageTable.parentOperationId)),
        drift.leftOuterJoin(db.operationTypesTable, db.operationTypesTable.id.equalsExp(db.operationsTable.operationTypeId)),

      ]);
      if (plantType != null) {
        query.where(db.plantTypesTable.name.like('%$plantType%'));
      }

      if (plantShape != null) {
        query.where(db.plantShapesTable.name.like('%$plantShape%'));
      }

      query.orderBy([
        OrderingTerm(expression: db.storageTable.plantTypeId, mode: OrderingMode.asc),
      ]);

      final rows = await query.get();

      final storages = rows.map((row) {
        final storageData = row.readTable(db.storageTable);
        final typeData = row.readTable(db.plantTypesTable);
        final shapeData = row.readTable(db.plantShapesTable);
        final operationData = row.readTableOrNull(db.operationsTable);
        final operationTypeData = row.readTableOrNull(db.operationTypesTable);

        return StorageMapper.toEntity(
          StorageMapper.fromTableData(
            data: storageData,
            plantTypeName: typeData.name,
            plantShapeName: shapeData.name,
            parentOperationDate: operationData?.date,
            parentOperationName: operationTypeData?.name,
          ),
        );
      }).toList();
      return Right(storages);
    } catch (e, stackTrace) {
      return Left(DatabaseFailure(
        message: 'فشل في البحث في المخزن: ${e.toString()}',
        stackTrace: stackTrace,
      ));
    }
  }

  @override
  Future<Either<Failure, bool>> checkQuantityAvailability({
    required int storageId,
    required int requiredQuantity,
  }) async {
    try {
      if (requiredQuantity <= 0) {
        return Left(StorageInvalidDataFailure(message: 'الكمية المطلوبة يجب أن تكون موجبة'));
      }

      final storageResult = await getStorageById(storageId);
      return storageResult.fold(
            (failure) => Left(failure),
            (storage) => Right(storage.quantity >= requiredQuantity),
      );
    } catch (e, stackTrace) {
      return Left(DatabaseFailure(
        message: 'فشل في التحقق من توفر الكمية: ${e.toString()}',
        stackTrace: stackTrace,
      ));
    }
  }
  
  


  // --- دوال مساعدة مع استخدام Either و StorageFailure ---

  Future<Either<StorageFailure, int>> _getPlantTypeIdByName(String typeName) async {
    try {
      final plantType = await (db.select(db.plantTypesTable)
        ..where((tbl) => tbl.name.equals(typeName)))
          .getSingleOrNull();

      if (plantType != null) {
        return Right(plantType.id);
      } else {
        return Left(StorageInvalidDataFailure(message: 'نوع النبات غير موجود: $typeName'));
      }
    } catch (e, st) {
      return Left(StorageFailure(message: 'فشل في جلب نوع النبات', stackTrace: st));
    }
  }

  Future<Either<StorageFailure, int>> _getPlantShapeIdByName(String shapeName) async {
    try {
      final plantShape = await (db.select(db.plantShapesTable)
        ..where((tbl) => tbl.name.equals(shapeName)))
          .getSingleOrNull();

      if (plantShape != null) {
        return Right(plantShape.id);
      } else {
        return Left(StorageInvalidDataFailure(message: 'شكل النبات غير موجود: $shapeName'));
      }
    } catch (e, st) {
      return Left(StorageFailure(message: 'فشل في جلب شكل النبات', stackTrace: st));
    }
  }
  Future<Either<StorageFailure, int>> _getOperationTypeIdByName(String operationTypeName) async {
    try {
      final operationType = await (db.select(db.operationTypesTable)
        ..where((tbl) => tbl.name.equals(operationTypeName)))
          .getSingleOrNull();

      if (operationType != null) {
        return Right(operationType.id);
      } else {
        return Left(StorageInvalidDataFailure(message: 'نوع العملية غير موجود: $operationTypeName'));
      }
    } catch (e, st) {
      return Left(StorageFailure(message: 'فشل في جلب نوع العملية', stackTrace: st));
    }
  }


  Future<int?> _getParentOperationId(String operationTypeName, DateTime date) async {
    final operationTypeIdResult = await _getOperationTypeIdByName(
        operationTypeName);


    return await operationTypeIdResult.fold(
            (failure) => null,
            (operationTypeId) async {
          try {
            final operation = await (db.select(db.operationsTable)
              ..where((tbl) =>
              tbl.operationTypeId.equals(operationTypeId) &
              tbl.date.equals(date)))
                .getSingleOrNull();

            return operation?.id;
          } catch (e) {
            print('  فشل في جلب العملية الأم   $e  ');
            return null;
          }
        }
    );
  }


  @override
  Future<Either<Failure, int>> getTotalQuantityByType(String plantType) {
    // TODO: implement getTotalQuantityByType
    throw UnimplementedError();
  }

}


