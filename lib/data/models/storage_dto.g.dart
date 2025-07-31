// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StorageDto _$StorageDtoFromJson(Map<String, dynamic> json) => StorageDto(
      id: (json['id'] as num?)?.toInt(),
      plantTypeDto:
          PlantTypeDto.fromJson(json['plantTypeDto'] as Map<String, dynamic>),
      plantShapeDto:
          PlantShapeDto.fromJson(json['plantShapeDto'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num).toInt(),
      parentOperation: OperationBriefDto.fromJson(
          json['parentOperation'] as Map<String, dynamic>),
      reservation: json['reservation'] == null
          ? null
          : ReservationBriefDto.fromJson(
              json['reservation'] as Map<String, dynamic>),
      isScheduled: json['isScheduled'] as bool,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$StorageDtoToJson(StorageDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'plantTypeDto': instance.plantTypeDto,
      'plantShapeDto': instance.plantShapeDto,
      'quantity': instance.quantity,
      'parentOperation': instance.parentOperation,
      'reservation': instance.reservation,
      'isScheduled': instance.isScheduled,
      'notes': instance.notes,
    };
