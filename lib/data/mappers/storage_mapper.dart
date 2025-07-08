// في ملف data/mappers/storage_mapper.dart

import 'package:drift/drift.dart';

import '../../domain/entities/storage.dart';
import '../local/local_database.dart';
import '../models/storage_dto.dart';


class StorageMapper {
  // تحويل من TableData إلى DTO
  static StorageDto fromTableData({
    required StorageTableData data,
    required String plantTypeName,
    required String plantShapeName,
    DateTime? parentOperationDate,
    String? parentOperationName,
    String? reserverFullName,
  }) {
    return StorageDto(
      id: data.id,
      plantTypeId: data.plantTypeId,
      plantTypeName: plantTypeName,
      plantShapeId: data.plantShapeId,
      plantShapeName: plantShapeName,
      quantity: data.quantity,
      parentOperationId: data.parentOperationId ?? 0,
      parentOperationDate: parentOperationDate,
      parentOperationName: parentOperationName,
      notes: data.notes,
      reservationId: data.reservationId,
      reserverFullName: reserverFullName,
      isScheduled: data.isScheduled,
    );
  }

  // تحويل من DTO إلى Entity
  static Storage toEntity(StorageDto dto) {
    return Storage(
      id: dto.id,
      plantType: dto.plantTypeName,
      plantShape: dto.plantShapeName,
      quantity: dto.quantity,
      parentOperationId: dto.parentOperationId!,
      parentOperationDate: dto.parentOperationDate?? DateTime(1989),
      parentOperationName: dto.parentOperationName?? '',
      notes: dto.notes,
      reservationId: dto.reservationId,
      reserverFullName: dto.reserverFullName,
      isScheduled: dto.isScheduled,
    );
  }

  // تحويل من Entity إلى DTO
  static StorageDto fromEntity(
      Storage entity, {
    required int plantTypeId,
    required int plantShapeId,
  }) {
    return StorageDto(
      id: entity.id,
      plantTypeId: plantTypeId,
      plantTypeName: entity.plantType,
      plantShapeId: plantShapeId,
      plantShapeName: entity.plantShape,
      quantity: entity.quantity,
      parentOperationId: entity.parentOperationId,
      parentOperationDate: entity.parentOperationDate,
      parentOperationName: entity.parentOperationName,
      reservationId: entity.reservationId,
      reserverFullName: entity.reserverFullName,
      isScheduled: entity.isScheduled,
      notes: entity.notes,
    );
  }

  // تحويل من DTO إلى TableCompanion (لإدخال أو تحديث في Drift)
  static StorageTableCompanion toTableCompanion(StorageDto dto) {
    return StorageTableCompanion(
      id: dto.id != null ? Value(dto.id!) : const Value.absent(),
      plantTypeId: Value(dto.plantTypeId),
      plantShapeId: Value(dto.plantShapeId),
      quantity: Value(dto.quantity),
      parentOperationId: dto.parentOperationId != 0 ? Value(dto.parentOperationId) : const Value.absent(),
      reservationId: Value(dto.reservationId) ,
      isScheduled: Value(dto.isScheduled),
      notes: dto.notes != null ? Value(dto.notes!) : const Value.absent(),
    );
  }
}
