

import 'package:dartz/dartz.dart';
import 'package:local_tammoz_chat/domain/entities/plant_type.dart';
import 'package:local_tammoz_chat/domain/failures/failures.dart';

abstract class  PlantTypeRerpository {

  Future<Either<Failure, List<PlantType>>> getAllPlantTypes();

  Future<Either<Failure, int>> addPlantType(PlantType plantType);

  Future<Either<Failure, Unit>> deletePlantType(int id);

  Future<Either<Failure, Unit>> updatePlantType(PlantType plantType);
}