// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpenseDto _$ExpenseDtoFromJson(Map<String, dynamic> json) => ExpenseDto(
      globalId: json['globalId'] as String,
      syncStatus: json['syncStatus'] as String,
      categoryType: json['categoryType'] as String,
      expenseType: json['expenseType'] as String,
      materialName: json['materialName'] as String?,
      cost: (json['cost'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ExpenseDtoToJson(ExpenseDto instance) =>
    <String, dynamic>{
      'globalId': instance.globalId,
      'syncStatus': instance.syncStatus,
      'categoryType': instance.categoryType,
      'expenseType': instance.expenseType,
      'materialName': instance.materialName,
      'cost': instance.cost,
      'date': instance.date.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
