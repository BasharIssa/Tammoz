// data/models/expense_dto.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_dto.freezed.dart';
part 'expense_dto.g.dart';

@freezed
class ExpenseDto with _$ExpenseDto {
  factory ExpenseDto({
    required String globalId,
    required String syncStatus,
    required String categoryType,
    required String expenseType,
    required String? materialName,
    required double cost,
    required DateTime date,
    required DateTime updatedAt,
  }) = _ExpenseDto;

  factory ExpenseDto.fromJson(Map<String, dynamic> json) => _$ExpenseDtoFromJson(json);
}
