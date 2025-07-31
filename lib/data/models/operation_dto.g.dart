// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OperationDto _$OperationDtoFromJson(Map<String, dynamic> json) => OperationDto(
      id: (json['id'] as num?)?.toInt(),
      operationTypeDto: OperationTypeDto.fromJson(
          json['operationTypeDto'] as Map<String, dynamic>),
      date: DateTime.parse(json['date'] as String),
      cost: (json['cost'] as num?)?.toDouble() ?? 0.0,
      scheduled: json['scheduled'] as bool? ?? false,
      reservationBriefDto: json['reservationBriefDto'] == null
          ? null
          : ReservationBriefDto.fromJson(
              json['reservationBriefDto'] as Map<String, dynamic>),
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
      'operationTypeDto': instance.operationTypeDto,
      'date': instance.date.toIso8601String(),
      'cost': instance.cost,
      'scheduled': instance.scheduled,
      'reservationBriefDto': instance.reservationBriefDto,
      'notes': instance.notes,
      'quantity': instance.quantity,
      'firstType': instance.firstType,
      'firstShape': instance.firstShape,
      'secondType': instance.secondType,
      'secondShape': instance.secondShape,
    };
