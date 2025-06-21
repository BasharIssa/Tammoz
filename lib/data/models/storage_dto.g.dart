// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StorageDto _$StorageDtoFromJson(Map<String, dynamic> json) => StorageDto(
      id: (json['id'] as num?)?.toInt(),
      plantTypeId: (json['plantTypeId'] as num).toInt(),
      plantTypeName: json['plantTypeName'] as String,
      plantShapeId: (json['plantShapeId'] as num).toInt(),
      plantShapeName: json['plantShapeName'] as String,
      quantity: (json['quantity'] as num).toInt(),
      parentOperationId: (json['parentOperationId'] as num?)?.toInt(),
      parentOperationDate: json['parentOperationDate'] == null
          ? null
          : DateTime.parse(json['parentOperationDate'] as String),
      parentOperationName: json['parentOperationName'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$StorageDtoToJson(StorageDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'plantTypeId': instance.plantTypeId,
      'plantTypeName': instance.plantTypeName,
      'plantShapeId': instance.plantShapeId,
      'plantShapeName': instance.plantShapeName,
      'quantity': instance.quantity,
      'parentOperationId': instance.parentOperationId,
      'parentOperationDate': instance.parentOperationDate?.toIso8601String(),
      'parentOperationName': instance.parentOperationName,
      'notes': instance.notes,
    };
