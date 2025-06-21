import 'package:json_annotation/json_annotation.dart';

part 'storage_dto.g.dart';

@JsonSerializable()
class StorageDto {
  final int? id;
  final int plantTypeId;
  final String plantTypeName;
  final int plantShapeId;
  final String plantShapeName;
  final int quantity;
  final int? parentOperationId;
  final DateTime? parentOperationDate;
  final String? parentOperationName;
  final String? notes;

  StorageDto({
    this.id,
    required this.plantTypeId,
    required this.plantTypeName,
    required this.plantShapeId,
    required this.plantShapeName,
    required this.quantity,
    this.parentOperationId,
    this.parentOperationDate,
    this.parentOperationName,
    this.notes,
  });

  // Convert from JSON
  factory StorageDto.fromJson(Map<String, dynamic> json) =>
      _$StorageDtoFromJson(json);

  // Convert to JSON
  Map<String, dynamic> toJson() => _$StorageDtoToJson(this);


}