// lib/data/local/local_database.dart


import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'tables/planting_table.dart';
import 'tables/setup_expense_table.dart'; // يحتوي على تعريف SetupExpenseTable
import 'tables/plant_types_table.dart';
part 'local_database.g.dart';

@DriftDatabase(tables: [SetupExpenseTable, PlantingTable, PlantTypesTable])
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3; // رقم النسخة الجديد

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      // حذف الجدول وإعادة إنشائه بشكل تدميري
      await m.deleteTable('setup_expense_table');
      await m.deleteTable('planting_table');
      await m.createAll();
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
