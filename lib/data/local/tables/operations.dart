

import 'package:drift/drift.dart';
import 'package:local_tammoz_chat/data/local/tables/operation_types.dart';
import 'package:local_tammoz_chat/data/local/tables/plant_shapes.dart';
import 'package:local_tammoz_chat/data/local/tables/plant_types.dart';

class OperationsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get operationTypeId => integer().references(OperationTypesTable, #id)();
  DateTimeColumn get date => dateTime()();

  // النوع الأول (مع مفتاح خارجي)
  @ReferenceName('firstTypeRelation')
  IntColumn get firstTypeId => integer().references(PlantTypesTable, #id)();

  // الشكل الأول (مع مفتاح خارجي)
  @ReferenceName('firstShapeRelation')
  IntColumn get firstShapeId => integer().references(PlantShapesTable, #id)();

  IntColumn get quantity => integer()();

  // النوع الثاني (مفتاح خارجي مع nullable)
  @ReferenceName('secondTypeRelation')
  IntColumn get secondTypeId => integer().nullable().references(PlantTypesTable, #id)();

  // الشكل الثاني (مفتاح خارجي مع nullable)
  @ReferenceName('secondShapeRelation')
  IntColumn get secondShapeId => integer().nullable().references(PlantShapesTable, #id)();

  BoolColumn get scheduled => boolean().withDefault(const Constant(false))();
  IntColumn get reservationId => integer().nullable()();
  TextColumn get notes => text().nullable()();
}
