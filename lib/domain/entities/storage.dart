// lib/domain/entities/planting.dart
import 'package:equatable/equatable.dart';

class Storage extends Equatable {
  final int? id;
  final String plantType;
  final String plantShape;
  final int quantity;
  final int parentOperationId;
  final DateTime parentOperationDate;
  final String parentOperationName;
  final int? reservationId;
  final String? reserverFullName;
  final bool isScheduled;
  final String? notes;

  const Storage({
    this.id,
    required this.plantType,
    required this.plantShape,
    required this.quantity,
    required this.parentOperationId,
    required this.parentOperationName,
    required this.parentOperationDate,
    this.reservationId,
    this.reserverFullName,
    required this.isScheduled,
    this.notes,
  });

  Storage copyWith({
    int? id,
    String? plantType,
    String? plantShape,
    int? quantity,
    int? parentOperationId,
    DateTime? parentOperationDate,
    String? parentOperationName,
    int? reservationId,
    String? reserverFullName,
    bool? isScheduled,
    String? notes,
  }) {
    return Storage(
      id: id ?? this.id,
      plantType: plantType ?? this.plantType,
      plantShape: plantShape ?? this.plantShape,
      quantity: quantity ?? this.quantity,
      parentOperationId: parentOperationId ?? this.parentOperationId,
      parentOperationDate: parentOperationDate ?? this.parentOperationDate,
      parentOperationName: parentOperationName ?? this.parentOperationName,
      reservationId: reservationId ?? this.reservationId,
      reserverFullName: reserverFullName ?? this.reserverFullName,
      isScheduled: isScheduled ?? this.isScheduled,
      notes: notes ?? this.notes,
    );
  }

  @override
  List<Object?> get props => [
    id,
    plantType,
    plantShape,
    quantity,
    parentOperationId,
    parentOperationDate,
    parentOperationName,
    reservationId,
    reserverFullName,
    isScheduled,
    notes,
  ];
}
