// lib/domain/usecases/get_all_reservations_usecase.dart
import 'package:dartz/dartz.dart';
import 'package:local_tammoz_chat/domain/entities/reservation.dart';
import 'package:local_tammoz_chat/domain/failures/failures.dart';
import 'package:local_tammoz_chat/domain/repositories/reservation_repository.dart';


class GetAllReservationsUseCase {
  final ReservationRepository repository;

  GetAllReservationsUseCase(this.repository);

  Future<Either<Failure, List<Reservation>>> call() async {
    return await repository.getAllReservations();
  }
}
