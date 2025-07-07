import 'package:drift/drift.dart';
import 'plant_types.dart';

import 'plant_shapes.dart';

class ReservationsTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get fullName => text().withLength(min: 1, max: 255)();

  TextColumn get phone => text().withLength(min: 1, max: 20)();

  DateTimeColumn get reservationDate => dateTime()();

  DateTimeColumn get deliveryDate => dateTime().nullable()();

  IntColumn get plantTypeId => integer().references(PlantTypesTable, #id)();

  IntColumn get plantShapeId => integer().references(PlantShapesTable, #id)();

  IntColumn get quantity => integer()();

  RealColumn get deposit => real().withDefault((Constant(0)))();  // <-- هنا عمود الرعبون، غير قابل لأن يكون null

  BoolColumn get isFullyPaid => boolean().withDefault(Constant(false))();

  BoolColumn get isDelivered => boolean().withDefault(Constant(false))();

  TextColumn get notes => text().nullable()();
}
