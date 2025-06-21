

import 'package:drift/drift.dart';

class OperationTypesTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  RealColumn get successRatio =>real().withDefault(const Constant(1))();
}
