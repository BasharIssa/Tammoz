// جدول العمليات
import 'package:drift/drift.dart';
import 'package:local_tammoz_chat/data/local/tables/plant_shapes.dart';
import 'package:local_tammoz_chat/data/local/tables/plant_types.dart';
import 'package:local_tammoz_chat/data/local/tables/operations.dart';
import 'package:local_tammoz_chat/data/local/tables/reservations.dart';


// جدول المخزن
class StorageTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get plantTypeId => integer().references(PlantTypesTable, #id)(); // النوع
  IntColumn get plantShapeId => integer().references(PlantShapesTable, #id)(); // الشكل
  IntColumn get quantity => integer()(); // العدد
  IntColumn get parentOperationId => integer().nullable().references(OperationsTable,  #id)(); // معرف العملية الام
  BoolColumn get isScheduled => boolean().withDefault(Constant(false))();
  TextColumn get notes => text().nullable()(); // ملاحظات
}
