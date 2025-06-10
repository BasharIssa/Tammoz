// lib/domain/repositories/planting_repository.dart

import '../entities/planting.dart';
import '../entities/plant_type.dart';
abstract class PlantingRepository {

  Future<List<Planting>> getAllPlantings();

  Future<int> addPlanting(Planting planting);

  Future<void> updatePlanting(Planting planting);

  Future<void> deletePlanting(int id);

  Future<List<PlantType>> getAllPlantTypes();

  Future<int> addPlantType(PlantType plantType);
}
