




// جدول المخزن المتعلق بالجدولة
import 'package:drift/drift.dart';
import 'package:local_tammoz_chat/data/local/tables/plant_shapes.dart';
import 'package:local_tammoz_chat/data/local/tables/plant_types.dart';

class ScheduledStorageTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get typeId => integer().references(PlantTypesTable, #id)(); // النوع
  IntColumn get shapeId => integer().references(PlantShapesTable, #id)(); // الشكل
  IntColumn get quantity => integer()(); // العدد
  IntColumn get parentOperationId => integer()(); // معرف العملية الام
  TextColumn get notes => text().nullable()(); // ملاحظات
}