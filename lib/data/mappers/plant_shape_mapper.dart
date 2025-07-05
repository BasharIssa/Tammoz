import 'package:drift/drift.dart';
import 'package:local_tammoz_chat/data/local/local_database.dart';
import 'package:local_tammoz_chat/data/models/plant_shape_dto.dart';
import 'package:local_tammoz_chat/domain/entities/plant_shape.dart';

class PlantShapeMapper {
  static PlantShape toEntity(PlantShapeDto dto) {
    return PlantShape(
        id: dto.id, name: dto.name, nurseryPeriod: dto.nurseryPeriod);
  }

  static PlantShapesTableCompanion  toCompanion(PlantShapeDto dto) {
    return PlantShapesTableCompanion(
      id: dto.id == null ? const Value.absent() : Value(dto.id!),
      name: Value(dto.name),
      nurseryPeriod: Value(dto.nurseryPeriod),
    );
  }

  static PlantShapeDto fromTableData(PlantShapesTableData tableData){
    return PlantShapeDto(id: tableData.id, name: tableData.name, nurseryPeriod: tableData.nurseryPeriod
    );
  }

  static PlantShapeDto fromEntity(PlantShape entity)
  {
    return PlantShapeDto(id: entity.id, name: entity.name, nurseryPeriod: entity.nurseryPeriod,);
  }
}
