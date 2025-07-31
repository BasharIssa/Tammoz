// lib/data/models/parent_child_Chance_dto.dart
import 'package:json_annotation/json_annotation.dart';

part 'parent_child_chance_dto.g.dart';

@JsonSerializable()
class ParentChildChanceDto {
  final int parentId;
  final int childId;

  ParentChildChanceDto({
    required this.parentId,
    required this.childId,
  });

  factory ParentChildChanceDto.fromJson(Map<String, dynamic> json) => _$ParentChildChanceDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ParentChildChanceDtoToJson(this);
}
