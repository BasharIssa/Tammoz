import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:local_tammoz_chat/core/injection/service_locator.dart';
import 'package:local_tammoz_chat/data/mappers/operation_mapper.dart';
import 'package:local_tammoz_chat/data/mappers/operation_type_mapper.dart';
import 'package:local_tammoz_chat/domain/repositories/operation_repository.dart';

import '../../domain/entities/operation.dart';
import '../../domain/entities/operation_type.dart';
import '../../domain/failures/failures.dart';
import '../../domain/failures/operation_failures.dart';
import '../local/local_database.dart';
import '../mappers/plant_shape_mapper.dart';
import '../mappers/plant_type_mapper.dart';

class OperationRepositoryImpl implements OperationRepository {
  final LocalDatabase _db = getIt<LocalDatabase>();


  @override
  Future<Either<Failure, List<Operation>>> getAllOperations() async {
    try {
      final secondType = _db.plantTypesTable.createAlias('secondType');
      final secondShape = _db.plantShapesTable.createAlias('secondShape');

      final query = _db.select(_db.operationsTable).join([
        leftOuterJoin(_db.operationTypesTable,
            _db.operationTypesTable.id.equalsExp(_db.operationsTable.operationTypeId)),
        leftOuterJoin(_db.plantTypesTable,
            _db.plantTypesTable.id.equalsExp(_db.operationsTable.firstTypeId)),
        leftOuterJoin(_db.plantShapesTable,
            _db.plantShapesTable.id.equalsExp(_db.operationsTable.firstShapeId)),
        leftOuterJoin(secondType,
            secondType.id.equalsExp(_db.operationsTable.secondTypeId)),
        leftOuterJoin(secondShape,
            secondShape.id.equalsExp(_db.operationsTable.secondShapeId)),

        leftOuterJoin(_db.reservationsTable,
            _db.reservationsTable.id.equalsExp(_db.operationsTable.reservationId)),
      ]);

      final rows = await query.get();

      final operations = rows.map((row) {
        return OperationMapper.toEntity( OperationMapper.fromTableData(
          row.readTable(_db.operationsTable),
          row.readTable(_db.operationTypesTable),
          row.readTable(_db.plantTypesTable),
          row.readTable(_db.plantShapesTable),
          row.readTableOrNull(secondType),
          row.readTableOrNull(secondShape),
          row.readTableOrNull(_db.reservationsTable),
        )
        );
      }).toList();

      return Right(operations);
    } catch (e, st) {
      return Left(OperationDatabaseFailure(message: 'حدث خطأ في قاعدة البيانات: ${e.toString()}', stackTrace: st));
    }
  }



  @override
  Future<Either<Failure, Operation>> getOperationById(int id) async {
    try {
      final secondType = _db.plantTypesTable.createAlias('secondType');
      final secondShape = _db.plantShapesTable.createAlias('secondShape');

      final query = _db.select(_db.operationsTable).join([
        leftOuterJoin(_db.operationTypesTable,
            _db.operationTypesTable.id.equalsExp(_db.operationsTable.operationTypeId)),
        leftOuterJoin(_db.plantTypesTable,
            _db.plantTypesTable.id.equalsExp(_db.operationsTable.firstTypeId)),
        leftOuterJoin(_db.plantShapesTable,
            _db.plantShapesTable.id.equalsExp(_db.operationsTable.firstShapeId)),
        leftOuterJoin(secondType,
            secondType.id.equalsExp(_db.operationsTable.secondTypeId)),
        leftOuterJoin(secondShape,
            secondShape.id.equalsExp(_db.operationsTable.secondShapeId)),
        leftOuterJoin(_db.reservationsTable,
            _db.reservationsTable.id.equalsExp(_db.operationsTable.reservationId)),
      ])
        ..where(_db.operationsTable.id.equals(id));

      final rows = await query.get();

      if (rows.isEmpty) {
        return Left(OperationNotFoundFailure(message: 'لم يتم العثور على العملية بالمعرّف المحدد'));
      }

      final row = rows.first;
      final operation =OperationMapper.toEntity(OperationMapper.fromTableData(
        row.readTable(_db.operationsTable),
        row.readTable(_db.operationTypesTable),
        row.readTable(_db.plantTypesTable),
        row.readTable(_db.plantShapesTable),
        row.readTableOrNull(secondType),
        row.readTableOrNull(secondShape),
        row.readTableOrNull(_db.reservationsTable),
      ));

      return Right(operation);
    } catch (e, st) {
      return Left(OperationDatabaseFailure(message: 'حدث خطأ في قاعدة البيانات: ${e.toString()}', stackTrace: st));
    }
  }

  @override
  Future<Either<Failure, int>> addOperation(Operation operation) async {
    try {
      final companion = OperationMapper.toCompanion(OperationMapper.fromEntity(operation));
      final id = await _db.into(_db.operationsTable).insert(companion);
      return Right(id);
    } catch (e, st) {
      return Left(OperationDatabaseFailure(message: 'حدث خطأ في قاعدة البيانات: ${e.toString()}', stackTrace: st));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateOperation(Operation operation) async {
    throw(UnimplementedError);
    try {
      if (operation.id == null) {
        return Left(OperationValidationFailure(message: 'معرّف العملية لا يمكن أن يكون فارغًا عند التحديث'));
      }

      final plantTypeIdsToCheck = <int>[operation.firstType.id!];
      if (operation.secondType?.id != null) {
        plantTypeIdsToCheck.add(operation.secondType!.id!);
      }

      final countQuery = _db.selectOnly(_db.plantTypesTable)
        ..addColumns([_db.plantTypesTable.id.count()])
        ..where(_db.plantTypesTable.id.isIn(plantTypeIdsToCheck));

      final countResult = await countQuery.getSingle();
      final existingCount = countResult.read(_db.plantTypesTable.id.count());

      if (existingCount != plantTypeIdsToCheck.length) {
        return Left(OperationValidationFailure(message: 'نوع أو أنواع النبات غير موجودة في النظام'));
      }

      final companion = OperationMapper.toCompanion(OperationMapper.fromEntity(operation)).copyWith(id: Value(operation.id!));
      final updatedCount = await (_db.update(_db.operationsTable)
        ..where((tbl) => tbl.id.equals(operation.id!)))
          .write(companion);

      if (updatedCount == 0) {
        return Left(OperationNotFoundFailure(message: 'لم يتم العثور على العملية بالمعرّف المحدد'));
      }

      return const Right(unit);
    } catch (e, st) {
      return Left(OperationDatabaseFailure(message: 'حدث خطأ في قاعدة البيانات: ${e.toString()}', stackTrace: st));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteOperation(int id) async {
    try {
      final deletedCount = await (_db.delete(_db.operationsTable)..where((tbl) => tbl.id.equals(id))).go();
      if (deletedCount == 0) {
        return Left(OperationNotFoundFailure(message: 'لم يتم العثور على العملية بالمعرّف المحدد'));
      }
      return const Right(unit);
    } catch (e, st) {
      return Left(OperationDatabaseFailure(message: 'حدث خطأ في قاعدة البيانات: ${e.toString()}', stackTrace: st));
    }
  }

  @override
  Future<Either<Failure, List<OperationType>>> getAllOperationsTypes() async {
    try {
      final rows = await _db.select(_db.operationTypesTable).get();
      final operationTypes =  rows.map(
              (row){
                return OperationTypeMapper.toEntity(OperationTypeMapper.fromTableData(row));
              }).toList();
      return Right(operationTypes);
    } catch (e, st) {
      return Left(OperationDatabaseFailure(message: 'حدث خطأ في قاعدة البيانات: ${e.toString()}', stackTrace: st));
    }
  }

  @override
  Future<Either<Failure, T>> runInTransaction<T>(Future<Either<Failure, T>> Function() action) async {
    try {
      return await _db.transaction(() async {
        final result = await action();
        return result.fold(
              (failure) => throw Exception(failure.message), // رمي استثناء لإجبار rollback
              (value) => Right(value),
        );
      });
    } catch (e) {
      return Left(OperationDatabaseFailure(message: e.toString()));
    }
  }


}
