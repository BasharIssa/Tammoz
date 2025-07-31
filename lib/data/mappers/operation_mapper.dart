//lib/data/mappers/operation_mapper.dart

import 'package:drift/drift.dart';
import 'package:local_tammoz_chat/data/mappers/plant_shape_mapper.dart';
import 'package:local_tammoz_chat/data/mappers/plant_type_mapper.dart';
import 'package:local_tammoz_chat/data/mappers/reservation_brief_mapper.dart';
import 'package:local_tammoz_chat/domain/entities/operation_brief.dart';

import '../../domain/entities/operation.dart';
import '../local/local_database.dart';
import '../models/operation_dto.dart';
import 'operation_type_mapper.dart';

class OperationMapper {
  // DTO → Entity
  static Operation toEntity(OperationDto dto) {
    return Operation(
      id: dto.id,
      operationType: OperationTypeMapper.toEntity(dto.operationTypeDto),
      date: dto.date,
      cost: dto.cost,
      isScheduled: dto.scheduled,
      reservationBrief: dto.reservationBriefDto?.toEntity(),
      notes: dto.notes,
      firstType: PlantTypeMapper.toEntity(dto.firstType),
      firstShape: PlantShapeMapper.toEntity(dto.firstShape),
      secondType: dto.secondType != null
          ? PlantTypeMapper.toEntity(dto.secondType!)
          : null,
      secondShape: dto.secondShape != null
          ? PlantShapeMapper.toEntity(dto.secondShape!)
          : null,
      quantity: dto.quantity,
    );
  }

  // DTO → Companion
  static OperationsTableCompanion toCompanion(OperationDto dto) {
    return OperationsTableCompanion(
      id: Value.absentIfNull(dto.id),
      operationTypeId: Value(dto.operationTypeDto.id!),
      date: Value(dto.date),
      cost: Value(dto.cost),
      scheduled: Value(dto.scheduled),
      reservationId: Value.absentIfNull(dto.reservationBriefDto?.id),
      notes: Value.absentIfNull(dto.notes),
      firstTypeId: Value(dto.firstType.id!),
      firstShapeId: Value(dto.firstShape.id!),
      secondTypeId: Value.absentIfNull(dto.secondType?.id),
      secondShapeId: Value.absentIfNull(dto.secondShape?.id),
      quantity: Value(dto.quantity),
    );
  }

  // TableData → DTO
  static OperationDto fromTableData(
      OperationsTableData tableData,
      OperationTypesTableData operationTypeData,
      PlantTypesTableData firstPlantTypeData,
      PlantShapesTableData firstPlantShapeData,
      PlantTypesTableData? secondPlantTypeData,
      PlantShapesTableData? secondPlantShapeData,
      ReservationsTableData? reservationData,
      ) {
    return OperationDto(
      id: tableData.id,
      operationTypeDto: OperationTypeMapper.fromTableData(operationTypeData),
      date: tableData.date,
      cost: tableData.cost,
      scheduled: tableData.scheduled,
      reservationBriefDto: reservationData?.toDto(),
      notes: tableData.notes,
      firstType: PlantTypeMapper.fromTableData(firstPlantTypeData),
      firstShape: PlantShapeMapper.fromTableData(firstPlantShapeData),
      secondType: secondPlantTypeData != null
          ? PlantTypeMapper.fromTableData(secondPlantTypeData)
          : null,
      secondShape: secondPlantShapeData != null
          ? PlantShapeMapper.fromTableData(secondPlantShapeData)
          : null,
      quantity: tableData.quantity,
    );
  }

  // Entity → DTO
  static OperationDto fromEntity(Operation entity) {
    return OperationDto(
      id: entity.id,
      operationTypeDto: OperationTypeMapper.fromEntity(entity.operationType),
      date: entity.date,
      cost: entity.cost,
      scheduled: entity.isScheduled,
      reservationBriefDto: entity.reservationBrief?.toDto(),
      notes: entity.notes,
      firstType: PlantTypeMapper.fromEntity(entity.firstType),
      firstShape: PlantShapeMapper.fromEntity(entity.firstShape),
      secondType: entity.secondType != null
          ? PlantTypeMapper.fromEntity(entity.secondType!)
          : null,
      secondShape: entity.secondShape != null
          ? PlantShapeMapper.fromEntity(entity.secondShape!)
          : null,
      quantity: entity.quantity,
    );
  }

  static OperationBrief entityToBriefEntity(Operation entity){
    return OperationBrief(
        id: entity.id == null
            ? throw ArgumentError.notNull("operation.id")
            : entity.id!,
        operationDate: entity.date);
  }
}