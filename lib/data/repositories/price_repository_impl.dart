import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:local_tammoz_chat/data/local/local_database.dart';
import 'package:local_tammoz_chat/data/models/price_dto.dart';
import 'package:local_tammoz_chat/data/mappers/price_mapper.dart';
import 'package:local_tammoz_chat/domain/failures/failures.dart';
import 'package:local_tammoz_chat/domain/failures/general_failures.dart';
import 'package:local_tammoz_chat/domain/repositories/price_repository.dart';

class PriceRepositoryImpl implements PriceRepository {
  final LocalDatabase _db;

  PriceRepositoryImpl(this._db);

  @override
  Future<List<PriceDto>> getAllPrices() async {
    final query = _db.select(_db.pricesTable).join([
      innerJoin(_db.plantTypesTable, _db.plantTypesTable.id.equalsExp(_db.pricesTable.plantTypeId)),
      innerJoin(_db.plantShapesTable, _db.plantShapesTable.id.equalsExp(_db.pricesTable.plantShapeId)),
    ]);

    final rows = await query.get();

    return rows.map((row) {
      final priceData = row.readTable(_db.pricesTable);
      final plantTypeData = row.readTable(_db.plantTypesTable);
      final plantShapeData = row.readTable(_db.plantShapesTable);

      return priceData.toDto(plantTypeData, plantShapeData);
    }).toList();
  }

  @override
  Future<PriceDto?> getPriceById(int id) async {
    final query = _db.select(_db.pricesTable).join([
      innerJoin(_db.plantTypesTable, _db.plantTypesTable.id.equalsExp(_db.pricesTable.plantTypeId)),
      innerJoin(_db.plantShapesTable, _db.plantShapesTable.id.equalsExp(_db.pricesTable.plantShapeId)),
    ])
      ..where(_db.pricesTable.id.equals(id));

    final row = await query.getSingleOrNull();

    if (row == null) return null;

    final priceData = row.readTable(_db.pricesTable);
    final plantTypeData = row.readTable(_db.plantTypesTable);
    final plantShapeData = row.readTable(_db.plantShapesTable);

    return priceData.toDto(plantTypeData, plantShapeData);
  }

  @override
  Future<int> insertPrice(PriceDto price) async {
    final companion = price.toTableCompanion();
    return await _db.into(_db.pricesTable).insert(companion);
  }



  Future<Either<Failure, bool>> updatePrice(PriceDto price) async {
  try {
  if (price.id == null) {
  return Left(DatabaseFailure(message:'Price id cannot be null for update'));
  }
  final companion = price.toTableCompanion();
  final rowsUpdated = await (_db.update(_db.pricesTable)
  ..where((tbl) => tbl.id.equals(price.id!)))
      .write(companion);

  if (rowsUpdated > 0) {
  return Right(true);
  } else {
  return Left(DatabaseFailure(message:'No rows updated in Prices table'));
  }
  } catch (e) {
  return Left(DatabaseFailure(message:'Database error: ${e.toString()}'));
  }
  }


  @override
  Future<bool> deletePrice(int id) async {
    final rowsDeleted = await (_db.delete(_db.pricesTable)
      ..where((tbl) => tbl.id.equals(id)))
        .go();
    return rowsDeleted > 0;
  }
}
