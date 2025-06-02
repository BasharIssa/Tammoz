// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planting_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlantingDto _$PlantingDtoFromJson(Map<String, dynamic> json) => _PlantingDto(
      id: (json['id'] as num).toInt(),
      type: json['type'] as String,
      quantity: (json['quantity'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
      initialCost: (json['initialCost'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PlantingDtoToJson(_PlantingDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'quantity': instance.quantity,
      'date': instance.date.toIso8601String(),
      'initialCost': instance.initialCost,
    };
