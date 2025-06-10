// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant_type_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlantTypeDto _$PlantTypeDtoFromJson(Map<String, dynamic> json) => PlantTypeDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$PlantTypeDtoToJson(PlantTypeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
