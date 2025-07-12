  // lib/data/mappers/plant_type_mapper.dart
  import 'package:drift/drift.dart';
  import 'package:local_tammoz_chat/data/local/local_database.dart';
  import 'package:local_tammoz_chat/domain/entities/plant_type.dart';

  import '../models/plant_type_dto.dart';

  class PlantTypeMapper {
    // DTO → Entity
    static PlantType toEntity(PlantTypeDto dto) {
      return PlantType(
        id: dto.id,
        name: dto.name,
      );
    }

    // DTO → Companion
    static PlantTypesTableCompanion toCompanion(PlantTypeDto dto) {
      return PlantTypesTableCompanion(
        id: Value.absentIfNull(dto.id),
        name: Value(dto.name),
      );
    }

    // TableData → DTO
    static PlantTypeDto fromTableData(PlantTypesTableData tableData) {
      return PlantTypeDto(
        id: tableData.id,
        name: tableData.name,
      );
    }

    // Entity → DTO
    static PlantTypeDto fromEntity(PlantType entity) {
      return PlantTypeDto(
        id: entity.id,
        name: entity.name,
      );
    }
  }