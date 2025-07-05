// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OperationDto _$OperationDtoFromJson(Map<String, dynamic> json) => OperationDto(
      id: (json['id'] as num?)?.toInt(),
      operationType: OperationTypeDto.fromJson(
          json['operationType'] as Map<String, dynamic>),
      date: DateTime.parse(json['date'] as String),
      cost: (json['cost'] as num?)?.toDouble() ?? 0.0,
      scheduled: json['scheduled'] as bool? ?? false,
      reservationId: (json['reservationId'] as num?)?.toInt(),
      notes: json['notes'] as String?,
      quantity: (json['quantity'] as num).toInt(),
      firstType:
          PlantTypeDto.fromJson(json['firstType'] as Map<String, dynamic>),
      firstShape:
          PlantShapeDto.fromJson(json['firstShape'] as Map<String, dynamic>),
      secondType: json['secondType'] == null
          ? null
          : PlantTypeDto.fromJson(json['secondType'] as Map<String, dynamic>),
      secondShape: json['secondShape'] == null
          ? null
          : PlantShapeDto.fromJson(json['secondShape'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OperationDtoToJson(OperationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'operationType': instance.operationType,
      'date': instance.date.toIso8601String(),
      'cost': instance.cost,
      'scheduled': instance.scheduled,
      'reservationId': instance.reservationId,
      'notes': instance.notes,
      'quantity': instance.quantity,
      'firstType': instance.firstType,
      'firstShape': instance.firstShape,
      'secondType': instance.secondType,
      'secondShape': instance.secondShape,
    };
