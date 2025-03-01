// lib/data/mappers/expense_mapper.dart

import 'package:drift/drift.dart';

import '../../domain/entities/setup_expense.dart';
import '../local/local_database.dart';
import '../models/expense_dto.dart';

/// يحوّل ExpenseDTO إلى كيان Domain (SetupExpense)
SetupExpense toDomain(ExpenseDTO dto) {
  return SetupExpense(
    id: null, // سيتم تعيينه عند التخزين محليًا
    globalId: dto.globalId,
    syncStatus: dto.syncStatus,
    categoryType: dto.categoryType,
    expenseType: dto.expenseType,
    materialName: dto.materialName,
    cost: dto.cost,
    date: dto.date,
    // لا ننقل حقل updatedAt للحفاظ على نقاء طبقة الـ Domain.
  );
}

/// يحوّل كيان Domain (SetupExpense) إلى ExpenseDTO (للتخزين في Firestore)
/// يجب تمرير قيمة updatedAt من طبقة أعلى (مثلاً Repository) بدلاً من تعيينها داخليًا.
ExpenseDTO toDTO(SetupExpense expense, {required DateTime updatedAt}) {
  return ExpenseDTO(
    globalId: expense.globalId,
    syncStatus: expense.syncStatus,
    categoryType: expense.categoryType,
    expenseType: expense.expenseType,
    materialName: expense.materialName,
    cost: expense.cost,
    date: expense.date,
    updatedAt: updatedAt,
  );
}


// تحويل بيانات الجدول المحلي (SetupExpenseTableData) إلى كيان Domain (SetupExpense)
SetupExpense toEntity(SetupExpenseTableData data) => SetupExpense(
  id: data.id,
  globalId: data.globalId,
  syncStatus: data.syncStatus,
  categoryType: data.categoryType,
  expenseType: data.expenseType,
  materialName: data.materialName,
  cost: data.cost,
  date: data.date,
  // لاحظ أننا لا نمرر updatedAt إلى كيان الـ Domain
);

// تحويل كيان Domain (SetupExpense) إلى Companion لإدخال البيانات في قاعدة البيانات المحلية
SetupExpenseTableCompanion toCompanion(SetupExpense expense) =>
    SetupExpenseTableCompanion(
      id: expense.id == null ? const Value.absent() : Value(expense.id!),
      globalId: Value(expense.globalId),
      syncStatus: Value(expense.syncStatus),
      categoryType: Value(expense.categoryType),
      expenseType: Value(expense.expenseType),
      materialName: Value(expense.materialName),
      cost: Value(expense.cost),
      date: Value(expense.date),
      createdAt: Value(DateTime.now()),
      updatedAt: Value(DateTime.now()),
    );

