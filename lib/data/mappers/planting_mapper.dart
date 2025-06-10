// lib/data/mappers/planting_mapper.dart

import 'package:drift/drift.dart';

import 'package:local_tammoz_chat/domain/entities/planting.dart';
import '../local/local_database.dart';
import '../models/planting_dto.dart';



/// تحويل من DTO إلى كيان الدومين (Entity)
Planting toDomain(PlantingDto dto, String typeName) {
  return Planting(
    id: dto.id,
    typeId: dto.typeId,
    typeName: typeName,
    quantity: dto.quantity,
    date: dto.date,
    initialCost: dto.initialCost,
  );
}

/// تحويل من كيان الدومين إلى DTO
PlantingDto toDto(Planting entity) {
  return PlantingDto(
    id: entity.id ,
    typeId: entity.typeId,
    quantity: entity.quantity,
    date: entity.date,
    initialCost: entity.initialCost,
  );
}


/// تحويل من Drift Data (PlantingTableData) إلى Entity Planting
Planting toEntity(PlantingTableData data, String typeName) {
  return Planting(
    id: data.id,
    typeId: data.typeId,
    typeName: typeName,
    quantity: data.quantity,
    date: data.date,
    initialCost: data.initialCost,
  );
}

/// تحويل من Entity Planting إلى Drift Companion (لإضافة أو تعديل)
PlantingTableCompanion toCompanion(Planting planting) {
  return PlantingTableCompanion(
    id: planting.id != null ? Value(planting.id!) : const Value.absent(),
    typeId: Value(planting.typeId),
    quantity: Value(planting.quantity),
    date: Value(planting.date),
    initialCost: Value(planting.initialCost),
  );
}
