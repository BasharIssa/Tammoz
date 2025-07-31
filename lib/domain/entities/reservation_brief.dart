// lib/domain/entities/reservation_brief.dart
import 'package:equatable/equatable.dart';

class ReservationBrief extends Equatable {
  final int id;
  final String reserverFullName;

  const ReservationBrief({
    required this.id,
    required this.reserverFullName,
  });

  @override
  List<Object?> get props => [id, reserverFullName];
}
