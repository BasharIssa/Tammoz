// lib/domain/entities/planting.dart

import 'package:equatable/equatable.dart';

class Storage  extends Equatable{
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
  @override
  List<Object?> get props => [
    id,
    plantType,
    plantShape,
    quantity,
    parentOperationDate,
  parentOperationName,
    notes];
}