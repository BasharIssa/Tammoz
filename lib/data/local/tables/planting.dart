import 'package:drift/drift.dart';
import 'package:local_tammoz_chat/data/local/tables/plant_types.dart';

class PlantingTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get typeId => integer().references(PlantTypesTable, #id)();
  IntColumn get quantity => integer()();
  DateTimeColumn get date => dateTime()();
  RealColumn get initialCost => real().nullable()();
}
