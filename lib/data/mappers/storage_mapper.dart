import 'package:drift/drift.dart';
import 'package:local_tammoz_chat/data/local/local_database.dart';
import 'package:local_tammoz_chat/data/mappers/plant_type_mapper.dart';
import 'package:local_tammoz_chat/data/mappers/plant_shape_mapper.dart';
import 'package:local_tammoz_chat/data/mappers/operation_brief_mapper.dart';
import 'package:local_tammoz_chat/data/mappers/reservation_brief_mapper.dart';
import 'package:local_tammoz_chat/data/models/storage_dto.dart';
import 'package:local_tammoz_chat/domain/entities/storage.dart';

// 1. من StorageDto إلى Entity (Storage)
extension StorageDtoMapper on StorageDto {
  Storage toEntity() {
    return Storage(
      id: id,
      plantType: PlantTypeMapper.toEntity(plantTypeDto),
      plantShape: PlantShapeMapper.toEntity(plantShapeDto),
      quantity: quantity,
      parentOperation: parentOperation.toEntity(),
      reservation: reservation?.toEntity(),
      isScheduled: isScheduled,
      notes: notes,
    );
  }

  // 2. من StorageDto إلى StorageTableCompanion (لإدخال/تحديث في قاعدة البيانات)
  StorageTableCompanion toTableCompanion() {
    return StorageTableCompanion(
      id: id == null ? const Value.absent() : Value(id!),
      plantTypeId: Value(plantTypeDto.id!),
      plantShapeId: Value(plantShapeDto.id!),
      quantity: Value(quantity),
      parentOperationId: Value(parentOperation.id),
      isScheduled: Value(isScheduled),
      notes: Value(notes),
    );
  }
}

// 3. من Entity (Storage) إلى DTO (StorageDto)
extension StorageMapper on Storage {
  StorageDto toDto() {
    return StorageDto(
      id: id,
      plantTypeDto: PlantTypeMapper.fromEntity(plantType),
      plantShapeDto: PlantShapeMapper.fromEntity(plantShape),
      quantity: quantity,
      parentOperation: parentOperation.toDto(),
      reservation: reservation?.toDto(),
      isScheduled: isScheduled,
      notes: notes,
    );
  }
}

// 4. من TableData (قاعدة البيانات) إلى DTO (StorageDto)
extension StorageTableDataMapper on StorageTableData {
  StorageDto toDto(
      PlantTypesTableData plantTypeData,
      PlantShapesTableData plantShapeData,
      OperationsTableData? operationData,
      ReservationsTableData? reservationData,
      ) {
    return StorageDto(
      id: id,
      plantTypeDto: PlantTypeMapper.fromTableData(plantTypeData),
      plantShapeDto: PlantShapeMapper.fromTableData(plantShapeData),
      quantity: quantity,
      parentOperation: operationData == null
          ? throw Exception('ParentOperation data is required')
          : operationData.toDto(),
      reservation: reservationData?.toDto(),
      isScheduled: isScheduled,
      notes: notes,
    );
  }
}
