import 'package:drift/drift.dart';
import 'package:local_tammoz_chat/data/local/tables/plant_shapes.dart';
import 'package:local_tammoz_chat/data/local/tables/plant_types.dart';

class ChancesTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  RealColumn get successRate => real()();

  IntColumn get shapeId => integer().references(PlantShapesTable, #id)();

  IntColumn get typeId => integer().references(PlantTypesTable, #id)();

  IntColumn get quantity => integer()();

  DateTimeColumn get maturityDate => dateTime()();
}
