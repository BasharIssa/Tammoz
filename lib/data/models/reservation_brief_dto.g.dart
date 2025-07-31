// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_brief_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationBriefDto _$ReservationBriefDtoFromJson(Map<String, dynamic> json) =>
    ReservationBriefDto(
      id: (json['id'] as num).toInt(),
      reserverFullName: json['reserverFullName'] as String,
    );

Map<String, dynamic> _$ReservationBriefDtoToJson(
        ReservationBriefDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reserverFullName': instance.reserverFullName,
    };
