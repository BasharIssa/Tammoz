// lib/data/mappers/expense_mapper.dart

import '../../domain/entities/setup_expense.dart';
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
