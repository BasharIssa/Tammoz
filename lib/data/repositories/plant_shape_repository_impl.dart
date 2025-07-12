import 'package:dartz/dartz.dart';
import 'package:local_tammoz_chat/data/local/local_database.dart';
import 'package:local_tammoz_chat/data/mappers/plant_shape_mapper.dart';
import 'package:local_tammoz_chat/domain/entities/plant_shape.dart';
import 'package:local_tammoz_chat/domain/failures/failures.dart';
import 'package:local_tammoz_chat/domain/failures/general_failures.dart';
import 'package:local_tammoz_chat/domain/repositories/plant_shape_repository.dart';

class PlantShapeRepositoryImpl implements PlantShapeRepository {
  final LocalDatabase _db;

  PlantShapeRepositoryImpl(this._db);

  @override
  Future<Either<Failure, List<PlantShape>>> getAllPlantShapes() async {
    try {
      final data = await _db.select(_db.plantShapesTable).get();
      final plantShapes = data.map((e) => PlantShapeMapper.toEntity(PlantShapeMapper.fromTableData(e))).toList();
      return Right(plantShapes);
    } catch (e) {
      return Left(DatabaseFailure(message: 'فشل في جلب أشكال النبات.'));
    }
  }

  @override
  Future<Either<Failure, PlantShape>> addPlantShape(PlantShape plantShape) async {
    try {
      final companion = PlantShapeMapper.toCompanion(PlantShapeMapper.fromEntity(plantShape));
      final id = await _db.into(_db.plantShapesTable).insert(companion);
      final inserted = plantShape.copyWith(id: id);
      return Right(inserted);
    } catch (e) {
      return Left(DatabaseFailure(message: 'فشل في إضافة شكل النبات.'));
    }
  }

  @override
  Future<Either<Failure, PlantShape>> updatePlantShape(PlantShape plantShape) async {
    try {
      if (plantShape.id == null) {
        return Left(DatabaseFailure(message: 'معرّف شكل النبات غير موجود للتحديث.'));
      }
      final companion = PlantShapeMapper.toCompanion(PlantShapeMapper.fromEntity(plantShape));
      final rows = await (_db.update(_db.plantShapesTable)
        ..where((tbl) => tbl.id.equals(plantShape.id!)))
          .write(companion);
      if (rows == 0) {
        return Left(DatabaseFailure(message: 'شكل النبات غير موجود.'));
      }
      return Right(plantShape);
    } catch (e) {
      return Left(DatabaseFailure(message: 'فشل في تحديث شكل النبات.'));
    }
  }

  @override
  Future<Either<Failure, void>> deletePlantShape(int id) async {
    try {
      final rowsDeleted = await (_db.delete(_db.plantShapesTable)
        ..where((tbl) => tbl.id.equals(id)))
          .go();
      if (rowsDeleted == 0) {
        return Left(DatabaseFailure(message: 'شكل النبات غير موجود للحذف.'));
      }
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure(message: 'فشل في حذف شكل النبات.'));
    }
  }
}
