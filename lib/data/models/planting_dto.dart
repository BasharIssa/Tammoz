// lib/models/planting_dto.dart
import 'package:json_annotation/json_annotation.dart';

part 'planting_dto.g.dart';

@JsonSerializable()
class PlantingDto {
  final int? id;
  final int typeId;
  final int quantity;
  final DateTime date;
  final double? initialCost;

  PlantingDto({
    required this.id,
    required this.typeId,
    required this.quantity,
    required this.date,
    this.initialCost,
  });

  factory PlantingDto.fromJson(Map<String, dynamic> json) => _$PlantingDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PlantingDtoToJson(this);
}
