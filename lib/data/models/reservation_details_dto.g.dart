// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationDetailsDto _$ReservationDetailsDtoFromJson(
        Map<String, dynamic> json) =>
    ReservationDetailsDto(
      id: (json['id'] as num?)?.toInt(),
      reservationDto: ReservationDto.fromJson(
          json['reservationDto'] as Map<String, dynamic>),
      plantShapeDto:
          PlantShapeDto.fromJson(json['plantShapeDto'] as Map<String, dynamic>),
      plantTypeDto:
          PlantTypeDto.fromJson(json['plantTypeDto'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num).toInt(),
      status: (json['status'] as num).toInt(),
    );

Map<String, dynamic> _$ReservationDetailsDtoToJson(
        ReservationDetailsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reservationDto': instance.reservationDto,
      'plantShapeDto': instance.plantShapeDto,
      'plantTypeDto': instance.plantTypeDto,
      'quantity': instance.quantity,
      'status': instance.status,
    };
