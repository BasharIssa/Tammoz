import 'package:drift/drift.dart';
import 'package:local_tammoz_chat/data/local/tables/plant_shapes.dart';
import 'package:local_tammoz_chat/data/local/tables/plant_types.dart';

class PricesTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get plantTypeId => integer().references(PlantTypesTable, #id)();

  IntColumn get plantShapeId => integer().references(PlantShapesTable, #id)();

  RealColumn get price => real()();

}
