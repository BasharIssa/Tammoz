import 'package:json_annotation/json_annotation.dart';
import 'package:local_tammoz_chat/data/models/plant_shape_dto.dart';
import 'package:local_tammoz_chat/data/models/plant_type_dto.dart';
import 'package:local_tammoz_chat/data/models/reservation_brief_dto.dart';
import 'package:local_tammoz_chat/domain/entities/reservation_brief.dart';

import 'operation_type_dto.dart';

part 'operation_dto.g.dart';

@JsonSerializable()
class OperationDto {
  final int? id;
  final OperationTypeDto operationTypeDto;
  final DateTime date;
  final double cost; // ⭐ حقل الكلفة المطلوب
  final bool scheduled;
  final ReservationBriefDto? reservationBriefDto;
  final String? notes;
  final int quantity;
  // العلاقات مع الجداول الأخرى
  final PlantTypeDto firstType;
  final PlantShapeDto firstShape;
  final PlantTypeDto? secondType; // nullable (للتطعيم/قص)
  final PlantShapeDto? secondShape; // nullable

  OperationDto({
    this.id,
    required this.operationTypeDto,
    required this.date,
    this.cost = 0.0,
    this.scheduled = false,
    this.reservationBriefDto,
    this.notes,
    required this.quantity,
    required this.firstType,
    required this.firstShape,
    this.secondType,
    this.secondShape,
  });

  factory OperationDto.fromJson(Map<String, dynamic> json) => _$OperationDtoFromJson(json);
  Map<String, dynamic> toJson() => _$OperationDtoToJson(this);
}