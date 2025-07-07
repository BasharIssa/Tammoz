// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationDto _$ReservationDtoFromJson(Map<String, dynamic> json) =>
    ReservationDto(
      id: (json['id'] as num?)?.toInt(),
      fullName: json['fullName'] as String,
      phone: json['phone'] as String,
      reservationDate: DateTime.parse(json['reservationDate'] as String),
      deliveryDate: json['deliveryDate'] == null
          ? null
          : DateTime.parse(json['deliveryDate'] as String),
      plantType:
          PlantTypeDto.fromJson(json['plantType'] as Map<String, dynamic>),
      plantShape:
          PlantShapeDto.fromJson(json['plantShape'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num).toInt(),
      calculatedTotalAmount: (json['calculatedTotalAmount'] as num).toDouble(),
      deposit: (json['deposit'] as num?)?.toDouble(),
      isFullyPaid: json['isFullyPaid'] as bool? ?? false,
      isDelivered: json['isDelivered'] as bool? ?? false,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$ReservationDtoToJson(ReservationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'phone': instance.phone,
      'reservationDate': instance.reservationDate.toIso8601String(),
      'deliveryDate': instance.deliveryDate?.toIso8601String(),
      'plantType': instance.plantType,
      'plantShape': instance.plantShape,
      'quantity': instance.quantity,
      'calculatedTotalAmount': instance.calculatedTotalAmount,
      'deposit': instance.deposit,
      'isFullyPaid': instance.isFullyPaid,
      'isDelivered': instance.isDelivered,
      'notes': instance.notes,
    };
