import 'package:drift/drift.dart';

class PlantingTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get type => text()(); // نوع النبات
  IntColumn get quantity => integer()();
  DateTimeColumn get date => dateTime()();
  RealColumn get initialCost => real().nullable()();
}
