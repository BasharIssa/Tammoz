import 'package:dartz/dartz.dart';
import 'package:local_tammoz_chat/domain/entities/plant_shape.dart';
import 'package:local_tammoz_chat/domain/failures/failures.dart';

abstract class PlantShapeRepository {
  Future<Either<Failure, List<PlantShape>>> getAllPlantShapes();
  Future<Either<Failure, PlantShape>> getPlantShapeByName(String shapeName);
  Future<Either<Failure, PlantShape>> addPlantShape(PlantShape plantShape);
  Future<Either<Failure, PlantShape>> updatePlantShape(PlantShape plantShape);
  Future<Either<Failure, void>> deletePlantShape(int id);
}
