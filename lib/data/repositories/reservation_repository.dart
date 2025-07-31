// lib/data/repositories/reservation_repository_impl.dart
import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:drift/isolate.dart';
import 'package:local_tammoz_chat/data/local/local_database.dart';
import 'package:local_tammoz_chat/data/mappers/reservation_mapper.dart';
import 'package:local_tammoz_chat/domain/entities/reservation.dart';
import 'package:local_tammoz_chat/domain/failures/failures.dart';
import 'package:local_tammoz_chat/domain/failures/general_failures.dart';
import 'package:local_tammoz_chat/domain/repositories/reservation_repository.dart';

class ReservationRepositoryImpl implements ReservationRepository {
  final LocalDatabase _db;

  ReservationRepositoryImpl({required LocalDatabase localDatabase}) : _db = localDatabase;

  @override
  Future<Either<Failure, int>> createReservation(Reservation reservation) async {
    try {
      // 1. Convert Domain Entity to DTO
      final reservationDto = ReservationMapper.fromEntity(reservation);

      // 2. Convert DTO to Drift Companion
      final companion = ReservationMapper.toCompanion(reservationDto);

      // 3. Insert into database
      final id = await _db.into(_db.reservationsTable).insert(companion);

      return Right(id);
    } on DriftRemoteException catch (e) {
      return Left(DatabaseFailure(message: 'Failed to create reservation ',stackTrace: e.remoteStackTrace));
    } on Exception catch (e) {
      return Left(DatabaseFailure(message: 'An unexpected error occurred: ${e.toString()}'));
    }
  }

  @override
  Future<Either<DatabaseFailure, Reservation>> getReservationById(int id) async {
    try {
      // استعلام مع join لجدول الحجوزات، أنواع النباتات، أشكال النباتات، وأسعار النباتات
      final query = _db.select(_db.reservationsTable).join([
        leftOuterJoin(
          _db.plantTypesTable,
          _db.plantTypesTable.id.equalsExp(_db.reservationsTable.plantTypeId),
        ),
        leftOuterJoin(
          _db.plantShapesTable,
          _db.plantShapesTable.id.equalsExp(_db.reservationsTable.plantShapeId),
        ),
        leftOuterJoin(
          _db.pricesTable,
          _db.pricesTable.plantTypeId.equalsExp(_db.reservationsTable.plantTypeId) &
          _db.pricesTable.plantShapeId.equalsExp(_db.reservationsTable.plantShapeId),
        ),
      ])..where(_db.reservationsTable.id.equals(id));

      final result = await query.getSingleOrNull();

      if (result == null) {
        return const Left(DatabaseFailure(message: 'Reservation not found.'));
      }

      final reservationData = result.readTable(_db.reservationsTable);
      final plantTypeData = result.readTable(_db.plantTypesTable);
      final plantShapeData = result.readTable(_db.plantShapesTable);
      final priceData = result.readTableOrNull(_db.pricesTable);

      if (priceData == null) {
        return const Left(DatabaseFailure(message: 'Price data not found for this reservation.'));
      }

      // حساب المبلغ الكلي = الكمية * السعر من جدول الأسعار
      final calculatedTotalAmount = reservationData.quantity * priceData.price;

      final reservationDto = ReservationMapper.fromTableData(
        reservationData,
        calculatedTotalAmount,
        plantTypeData,
        plantShapeData,
      );

      final reservationEntity = ReservationMapper.toEntity(reservationDto);
      return Right(reservationEntity);
    } catch (e) {
      // التعامل مع أي استثناءات عامة بخطأ قواعد بيانات مع رسالة موحدة
      return const Left(DatabaseFailure(message: 'Failed to get reservation by ID.'));
    }
  }


  @override
  Future<Either<Failure, List<Reservation>>> getAllReservations() async {
    try {
      // استعلام مع join لجدول الحجوزات، أنواع النباتات، أشكال النباتات، وأسعار النباتات
      final query = _db.select(_db.reservationsTable).join([
        leftOuterJoin(
          _db.plantTypesTable,
          _db.plantTypesTable.id.equalsExp(_db.reservationsTable.plantTypeId),
        ),
        leftOuterJoin(
          _db.plantShapesTable,
          _db.plantShapesTable.id.equalsExp(_db.reservationsTable.plantShapeId),
        ),
        leftOuterJoin(
          _db.pricesTable,
          _db.pricesTable.plantTypeId.equalsExp(_db.reservationsTable.plantTypeId) &
          _db.pricesTable.plantShapeId.equalsExp(_db.reservationsTable.plantShapeId),
        ),
      ]);

      final results = await query.get();

      if (results.isEmpty) {
        return const Right([]); // Return empty list if no reservations
      }

      final List<Reservation> reservations = [];
      for (final row in results) {
        final reservationData = row.readTable(_db.reservationsTable);
        final plantTypeData = row.readTable(_db.plantTypesTable);
        final plantShapeData = row.readTable(_db.plantShapesTable);
        final pricesData = row.readTableOrNull(_db.pricesTable);

        final calculatedTotalAmount =pricesData ==null
                          ? 0.0
        :reservationData.quantity * pricesData.price ;


        final reservationDto = ReservationMapper.fromTableData(
          reservationData,
          calculatedTotalAmount,
          plantTypeData,
          plantShapeData,
        );
        reservations.add(ReservationMapper.toEntity(reservationDto));
      }
      return Right(reservations);
    } on DriftRemoteException catch (e, st) {
      return Left(DatabaseFailure(message: 'Failed to create reservation ',stackTrace: st));
    } on Exception catch (e) {
      return Left(DatabaseFailure(message: 'An unexpected error occurred: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<SlimReservation>>> getAllSlimReservations() async {
    try {
      // استعلام مخصص لجلب عمودين فقط: id و fullName
      final query = _db.selectOnly(_db.reservationsTable)
        ..addColumns([_db.reservationsTable.id, _db.reservationsTable.fullName]);

      final results = await query.get();

      if (results.isEmpty) {
        return const Right([]);
      }

      final List<SlimReservation> slimReservations = results.map((row) {
        final id = row.read(_db.reservationsTable.id);
        final fullName = row.read(_db.reservationsTable.fullName);

        return SlimReservation(
          id: id,
          fullName: fullName!,
        );
      }).toList();

      return Right(slimReservations);
    } on DriftRemoteException catch (e) {
      return Left(DatabaseFailure(message: 'Failed to create reservation', stackTrace: e.remoteStackTrace));
    } on Exception catch (e) {
      return Left(DatabaseFailure(message: 'An unexpected error occurred: ${e.toString()}'));
    }
  }


  // @override
  // Future<Either<DatabaseFailure, int>>
  // getQuantityByTypeIdAndShapeIdAndDeliveryDate(
  //     int typeId,
  //     shapeId,
  //     DateTime deliveryDate) async {
  //   try {
  //     final query = _db.selectOnly(_db.reservationDetailsTable)
  //       ..addColumns([_db.reservationDetailsTable.quantity])
  //       ..where(_db.reservationDetailsTable.typeId.equals(typeId)
  //       & _db.reservationDetailsTable.shapeId.equals(shapeId)
  //       & _db.reservationDetailsTable.deliveryDate.equalsExp(deliveryDate));
  //
  //
  //
  //     final quantity = await query.map((row) => row.read(_db.reservationDetailsTable.quantity)).getSingleOrNull();
  //
  //     //final result = await query.map((row) => row.read(_db.reservationDetailsTable.quantity)).getSingle();
  //
  //     if (quantity == null) {
  //       return const Left(DatabaseFailure(message: 'تفصيل الحجز غير موجود'));
  //     }
  //     return Right(quantity);
  //   } catch (e) {
  //     // التعامل مع أي استثناءات عامة بخطأ قواعد بيانات مع رسالة موحدة
  //     return const Left(DatabaseFailure(message: 'فشل في جلب الكمية من تفصيل الحجز'));
  //   }
  // }

}
