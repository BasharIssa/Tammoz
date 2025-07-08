// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceDto _$PriceDtoFromJson(Map<String, dynamic> json) => PriceDto(
      id: (json['id'] as num?)?.toInt(),
      plantTypeDto:
          PlantTypeDto.fromJson(json['plantTypeDto'] as Map<String, dynamic>),
      plantShapeDto:
          PlantShapeDto.fromJson(json['plantShapeDto'] as Map<String, dynamic>),
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$PriceDtoToJson(PriceDto instance) => <String, dynamic>{
      'id': instance.id,
      'plantTypeDto': instance.plantTypeDto,
      'plantShapeDto': instance.plantShapeDto,
      'price': instance.price,
    };
