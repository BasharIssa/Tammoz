// lib/data/local/local_database.dart

import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:local_tammoz_chat/data/local/tables/Operations.dart';
import 'package:local_tammoz_chat/data/local/tables/operation_types.dart';
import 'package:local_tammoz_chat/data/local/tables/plant_shapes.dart';
import 'package:local_tammoz_chat/data/local/tables/scheduled_storage.dart';
import 'package:local_tammoz_chat/data/local/tables/storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'tables/planting.dart';
import 'tables/setup_expense.dart'; // يحتوي على تعريف SetupExpenseTable
import 'tables/plant_types.dart';

part 'local_database.g.dart';

@DriftDatabase(tables: [
  SetupExpenseTable,
  PlantingTable,
  PlantTypesTable,
  StorageTable,
  ScheduledStorageTable,
  PlantShapesTable,
 // OperationsTable,
  OperationTypesTable
])
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 14; // رقم النسخة الجديد

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate : migrate,
        onUpgrade: (Migrator m, int from, int to) async {
          // حذف الجدول وإعادة إنشائه بشكل تدميري
          await m.deleteTable('plant_shapes');
          await m.deleteTable('plant_types');
          await m.deleteTable('storage');
          await m.deleteTable('setup_expense');
          await m.deleteTable('planting');
          await m.deleteTable('operations');
          await m.deleteTable('operation_types');
          await m.deleteTable('scheduled_storage');

          await m.createAll();

          await _insertInitialData();
        },
      );

  Future<void> migrate(Migrator m) async {
    await m.createAll();
    await _insertInitialData();
  }

  Future<void> _insertInitialData() async {
    // التحقق من عدم وجود بيانات مسبقًا

    final operationsTypesCount =
    await select(operationTypesTable).get().then((list) => list.length);
    if (operationsTypesCount == 0) {
      await batch((batch) {
        batch.insertAll(operationTypesTable, [
          OperationTypesTableCompanion.insert(
            name: 'زراعة',successRatio: Value(0.85)
          ),
          OperationTypesTableCompanion.insert(
            name: 'قص', successRatio: Value(0.9)
          ),
          OperationTypesTableCompanion.insert(
            name: 'تطعيم', successRatio: Value(0.85)
          )
        ]);
      });
    }


    final typesCount =
        await select(plantTypesTable).get().then((list) => list.length);
    if (typesCount == 0) {
      await batch((batch) {
        batch.insertAll(plantTypesTable, [
          PlantTypesTableCompanion.insert(
            name: 'مندلون',
          ),
          PlantTypesTableCompanion.insert(
            name: 'بستونا',
          )
        ]);
      });
    }

    final shapesCount =
    await select(plantShapesTable).get().then((list) => list.length);
    if (shapesCount == 0) {
      await batch((batch) {
        batch.insertAll(plantShapesTable, [
          PlantShapesTableCompanion.insert(
            name: 'بذرة',nurseryPeriod: 0,
          ),
          PlantShapesTableCompanion.insert(
            name: 'شتلة', nurseryPeriod: 30,
          ),
          PlantShapesTableCompanion.insert(
            name: 'راسية',nurseryPeriod: 7,
          ),
          PlantShapesTableCompanion.insert(
            name: 'قرمة',nurseryPeriod: 7,
          ),
          PlantShapesTableCompanion.insert(
            name: 'راسية راسية',nurseryPeriod: 7,
          ),
          PlantShapesTableCompanion.insert(
            name: 'فلقة',nurseryPeriod: 7,
          ),
          PlantShapesTableCompanion.insert(
            name: 'أصل',nurseryPeriod: 30,
          ),
          PlantShapesTableCompanion.insert(
            name: 'زغفة',nurseryPeriod: 7,
          ),
          PlantShapesTableCompanion.insert(
            name: 'شتلة ع أصل',nurseryPeriod: 7,
          ),
          PlantShapesTableCompanion.insert(
            name: 'شتلة ع زغفة',nurseryPeriod: 7,
          ),
          PlantShapesTableCompanion.insert(
            name: 'قرمة ع أصل',nurseryPeriod: 7,
          ),
          PlantShapesTableCompanion.insert(
            name: 'قرمة ع زغفة',nurseryPeriod: 7,
          ),
          PlantShapesTableCompanion.insert(
            name: 'راسية ع أصل',nurseryPeriod: 7,
          ),
          PlantShapesTableCompanion.insert(
            name: 'راسية ع زغفة',nurseryPeriod: 7,
          ),
          PlantShapesTableCompanion.insert(
            name: 'راسية راسية ع أصل',nurseryPeriod: 7,
          ),
          PlantShapesTableCompanion.insert(
            name: 'راسية راسية ع زغفة',nurseryPeriod: 7,
          ),
          PlantShapesTableCompanion.insert(
            name: 'فلقة ع أصل',nurseryPeriod: 7,
          ),
          PlantShapesTableCompanion.insert(
            name: 'فلقة ع زغفة',nurseryPeriod: 7,
          ),

        ]);
      });
    }
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'nursery.db'));
    return NativeDatabase(file);
  });
}
