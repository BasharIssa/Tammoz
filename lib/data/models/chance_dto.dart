// lib/data/models/chance_dto.dart
import 'package:json_annotation/json_annotation.dart';
import 'package:local_tammoz_chat/data/models/plant_shape_dto.dart';
import 'package:local_tammoz_chat/data/models/plant_type_dto.dart';

part 'chance_dto.g.dart';

@JsonSerializable()
class ChanceDto {
  final int? id;
  final double successRate;
  final PlantShapeDto plantShapeDto; // استبدال معرف الشكل بكائن PlantShapeDto
  final PlantTypeDto plantTypeDto;   // استبدال معرف النوع بكائن PlantTypeDto
  final int quantity;
  final DateTime maturityDate;

  ChanceDto({
    this.id,
    required this.successRate,
    required this.plantShapeDto,
    required this.plantTypeDto,
    required this.quantity,
    required this.maturityDate,
  });

  factory ChanceDto.fromJson(Map<String, dynamic> json) => _$ChanceDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ChanceDtoToJson(this);
}
