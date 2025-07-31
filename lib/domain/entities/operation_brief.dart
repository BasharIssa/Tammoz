// lib/domain/entities/operation_brief.dart
import 'package:equatable/equatable.dart';

class OperationBrief extends Equatable {
  final int id;
  final DateTime operationDate;

  const OperationBrief({
    required this.id,
    required this.operationDate,
  });

  @override
  List<Object?> get props => [id, operationDate];
}
