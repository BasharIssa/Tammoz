// package:local_tammoz_chat/data/models/storage_dto.dart

import 'package:json_annotation/json_annotation.dart';

import 'plant_shape_dto.dart';
import 'plant_type_dto.dart';
import 'operation_brief_dto.dart';
import 'reservation_brief_dto.dart';

part 'storage_dto.g.dart';

@JsonSerializable()
class StorageDto {
  final int? id;
  final PlantTypeDto plantTypeDto;
  final PlantShapeDto plantShapeDto;
  final int quantity;
  final OperationBriefDto parentOperation; // العملية المختصرة (تحتوي id و operationDate)
  final ReservationBriefDto? reservation; // الحجز المختصر (اختياري)
  final bool isScheduled;
  final String? notes;

  StorageDto({
    this.id,
    required this.plantTypeDto,
    required this.plantShapeDto,
    required this.quantity,
    required this.parentOperation,
    this.reservation,
    required this.isScheduled,
    this.notes,
  });

  // من JSON إلى StorageDto
  factory StorageDto.fromJson(Map<String, dynamic> json) => _$StorageDtoFromJson(json);

  // من StorageDto إلى JSON
  Map<String, dynamic> toJson() => _$StorageDtoToJson(this);
}
