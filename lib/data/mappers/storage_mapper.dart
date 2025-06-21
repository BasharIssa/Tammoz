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
    );
  }

  // تحويل من DTO إلى Entity
  static Storage toEntity(StorageDto dto) {
    return Storage(
      id: dto.id,
      plantType: dto.plantTypeName,
      plantShape: dto.plantShapeName,
      quantity: dto.quantity,
      parentOperationDate: dto.parentOperationDate?? DateTime(1989),
      parentOperationName: dto.parentOperationName?? '',
      notes: dto.notes,
    );
  }

  // تحويل من Entity إلى DTO
  static StorageDto toDto(Storage entity, {
    required int plantTypeId,
    required int plantShapeId,
    int? parentOperationId,
    DateTime? parentOperationDate,
    String? parentOperationName,
  }) {
    return StorageDto(
      id: entity.id,
      plantTypeId: plantTypeId,
      plantTypeName: entity.plantType,
      plantShapeId: plantShapeId,
      plantShapeName: entity.plantShape,
      quantity: entity.quantity,
      parentOperationId: parentOperationId,
      parentOperationDate: parentOperationDate,
      parentOperationName: parentOperationName,
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
      notes: dto.notes != null ? Value(dto.notes!) : const Value.absent(),
    );
  }
}
