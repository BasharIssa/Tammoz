// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chance_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChanceDto _$ChanceDtoFromJson(Map<String, dynamic> json) => ChanceDto(
      id: (json['id'] as num?)?.toInt(),
      successRate: (json['successRate'] as num).toDouble(),
      plantShapeDto:
          PlantShapeDto.fromJson(json['plantShapeDto'] as Map<String, dynamic>),
      plantTypeDto:
          PlantTypeDto.fromJson(json['plantTypeDto'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num).toInt(),
      maturityDate: DateTime.parse(json['maturityDate'] as String),
    );

Map<String, dynamic> _$ChanceDtoToJson(ChanceDto instance) => <String, dynamic>{
      'id': instance.id,
      'successRate': instance.successRate,
      'plantShapeDto': instance.plantShapeDto,
      'plantTypeDto': instance.plantTypeDto,
      'quantity': instance.quantity,
      'maturityDate': instance.maturityDate.toIso8601String(),
    };
