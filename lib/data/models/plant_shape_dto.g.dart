// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant_shape_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlantShapeDto _$PlantShapeDtoFromJson(Map<String, dynamic> json) =>
    PlantShapeDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      nurseryPeriod: (json['nurseryPeriod'] as num).toInt(),
    );

Map<String, dynamic> _$PlantShapeDtoToJson(PlantShapeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nurseryPeriod': instance.nurseryPeriod,
    };
