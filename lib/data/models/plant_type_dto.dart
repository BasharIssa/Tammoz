import 'package:json_annotation/json_annotation.dart';

part 'plant_type_dto.g.dart';

@JsonSerializable()
class PlantTypeDto {
  final int? id;
  final String name;

  PlantTypeDto({this.id, required this.name});

  factory PlantTypeDto.fromJson(Map<String, dynamic> json) => _$PlantTypeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PlantTypeDtoToJson(this);
}
