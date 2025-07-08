import 'package:json_annotation/json_annotation.dart';
import 'package:local_tammoz_chat/data/models/plant_shape_dto.dart';

import 'plant_type_dto.dart';

part 'reservation_dto.g.dart';
@JsonSerializable()
class ReservationDto {
  final int? id;
  final String fullName;
  final String phone;
  final DateTime reservationDate;
  final DateTime? deliveryDate;
  final PlantTypeDto plantType;
  final PlantShapeDto plantShape;
  final int quantity;
  final double? calculatedTotalAmount; //هذا الحقل حسابي نجلبه من الريبو
  final double? deposit;
  final bool isFullyPaid;
  final bool isDelivered;
  final String? notes;

  ReservationDto({
    this.id,
    required this.fullName,
    required this.phone,
    required this.reservationDate,
    this.deliveryDate,
    required this.plantType,
    required this.plantShape,
    required this.quantity,
    this.calculatedTotalAmount,
    required this.deposit,
    this.isFullyPaid = false,
    this.isDelivered = false,
    this.notes,
  });

  factory ReservationDto.fromJson(Map<String, dynamic> json) => _$ReservationDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ReservationDtoToJson(this);


}
