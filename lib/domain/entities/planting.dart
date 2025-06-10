// lib/domain/entities/planting.dart

import 'package:equatable/equatable.dart';

class Planting extends Equatable {
  final int? id;
  final int typeId;       // معرف النوع
  final String typeName;  // اسم النوع
  final int quantity;
  final DateTime date;
  final double? initialCost;

  const Planting({
    this.id,
    required this.typeId,
    required this.typeName,
    required this.quantity,
    required this.date,
    this.initialCost,
  });

  @override
  List<Object?> get props => [id, typeId, typeName, quantity, date, initialCost];
}
