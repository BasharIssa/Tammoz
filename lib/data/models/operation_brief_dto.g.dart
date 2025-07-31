// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation_brief_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OperationBriefDto _$OperationBriefDtoFromJson(Map<String, dynamic> json) =>
    OperationBriefDto(
      id: (json['id'] as num).toInt(),
      operationDate: DateTime.parse(json['operationDate'] as String),
    );

Map<String, dynamic> _$OperationBriefDtoToJson(OperationBriefDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'operationDate': instance.operationDate.toIso8601String(),
    };
