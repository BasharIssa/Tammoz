// data/local/local_database.dart

import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import '../models/expense_dto.dart';
import '../models/setup_expense_model.dart'; // يحتوي على تعريف SetupExpenseTable

part 'local_database.g.dart';

@DriftDatabase(tables: [SetupExpenseTable])
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    // عند الترقية للنسخة 2، يتم إضافة أعمدة global_id و sync_status
    onUpgrade: (Migrator m, int from, int to) async {
      if (from < 2) {
        await customStatement(
          "ALTER TABLE setup_expense_table ADD COLUMN global_id TEXT NOT NULL DEFAULT ''",
        );
        await customStatement(
          "ALTER TABLE setup_expense_table ADD COLUMN sync_status TEXT NOT NULL DEFAULT 'pending'",
        );
      }
    },
    onCreate: (Migrator m) async {
      await m.createAllTables();
    },
  );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'nursery.db'));
    return NativeDatabase(file);
  });
}

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
