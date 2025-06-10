// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planting_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlantingDto _$PlantingDtoFromJson(Map<String, dynamic> json) => PlantingDto(
      id: (json['id'] as num?)?.toInt(),
      typeId: (json['typeId'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
      initialCost: (json['initialCost'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PlantingDtoToJson(PlantingDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'typeId': instance.typeId,
      'quantity': instance.quantity,
      'date': instance.date.toIso8601String(),
      'initialCost': instance.initialCost,
    };
