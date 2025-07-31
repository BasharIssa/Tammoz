// file: data/repositories/storage_repository_impl.dart

import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart' as drift;
import 'package:local_tammoz_chat/data/local/local_database.dart';
import 'package:local_tammoz_chat/domain/repositories/storage_repository.dart';
import '../../domain/entities/storage.dart';
import '../../domain/failures/failures.dart';
import '../../domain/failures/general_failures.dart';
import '../../domain/failures/storage_failures.dart';
import '../mappers/storage_mapper.dart';

class StorageRepositoryImpl extends StorageRepository {
  final LocalDatabase db;

  StorageRepositoryImpl(this.db);

  @override
  Future<Either<StorageFailure, List<Storage>>> getAllStorages() async {
    try {
      final query = db.select(db.storageTable).join([
        drift.innerJoin(
            db.plantTypesTable,
            db.plantTypesTable.id.equalsExp(db.storageTable.plantTypeId)),
        drift.innerJoin(
            db.plantShapesTable,
            db.plantShapesTable.id.equalsExp(db.storageTable.plantShapeId)),
        drift.leftOuterJoin(
            db.operationsTable,
            db.operationsTable.id.equalsExp(db.storageTable.parentOperationId)),
        drift.leftOuterJoin(
            db.storageReservationTable,
            db.storageReservationTable.storageId.equalsExp(db.storageTable.id)),
        drift.leftOuterJoin(
            db.reservationsTable,
            db.reservationsTable.id.equalsExp(
                db.storageReservationTable.reservationId)),
      ]);

      query.orderBy([
        drift.OrderingTerm(
          expression: db.operationsTable.date,
          mode: drift.OrderingMode.desc,
        ),
      ]);

      final rows = await query.get();

// تأكد من معالجة التكرار إن وجد (حسب العلاقة)
      final storages = <Storage>[];
      final uniqueStorageIds = <int>{};

      for (final row in rows) {
        final storageData = row.readTable(db.storageTable);

        // تجنب التكرار (مثال على فحص المعرف)
        if (uniqueStorageIds.contains(storageData.id)) continue;
        uniqueStorageIds.add(storageData.id);

        final plantTypeData = row.readTable(db.plantTypesTable);
        final plantShapeData = row.readTable(db.plantShapesTable);
        final operationData = row.readTableOrNull(db.operationsTable);
        final reservationData = row.readTableOrNull(db.reservationsTable);

        final dto = storageData.toDto(
          plantTypeData,
          plantShapeData,
          operationData,
          reservationData,
        );

        storages.add(dto.toEntity());
      }

      return Right(storages);

    } catch (e, st) {
      return Left(StorageFailure(
        message: 'فشل في جلب بيانات المخزن',
        stackTrace: st,
      ));
    }
  }

  @override
  Future<Either<Failure, Storage>> getStorageById(int id) async {
    try {
      final query = db.select(db.storageTable).join([
        drift.innerJoin(
            db.plantTypesTable,
            db.plantTypesTable.id.equalsExp(db.storageTable.plantTypeId)),
        drift.innerJoin(
            db.plantShapesTable,
            db.plantShapesTable.id.equalsExp(db.storageTable.plantShapeId)),
        drift.leftOuterJoin(
            db.operationsTable,
            db.operationsTable.id.equalsExp(db.storageTable.parentOperationId)),
        drift.leftOuterJoin(
            db.storageReservationTable,
            db.storageReservationTable.storageId.equalsExp(db.storageTable.id)),
        drift.leftOuterJoin(
            db.reservationsTable,
            db.reservationsTable.id.equalsExp(
                db.storageReservationTable.reservationId)),
      ])
        ..where(db.storageTable.id.equals(id));

      final row = await query.getSingleOrNull();

      if (row == null) {
        return Left(StorageNotFoundFailure());
      }

      final storageData = row.readTable(db.storageTable);
      final plantTypeData = row.readTable(db.plantTypesTable);
      final plantShapeData = row.readTable(db.plantShapesTable);
      final operationData = row.readTableOrNull(db.operationsTable);
      final reservationData = row.readTableOrNull(db.reservationsTable);

      final dto = storageData.toDto(
        plantTypeData,
        plantShapeData,
        operationData,
        reservationData,
      );

      return Right(dto.toEntity());
    } catch (e, st) {
      return Left(DatabaseFailure(
        message: 'فشل في جلب عنصر المخزن: ${e.toString()}',
        stackTrace: st,
      ));
    }
  }

  @override
  Future<Either<Failure, int>> addStorage(Storage storage) async {
    try {
      if (storage.quantity <= 0) {
        return Left(StorageFailure(
          message: 'الكمية يجب أن تكون أكبر من الصفر',
        ));
      }

      // if(storage.reservation != null){
      //   final storageReservationCompanion = StorageReservationTableCompanion(
      //     quantity:drift.Value(reservationRepository.getQuantityByTypeShapeAndDeliveryDate()),
      //     reservationId: drift.Value(storage.reservation!.id),
      //     storageId: drift.Value(storage.id!),
      //   );
      //
      //   //to do
      //   //continue to insert row in storageReservationTable
      // }

            final dto = storage.toDto();            
            final companion = dto.toTableCompanion();
            final id = await db.into(db.storageTable).insert(companion);
            return Right(id);

    } catch (e, st) {
      return Left(DatabaseFailure(
        message: 'فشل في إضافة عنصر المخزن: ${e.toString()}',
        stackTrace: st,
      ));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateStorage(Storage storage) async {
    try {
      if (storage.id == null) {
        return Left(StorageFailure(message: 'معرف العنصر غير موجود'));
      }


            final dto = storage.toDto();

            final companion = dto.toTableCompanion();

            final updatedRows = await (db.update(db.storageTable)
              ..where((tbl) => tbl.id.equals(storage.id!)))
                .write(companion);

            if (updatedRows > 0) {
              return Right(unit);
            } else {
              return Left(StorageNotFoundFailure());
            }

    } catch (e, st) {
      return Left(DatabaseFailure(
        message: 'فشل في تحديث عنصر المخزن',
        stackTrace: st,
      ));
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
      return Left(DatabaseFailure(
        message: 'فشل في حذف عنصر المخزن',
        stackTrace: st,
      ));
    }
  }

  // زيادة الكمية (تعامل مع Entity مباشرة)
  @override
  Future<Either<Failure, Unit>> increaseQuantity({
    required int storageId,
    required int amount,
  }) async {
    try {
      if (amount <= 0) {
        return Left(StorageFailure(message: 'قيمة الزيادة يجب أن تكون موجبة'));
      }

      final storageResult = await getStorageById(storageId);

      return await storageResult.fold(
            (failure) => Left(failure),
            (storage) async {
          final newQuantity = storage.quantity + amount;

          final query = db.update(db.storageTable)..where((s) => s.id.equals(storageId));

          final affectedRows = await query.write(
            StorageTableCompanion(quantity:drift.Value(newQuantity)),
          );

          if (affectedRows == 1) {
            return const Right(unit);
          } else {
            return Left(StorageFailure(message: 'فشل في تحديث الكمية'));
          }
        },
      );
    } catch (e, st) {
      return Left(DatabaseFailure(
        message: 'فشل في زيادة الكمية: ${e.toString()}',
        stackTrace: st,
      ));
    }
  }

  // نقصان الكمية (تعامل مع Entity مباشرة)
  @override
  Future<Either<Failure, Unit>> decreaseQuantity({
    required int storageId,
    required int amount,
  }) async {
    try {
      if (amount <= 0) {
        return Left(StorageFailure(message: 'قيمة النقصان يجب أن تكون موجبة'));
      }

      final storageResult = await getStorageById(storageId);

      return await storageResult.fold(
            (failure) => Left(failure),
            (storage) async {
          if (storage.quantity < amount) {
            return Left(StorageQuantityExceededFailure());
          }

          final newQuantity = storage.quantity - amount;

          final query = db.update(db.storageTable)..where((s) => s.id.equals(storageId));

          final affectedRows = await query.write(
            StorageTableCompanion(quantity: drift.Value(newQuantity)),
          );

          if (affectedRows == 1) {
            return const Right(unit);
          } else {
            return Left(StorageFailure(message: 'فشل في تحديث الكمية'));
          }
        },
      );
    } catch (e, st) {
      return Left(DatabaseFailure(
        message: 'فشل في تقليل الكمية: ${e.toString()}',
        stackTrace: st,
      ));
    }
  }

  @override
  Future<Either<Failure, List<Storage>>> searchStorages({
    String? plantTypeName,
    String? plantShapeName,
  }) async {
    try {
      final query = db.select(db.storageTable).join([
        drift.innerJoin(
            db.plantTypesTable,
            db.plantTypesTable.id.equalsExp(db.storageTable.plantTypeId)),
        drift.innerJoin(
            db.plantShapesTable,
            db.plantShapesTable.id.equalsExp(db.storageTable.plantShapeId)),
        drift.leftOuterJoin(
            db.operationsTable,
            db.operationsTable.id.equalsExp(db.storageTable.parentOperationId)),
        drift.leftOuterJoin(
            db.storageReservationTable,
            db.storageReservationTable.storageId.equalsExp(db.storageTable.id)),
        drift.leftOuterJoin(
            db.reservationsTable,
            db.reservationsTable.id.equalsExp(
                db.storageReservationTable.reservationId)),
      ]);

      if (plantTypeName != null) {
        query.where(db.plantTypesTable.name.like('%$plantTypeName%'));
      }
      if (plantShapeName != null) {
        query.where(db.plantShapesTable.name.like('%$plantShapeName%'));
      }

      query.orderBy([
        drift.OrderingTerm(
          expression: db.storageTable.plantTypeId,
          mode: drift.OrderingMode.asc,
        ),
      ]);

      final rows = await query.get();

      final storages = rows.map((row) {
        final storageData = row.readTable(db.storageTable);
        final plantTypeData = row.readTable(db.plantTypesTable);
        final plantShapeData = row.readTable(db.plantShapesTable);
        final operationData = row.readTableOrNull(db.operationsTable);
        final reservationData = row.readTableOrNull(db.reservationsTable);

        final dto = storageData.toDto(
          plantTypeData,
          plantShapeData,
          operationData,
          reservationData,
        );

        return dto.toEntity();
      }).toList();

      return Right(storages);
    } catch (e, st) {
      return Left(DatabaseFailure(
        message: 'فشل في البحث في المخزن: ${e.toString()}',
        stackTrace: st,
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
        return Left(StorageFailure(message: 'الكمية المطلوبة يجب أن تكون موجبة'));
      }

      final storageResult = await getStorageById(storageId);

      return storageResult.fold(
            (failure) => Left(failure),
            (storage) => Right(storage.quantity >= requiredQuantity),
      );
    } catch (e, st) {
      return Left(DatabaseFailure(
        message: 'فشل في التحقق من توفر الكمية: ${e.toString()}',
        stackTrace: st,
      ));
    }
  }

  // دوال مساعدة للحصول على معرفات النوع والشكل

  @override
  Future<Either<Failure, int>> getTotalQuantityByType(String plantType) {
    throw UnimplementedError();
  }



}
