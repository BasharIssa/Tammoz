// lib/data/model/reservation_details_dto.dart
import 'package:json_annotation/json_annotation.dart';
import 'package:local_tammoz_chat/data/models/plant_shape_dto.dart';
import 'package:local_tammoz_chat/data/models/plant_type_dto.dart';
import 'reservation_dto.dart';

part 'reservation_details_dto.g.dart';

@JsonSerializable()
class ReservationDetailsDto {
  final int? id;
  final ReservationDto reservationDto;
  final PlantShapeDto plantShapeDto;
  final PlantTypeDto plantTypeDto;
  final int quantity;
  final int status;  // في طبقة دومين نستعمل enum مع دعم من json_serializable

  ReservationDetailsDto({
    this.id,
    required this.reservationDto,
    required this.plantShapeDto,
    required this.plantTypeDto,
    required this.quantity,
    required this.status,
  });

  factory ReservationDetailsDto.fromJson(Map<String, dynamic> json) => _$ReservationDetailsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ReservationDetailsDtoToJson(this);
}
