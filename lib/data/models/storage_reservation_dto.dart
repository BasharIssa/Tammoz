// lib/data/models/storage_reservation_dto.dart
import 'package:json_annotation/json_annotation.dart';

part 'storage_reservation_dto.g.dart';

@JsonSerializable()
class StorageReservationDto {
  final int storageId;
  final int reservationId;
  final int quantity;

  StorageReservationDto({
    required this.storageId,
    required this.reservationId,
    required this.quantity,
  });

  factory StorageReservationDto.fromJson(Map<String, dynamic> json) => _$StorageReservationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$StorageReservationDtoToJson(this);
}
