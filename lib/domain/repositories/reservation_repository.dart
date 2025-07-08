// lib/domain/repositories/reservation_repository.dart
import 'package:dartz/dartz.dart';
import 'package:local_tammoz_chat/domain/failures/failures.dart'; 
import '../entities/reservation.dart';

abstract class ReservationRepository {
  Future<Either<Failure, int>> createReservation(Reservation reservation);
  Future<Either<Failure, Reservation>> getReservationById(int id);
  Future<Either<Failure, List<Reservation>>> getAllReservations();
  Future<Either<Failure, List<SlimReservation>>> getAllSlimReservations();
}
