import 'package:drift/drift.dart';

class PlantShapesTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().unique().withLength(min: 1, max: 50)();
  IntColumn get nurseryPeriod => integer()();
}
