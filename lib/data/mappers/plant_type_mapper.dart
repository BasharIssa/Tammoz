// lib/data/mappers/plant_type_mapper.dart
import 'package:local_tammoz_chat/domain/entities/plant_type.dart';
import 'package:local_tammoz_chat/data/models/plant_type_dto.dart';

PlantType toDomainPlantType(PlantTypeDto dto) {
  return PlantType(
    id: dto.id,
    name: dto.name,
  );
}

PlantTypeDto toDtoPlantType(PlantType entity) {
  return PlantTypeDto(
    id: entity.id,
    name: entity.name,
  );
}
