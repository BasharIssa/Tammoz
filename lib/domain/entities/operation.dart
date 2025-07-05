// domain/entities/operation.dart

import 'package:equatable/equatable.dart';
import 'package:local_tammoz_chat/domain/entities/plant_shape.dart';
import 'package:local_tammoz_chat/domain/entities/plant_type.dart';

import 'operation_type.dart';
// domain/entities/operation.dart
class Operation extends Equatable {
  final int? id;
  final OperationType operationType; // كائن كامل بدل operationTypeId
  final DateTime date;
  final double cost;
  final bool isScheduled;
  final int? reservationId;
  final String? notes;

  // كائنات كاملة بدل IDs
  final PlantType firstType;
  final PlantShape firstShape;
  final PlantType? secondType; // nullable
  final PlantShape? secondShape; // nullable
  final int quantity;

  Operation({
    this.id,
    required this.operationType,
    required this.date,
    this.cost = 0.0,
    this.isScheduled = false,
    this.reservationId,
    this.notes,
    required this.firstType,
    required this.firstShape,
    this.secondType,
    this.secondShape,
    required this.quantity ,
  });

  @override
  List<Object?> get props => [
    id,
    operationType,
    date,
    cost,
    isScheduled,
    reservationId,
    notes,
    firstType,
    firstShape,
    secondType,
    secondShape,
    quantity
  ];

// يمكن إضافة copyWith هنا

Operation copyWith({
  int? id,
  OperationType? operationType,
  DateTime? date,
  double? cost,
  bool? isScheduled,
  int? reservationId,
  String? notes,
  PlantType? firstType,
  PlantShape? firstShape,
  PlantType? secondType,
  PlantShape? secondShape,
  int? quantity,
}) {
  return Operation(
    id: id ?? this.id,
    operationType: operationType ?? this.operationType,
    date: date ?? this.date,
    cost: cost ?? this.cost,
    isScheduled: isScheduled ?? this.isScheduled,
    reservationId: reservationId ?? this.reservationId,
    notes: notes ?? this.notes,
    firstType: firstType ?? this.firstType,
    firstShape: firstShape ?? this.firstShape,
    secondType: secondType ?? this.secondType,
    secondShape: secondShape ?? this.secondShape,
    quantity: quantity ?? this.quantity,
  );
}
}
