// lib/domain/entities/storage.dart

import 'package:equatable/equatable.dart';
import 'package:local_tammoz_chat/domain/entities/plant_shape.dart';
import 'package:local_tammoz_chat/domain/entities/plant_type.dart';
import 'operation_brief.dart';
import 'reservation_brief.dart';

class Storage extends Equatable {
  final int? id;
  final PlantType plantType;
  final PlantShape plantShape;
  final int quantity;
  final OperationBrief parentOperation;
  final ReservationBrief? reservation;
  final bool isScheduled;
  final String? notes;

  const Storage({
    this.id,
    required this.plantType,
    required this.plantShape,
    required this.quantity,
    required this.parentOperation,
    this.reservation,
    required this.isScheduled,
    this.notes,
  });

  Storage copyWith({
    int? id,
    PlantType? plantType,
    PlantShape? plantShape,
    int? quantity,
    OperationBrief? parentOperation,
    ReservationBrief? reservation,
    bool? isScheduled,
    String? notes,
  }) {
    return Storage(
      id: id ?? this.id,
      plantType: plantType ?? this.plantType,
      plantShape: plantShape ?? this.plantShape,
      quantity: quantity ?? this.quantity,
      parentOperation: parentOperation ?? this.parentOperation,
      reservation: reservation ?? this.reservation,
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
    parentOperation,
    reservation,
    isScheduled,
    notes,
  ];
}
