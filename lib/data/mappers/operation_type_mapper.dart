import 'package:drift/drift.dart';
import 'package:local_tammoz_chat/data/local/local_database.dart';
import 'package:local_tammoz_chat/data/local/tables/operation_types.dart';
import 'package:local_tammoz_chat/domain/entities/operation_type.dart';

import '../models/operation_type_dto.dart';

class OperationTypeMapper {
  // DTO → Entity
  static OperationType toEntity(OperationTypeDto dto) {
    return OperationType(
      id: dto.id,
      name: dto.name,
      successRatio: dto.successRatio,
    );
  }

  // DTO → Companion
  static OperationTypesTableCompanion toCompanion(OperationTypeDto dto) {
    return OperationTypesTableCompanion(
      id: Value.absentIfNull(dto.id),
      name: Value(dto.name),
      successRatio: Value(dto.successRatio),
    );
  }

  // TableData → DTO
  static OperationTypeDto fromTableData(OperationTypesTableData tableData) {
    return OperationTypeDto(
      id: tableData.id,
      name: tableData.name,
      successRatio: tableData.successRatio,
    );
  }

  // Entity → DTO
  static OperationTypeDto fromEntity(OperationType entity) {
    return OperationTypeDto(
      id: entity.id,
      name: entity.name,
      successRatio: entity.successRatio,
    );
  }
}