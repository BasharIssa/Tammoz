// lib/data/dtos/operation_brief_dto.dart
import 'package:json_annotation/json_annotation.dart';

part 'operation_brief_dto.g.dart';

@JsonSerializable()
class OperationBriefDto {
  final int id;
  final DateTime operationDate;

  OperationBriefDto({
    required this.id,
    required this.operationDate,
  });

  factory OperationBriefDto.fromJson(Map<String, dynamic> json) =>
      _$OperationBriefDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OperationBriefDtoToJson(this);
}
