import 'package:json_annotation/json_annotation.dart';

part 'plant_shape_dto.g.dart';
@JsonSerializable()
class PlantShapeDto {
  final int? id;
  final String name;
  final int nurseryPeriod; // فترة الحضانة بالأيام

  PlantShapeDto({
    this.id,
    required this.name,
    required this.nurseryPeriod,
  });

  bool get isPersisted => id != null;

  factory PlantShapeDto.fromJson(Map<String, dynamic> json) => _$PlantShapeDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PlantShapeDtoToJson(this);
}