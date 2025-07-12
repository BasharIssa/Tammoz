import 'package:dartz/dartz.dart';
import 'package:local_tammoz_chat/data/local/local_database.dart';
import 'package:local_tammoz_chat/domain/entities/plant_type.dart';
import 'package:local_tammoz_chat/domain/failures/failures.dart';
import 'package:local_tammoz_chat/domain/failures/general_failures.dart';
import 'package:local_tammoz_chat/domain/repositories/plant_type_repository.dart';
import 'package:local_tammoz_chat/data/mappers/plant_type_mapper.dart';

class PlantTypeRepositoryImpl implements PlantTypeRerpository {
  final LocalDatabase _db;

  PlantTypeRepositoryImpl(this._db);

  @override
  Future<Either<Failure, List<PlantType>>> getAllPlantTypes() async {
    try {
      final data = await _db.select(_db.plantTypesTable).get();
      final plantTypes = data.map((e) => PlantTypeMapper.toEntity(PlantTypeMapper.fromTableData(e))).toList();
      return Right(plantTypes);
    } catch (e) {
      return Left(DatabaseFailure(message: 'فشل في جلب أنواع النبات.'));
    }
  }

  @override
  Future<Either<Failure, int>> addPlantType(PlantType plantType) async {
    try {
      final dto = PlantTypeMapper.fromEntity(plantType);
      final companion = PlantTypeMapper.toCompanion(dto);
      final id = await _db.into(_db.plantTypesTable).insert(companion);
      return Right(id);
    } catch (e) {
      return Left(DatabaseFailure(message: 'فشل في إضافة نوع النبات.'));
    }
  }

  @override
  Future<Either<Failure, Unit>> deletePlantType(int id) async {
    try {
      final rowsDeleted = await (_db.delete(_db.plantTypesTable)
        ..where((tbl) => tbl.id.equals(id)))
          .go();
      if (rowsDeleted == 0) {
        return Left(DatabaseFailure(message: 'نوع النبات غير موجود للحذف.'));
      }
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(message: 'فشل في حذف نوع النبات.'));
    }
  }

  @override
  Future<Either<Failure, Unit>> updatePlantType(PlantType plantType) async {
    try {
      if (plantType.id == null) {
        return Left(DatabaseFailure(message: 'معرّف نوع النبات غير موجود للتحديث.'));
      }
      final dto = PlantTypeMapper.fromEntity(plantType);
      final companion = PlantTypeMapper.toCompanion(dto);
      final rowsUpdated = await (_db.update(_db.plantTypesTable)
        ..where((tbl) => tbl.id.equals(plantType.id!)))
          .write(companion);
      if (rowsUpdated == 0) {
        return Left(DatabaseFailure(message: 'نوع النبات غير موجود.'));
      }
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(message: 'فشل في تحديث نوع النبات.'));
    }
  }
}
