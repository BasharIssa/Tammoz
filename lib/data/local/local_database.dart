// lib/data/local/local_database.dart

import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:local_tammoz_chat/data/local/tables/ReservationDetails.dart';
import 'package:local_tammoz_chat/data/local/tables/chances.dart';
import 'package:local_tammoz_chat/data/local/tables/operations.dart';
import 'package:local_tammoz_chat/data/local/tables/operation_types.dart';
import 'package:local_tammoz_chat/data/local/tables/plant_shapes.dart';
import 'package:local_tammoz_chat/data/local/tables/storage.dart';
import 'package:local_tammoz_chat/data/local/tables/storage_reservation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import '../../constants.dart';
import 'tables/parent_child_chances.dart';
import 'tables/prices.dart';
import 'tables/reservations.dart';
import 'tables/setup_expense.dart'; // يحتوي على تعريف SetupExpenseTable
import 'tables/plant_types.dart';
// ... (بقية الاستيرادات)

part 'local_database.g.dart';

@DriftDatabase(tables: [
  SetupExpenseTable,
  PlantTypesTable,
  StorageTable,
  PlantShapesTable,
  OperationTypesTable,
  OperationsTable,
  ReservationsTable,
  PricesTable,
  ChancesTable,
  ParentChildChancesTable,
  ReservationDetailsTable,
  StorageReservationTable,
])
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
      await _insertInitialData();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      // حذف جميع الجداول بشكل كامل
      await _deleteAllTables();
      await m.createAll();
      await _insertInitialData();
      // throw UnimplementedError();
    },
  );

  // دالة مساعدة لحذف جميع الجداول
  Future<void> _deleteAllTables() async {
    await transaction(() async {
      await delete(setupExpenseTable).go();
      await delete(plantTypesTable).go();
      await delete(storageTable).go();
      await delete(plantShapesTable).go();
      await delete(operationTypesTable).go();
      await delete(operationsTable).go();
      await delete(reservationsTable).go();
      await delete(pricesTable).go();
    });
  }



  Future<void> deleteDatabaseFile() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'nursery.db'));
    if (await file.exists()) await file.delete();
    final shmFile = File('${file.path}-shm');
    final walFile = File('${file.path}-wal');
    if (await shmFile.exists()) await shmFile.delete();
    if (await walFile.exists()) await walFile.delete();
  }


  Future<void> _insertInitialData() async {
    // التحقق من عدم وجود بيانات مسبقًا


    final operationsTypesCount =
    await select(operationTypesTable).get().then((list) => list.length);
    if (operationsTypesCount == 0) {
      await batch((batch) {
        batch.insertAll(operationTypesTable, [
          OperationTypesTableCompanion.insert(
            name: OperationTypesConstants.planting,
            successRatio: Value(OperationTypesConstants.plantingDefaultSuccessRatio),
          ),
          OperationTypesTableCompanion.insert(
            name: OperationTypesConstants.pruning,
            successRatio: Value(OperationTypesConstants.pruningDefaultSuccessRatio),
          ),
          OperationTypesTableCompanion.insert(
            name: OperationTypesConstants.grafting,
            successRatio: Value(OperationTypesConstants.graftingDefaultSuccessRatio),
          ),
        ]);
      });
    }

    final shapesCount =
    await select(plantShapesTable).get().then((list) => list.length);
    if (shapesCount == 0) {
      await batch((batch) {
        batch.insertAll(plantShapesTable, [
          PlantShapesTableCompanion.insert(
            name: PlantShapesConstants.cultivatedSeed,
            nurseryPeriod: NurseryPeriodConstants.seed,
          ),
          PlantShapesTableCompanion.insert(
            name: PlantShapesConstants.wildSeed,
            nurseryPeriod: NurseryPeriodConstants.seed,
          ),
          PlantShapesTableCompanion.insert(
            name: PlantShapesConstants.seedling,
            nurseryPeriod: NurseryPeriodConstants.long,
          ),
          PlantShapesTableCompanion.insert(
            name: PlantShapesConstants.rasiya,
            nurseryPeriod: NurseryPeriodConstants.short,
          ),
          PlantShapesTableCompanion.insert(
            name: PlantShapesConstants.qarmah,
            nurseryPeriod: NurseryPeriodConstants.short,
          ),
          PlantShapesTableCompanion.insert(
            name: PlantShapesConstants.rasiyaRasiya,
            nurseryPeriod: NurseryPeriodConstants.short,
          ),
          PlantShapesTableCompanion.insert(
            name: PlantShapesConstants.falqa,
            nurseryPeriod: NurseryPeriodConstants.short,
          ),
          PlantShapesTableCompanion.insert(
            name: PlantShapesConstants.origin,
            nurseryPeriod: NurseryPeriodConstants.long,
          ),
          PlantShapesTableCompanion.insert(
            name: PlantShapesConstants.zaghfa,
            nurseryPeriod: NurseryPeriodConstants.short,
          ),
          PlantShapesTableCompanion.insert(
            name: PlantShapesConstants.seedlingOnOrigin,
            nurseryPeriod: NurseryPeriodConstants.short,
          ),
          PlantShapesTableCompanion.insert(
            name: PlantShapesConstants.seedlingOnZaghfa,
            nurseryPeriod: NurseryPeriodConstants.short,
          ),
          PlantShapesTableCompanion.insert(
            name: PlantShapesConstants.qarmahOnOrigin,
            nurseryPeriod: NurseryPeriodConstants.short,
          ),
          PlantShapesTableCompanion.insert(
            name: PlantShapesConstants.qarmahOnZaghfa,
            nurseryPeriod: NurseryPeriodConstants.short,
          ),
          PlantShapesTableCompanion.insert(
            name: PlantShapesConstants.rasiyaOnOrigin,
            nurseryPeriod: NurseryPeriodConstants.short,
          ),
          PlantShapesTableCompanion.insert(
            name: PlantShapesConstants.rasiyaOnZaghfa,
            nurseryPeriod: NurseryPeriodConstants.short,
          ),
          PlantShapesTableCompanion.insert(
            name: PlantShapesConstants.rasiyaRasiyaOnOrigin,
            nurseryPeriod: NurseryPeriodConstants.short,
          ),
          PlantShapesTableCompanion.insert(
            name: PlantShapesConstants.rasiyaRasiyaOnZaghfa,
            nurseryPeriod: NurseryPeriodConstants.short,
          ),
          PlantShapesTableCompanion.insert(
            name: PlantShapesConstants.falqaOnOrigin,
            nurseryPeriod: NurseryPeriodConstants.short,
          ),
          PlantShapesTableCompanion.insert(
            name: PlantShapesConstants.falqaOnZaghfa,
            nurseryPeriod: NurseryPeriodConstants.short,
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
