// data/models/expense_dto.dart
import 'package:json_annotation/json_annotation.dart';
part 'expense_dto.g.dart';


/// نموذج البيانات (DTO) للمصاريف، ويحتوي على جميع الحقول المطلوبة من مصدر البيانات (مثل Firestore)
@JsonSerializable()
class ExpenseDto {
  final String globalId;
  final String syncStatus;
  final String categoryType;
  final String expenseType;
  final String? materialName;
  final double cost;
  final DateTime date;
  final DateTime updatedAt; // يُستخدم لحل التعارضات في المزامنة

  ExpenseDto({
    required this.globalId,
    required this.syncStatus,
    required this.categoryType,
    required this.expenseType,
    this.materialName,
    required this.cost,
    required this.date,
    required this.updatedAt,
  });


  factory ExpenseDto.fromJson(Map<String, dynamic> json) => _$ExpenseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ExpenseDtoToJson(this);
}

