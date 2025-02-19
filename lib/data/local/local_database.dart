import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import '../models/setup_expense_model.dart';

part 'local_database.g.dart';

@DriftDatabase(tables: [SetupExpenseTable])
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());

  // تحديث رقم المخطط إلى 2
  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onUpgrade: (Migrator m, int from, int to) async {
      if (from < 2) {
        // استخدام تعليمة SQL مخصصة لإضافة عمود global_id بقيمة افتراضية فارغة
        await customStatement(
          "ALTER TABLE setup_expense_table ADD COLUMN global_id TEXT NOT NULL DEFAULT ''",
        );
        // استخدام تعليمة SQL مخصصة لإضافة عمود sync_status بقيمة افتراضية 'pending'
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
