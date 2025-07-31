// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_reservation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StorageReservationDto _$StorageReservationDtoFromJson(
        Map<String, dynamic> json) =>
    StorageReservationDto(
      storageId: (json['storageId'] as num).toInt(),
      reservationId: (json['reservationId'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$StorageReservationDtoToJson(
        StorageReservationDto instance) =>
    <String, dynamic>{
      'storageId': instance.storageId,
      'reservationId': instance.reservationId,
      'quantity': instance.quantity,
    };
