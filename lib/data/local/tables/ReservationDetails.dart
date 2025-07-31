import 'package:drift/drift.dart';
import 'package:local_tammoz_chat/data/local/tables/plant_shapes.dart';
import 'package:local_tammoz_chat/data/local/tables/plant_types.dart';
import 'reservations.dart';

enum ReservationStatus { free, scheduled, delivered }

class ReservationDetailsTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get reservationId => integer().references(ReservationsTable, #id)();

  IntColumn get shapeId => integer().references(PlantShapesTable, #id)();

  IntColumn get typeId => integer().references(PlantTypesTable, #id)();

  IntColumn get quantity => integer()();
  // حالة الحجز: 0=حر، 1=مجدول، 2=تم التسليم
  IntColumn get status => intEnum<ReservationStatus>().withDefault(const Constant(0))();
// يمكنك تعريف Enum لتحويله لعدد وبالعكس داخل Drift (يدعم drift 2.6+)
}
