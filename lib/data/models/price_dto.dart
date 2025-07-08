import 'package:json_annotation/json_annotation.dart';
import 'package:local_tammoz_chat/domain/entities/plant_shape.dart';
import 'package:local_tammoz_chat/domain/entities/plant_type.dart';

import 'plant_shape_dto.dart';
import 'plant_type_dto.dart';

part 'price_dto.g.dart';

@JsonSerializable()
class PriceDto {
  final int? id;
  final PlantTypeDto plantTypeDto;
  final PlantShapeDto plantShapeDto;
  final double price;

  PriceDto({
    this.id,
    required this.plantTypeDto,
    required this.plantShapeDto,
    required this.price,
  });

  // من json
  factory PriceDto.fromJson(Map<String, dynamic> json) => _$PriceDtoFromJson(json);

  // إلى json
  Map<String, dynamic> toJson() => _$PriceDtoToJson(this);
}
