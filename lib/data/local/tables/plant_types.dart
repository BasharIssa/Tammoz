
import 'package:drift/drift.dart';

class PlantTypesTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().unique().withLength(min: 1, max: 50)();
}
