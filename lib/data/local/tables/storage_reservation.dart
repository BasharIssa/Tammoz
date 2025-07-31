
import 'package:drift/drift.dart';
import 'package:local_tammoz_chat/data/local/tables/reservations.dart';
import 'package:local_tammoz_chat/data/local/tables/storage.dart';

class StorageReservationTable extends Table{
  IntColumn get storageId => integer().references(StorageTable, #id)();
  IntColumn get reservationId => integer().references(ReservationsTable, #id)();
  IntColumn get quantity => integer()();
  @override
  Set<Column> get primaryKey => {storageId, reservationId};
}