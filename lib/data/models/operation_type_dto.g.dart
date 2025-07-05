// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation_type_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OperationTypeDto _$OperationTypeDtoFromJson(Map<String, dynamic> json) =>
    OperationTypeDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      successRatio: (json['successRatio'] as num?)?.toDouble() ?? 1.0,
    );

Map<String, dynamic> _$OperationTypeDtoToJson(OperationTypeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'successRatio': instance.successRatio,
    };
