// lib/domain/entities/planting.dart

import 'package:equatable/equatable.dart';
class Storage extends Equatable {
  final int? id;
  final String plantType;
  final String plantShape;
  final int quantity;
  final DateTime parentOperationDate;
  final String parentOperationName;
  final String? notes;

  const Storage({
    this.id,
    required this.plantType,
    required this.plantShape,
    required this.quantity,
    required this.parentOperationName,
    required this.parentOperationDate,
    this.notes,
  });

  Storage copyWith({
    int? id,
    String? plantType,
    String? plantShape,
    int? quantity,
    DateTime? parentOperationDate,
    String? parentOperationName,
    String? notes,
  }) {
    return Storage(
      id: id ?? this.id,
      plantType: plantType ?? this.plantType,
      plantShape: plantShape ?? this.plantShape,
      quantity: quantity ?? this.quantity,
      parentOperationDate: parentOperationDate ?? this.parentOperationDate,
      parentOperationName: parentOperationName ?? this.parentOperationName,
      notes: notes ?? this.notes,
    );
  }

  @override
  List<Object?> get props => [
    id,
    plantType,
    plantShape,
    quantity,
    parentOperationDate,
    parentOperationName,
    notes,
  ];
}
