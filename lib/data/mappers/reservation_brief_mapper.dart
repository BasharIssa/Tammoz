// lib/data/mappers/reservation_brief_mapper.dart

import 'package:local_tammoz_chat/data/local/local_database.dart';
import 'package:local_tammoz_chat/data/models/reservation_brief_dto.dart';
import 'package:local_tammoz_chat/domain/entities/reservation_brief.dart';

// امتداد لتحويل ReservationBriefDto إلى Entity
extension ReservationBriefDtoExtension on ReservationBriefDto {
  ReservationBrief toEntity() {
    return ReservationBrief(
      id: id,
      reserverFullName: reserverFullName,
    );
  }
}

// امتداد لتحويل Entity ReservationBrief إلى DTO
extension ReservationBriefEntityExtension on ReservationBrief {
  ReservationBriefDto toDto() {
    return ReservationBriefDto(
      id: id,
      reserverFullName: reserverFullName,
    );
  }
}

// امتداد لتحويل بيانات جدول Reservation إلى DTO
extension ReservationsTableDataExtension on ReservationsTableData {
  ReservationBriefDto toDto() {
    return ReservationBriefDto(
      id: id,
      reserverFullName: fullName,
    );
  }
}
