import 'package:freezed_annotation/freezed_annotation.dart';

part 'planting_dto.freezed.dart';
part 'planting_dto.g.dart';

@freezed
class PlantingDto with _$PlantingDto {
  factory PlantingDto({
    required int id,
    required String type,
    required int quantity,
    required DateTime date,
    double? initialCost,
  }) = _PlantingDto;

  factory PlantingDto.fromJson(Map<String, dynamic> json) => _$PlantingDtoFromJson(json);
}
