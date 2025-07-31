// lib/data/mappers/operation_brief_mapper.dart

import 'package:local_tammoz_chat/data/local/local_database.dart';
import 'package:local_tammoz_chat/data/models/operation_brief_dto.dart';
import 'package:local_tammoz_chat/domain/entities/operation_brief.dart';
import 'package:local_tammoz_chat/data/local/tables/operations.dart'; // مفترض أن هذا حيث تعرف OperationsTableData

// امتداد لتحويل OperationBriefDto إلى Entity
extension OperationBriefDtoExtension on OperationBriefDto {
  OperationBrief toEntity() {
    return OperationBrief(
      id: id,
      operationDate: operationDate,
    );
  }
}

// امتداد لتحويل Entity OperationBrief إلى DTO
extension OperationBriefEntityExtension on OperationBrief {
  OperationBriefDto toDto() {
    return OperationBriefDto(
      id: id,
      operationDate: operationDate,
    );
  }
}

// امتداد لتحويل بيانات الجدول إلى DTO
extension OperationsTableDataExtension on OperationsTableData {
  OperationBriefDto toDto() {
    return OperationBriefDto(
      id: id,
      operationDate: date,
    );
  }
}
