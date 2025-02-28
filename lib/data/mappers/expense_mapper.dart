// data/mappers/expense_mapper.dart

import '../../domain/entities/setup_expense.dart';
import '../models/expense_dto.dart';

/// يحوّل ExpenseDTO إلى كيان Domain (SetupExpense)
SetupExpense toDomain(ExpenseDTO dto) {
  return SetupExpense(
    id: null, // سيُعيّن معرف local عند التخزين في القاعدة المحلية
    globalId: dto.globalId,
    syncStatus: dto.syncStatus,
    categoryType: dto.categoryType,
    expenseType: dto.expenseType,
    materialName: dto.materialName,
    cost: dto.cost,
    date: dto.date,
    // لاحظ أننا لا ننقل حقل updatedAt إلى الـ Domain Entity، مما يحافظ على نقاء طبقة الـ Domain.
  );
}

/// يحوّل كيان Domain (SetupExpense) إلى ExpenseDTO
/// هنا يتم تعيين updatedAt إلى الوقت الحالي عند التحويل، لأن الـ Domain لا يحتوي على هذا الحقل.
ExpenseDTO toDTO(SetupExpense expense) {
  return ExpenseDTO(
    globalId: expense.globalId,
    syncStatus: expense.syncStatus,
    categoryType: expense.categoryType,
    expenseType: expense.expenseType,
    materialName: expense.materialName,
    cost: expense.cost,
    date: expense.date,
    updatedAt: DateTime.now(), // تعيين الوقت الحالي؛ ويمكن تعديل الاستراتيجية إذا كان متوفرًا تاريخ سابق.
  );
}
