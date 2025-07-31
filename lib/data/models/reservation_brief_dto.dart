// lib/data/dtos/reservation_brief_dto.dart
import 'package:json_annotation/json_annotation.dart';

part 'reservation_brief_dto.g.dart';

@JsonSerializable()
class ReservationBriefDto {
  final int id;
  final String reserverFullName;

  ReservationBriefDto({
    required this.id,
    required this.reserverFullName,
  });

  factory ReservationBriefDto.fromJson(Map<String, dynamic> json) =>
      _$ReservationBriefDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ReservationBriefDtoToJson(this);
}
