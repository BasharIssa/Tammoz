import 'package:drift/drift.dart';

class PlantingTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get typeId => integer().customConstraint('REFERENCES plant_types(id)')();
  IntColumn get quantity => integer()();
  DateTimeColumn get date => dateTime()();
  RealColumn get initialCost => real().nullable()();
}
