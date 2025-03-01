
import 'package:drift/drift.dart';

import '../models/expense_dto.dart';
import '../local/local_database.dart';

/// امتداد لإضافة دالة upsertExpensesFromDTO لحل التعارضات وتحديث/إدخال السجلات من بيانات ExpenseDTO
extension ExpenseUpsert on LocalDatabase {
  Future<void> upsertExpensesFromDTO(List<ExpenseDTO> remoteExpenses) async {
    for (var dto in remoteExpenses) {
      // البحث عن سجل محلي باستخدام globalId
      final query = (select(setupExpenseTable)
        ..where((tbl) => tbl.globalId.equals(dto.globalId)));
      final existing = await query.getSingleOrNull();

      if (existing != null) {
        // إذا كانت بيانات السحابة أحدث (حسب updatedAt) نقوم بالتحديث
        if (dto.updatedAt.isAfter(existing.updatedAt)) {
          await (update(setupExpenseTable)
            ..where((tbl) => tbl.globalId.equals(dto.globalId)))
              .write(
            SetupExpenseTableCompanion(
              categoryType: Value(dto.categoryType),
              expenseType: Value(dto.expenseType),
              materialName: Value(dto.materialName),
              cost: Value(dto.cost),
              date: Value(dto.date),
              updatedAt: Value(dto.updatedAt),
              syncStatus: Value('synced'),
            ),
          );
        }
      } else {
        // إذا لم يوجد سجل مطابق، نقوم بإدخاله
        await into(setupExpenseTable).insert(
          SetupExpenseTableCompanion(
            globalId: Value(dto.globalId),
            syncStatus: Value('synced'),
            categoryType: Value(dto.categoryType),
            expenseType: Value(dto.expenseType),
            materialName: Value(dto.materialName),
            cost: Value(dto.cost),
            date: Value(dto.date),
            createdAt: Value(dto.updatedAt), // استخدام updatedAt كوقت الإنشاء
            updatedAt: Value(dto.updatedAt),
          ),
        );
      }
    }
  }
}
