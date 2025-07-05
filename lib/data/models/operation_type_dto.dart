

import 'package:json_annotation/json_annotation.dart';

part 'operation_type_dto.g.dart';

@JsonSerializable()
class OperationTypeDto {
  final int? id;
  final String name;
  final double successRatio;

  OperationTypeDto({
    this.id,
    required this.name,
    this.successRatio = 1.0,
  });

  bool get isPersisted => id != null;

  factory OperationTypeDto.fromJson(Map<String, dynamic> json) => _$OperationTypeDtoFromJson(json);
  Map<String, dynamic> toJson() => _$OperationTypeDtoToJson(this);
}