import 'package:equatable/equatable.dart';

class SetupExpense extends Equatable {
  final int? id;
  final String globalId;    // المعرف الموحد
  final String syncStatus;  // حالة المزامنة
  final String categoryType;
  final String expenseType;
  final String? materialName;
  final double cost;
  final DateTime date;


  const SetupExpense({
    this.id,
    required this.globalId,
    this.syncStatus = 'pending',
    required this.categoryType,
    required this.expenseType,
    this.materialName,
    required this.cost,
    required this.date,

  });

  @override
  List<Object?> get props => [id, globalId, syncStatus, categoryType, expenseType, materialName, cost, date];
}
