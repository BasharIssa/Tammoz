// lib/domain/usecases/get_all_slim_reservations.dart
import 'package:dartz/dartz.dart';
import 'package:local_tammoz_chat/domain/entities/reservation.dart';
import 'package:local_tammoz_chat/domain/failures/failures.dart';
import 'package:local_tammoz_chat/domain/repositories/reservation_repository.dart';


class GetAllSlimReservationsUseCase {
  final ReservationRepository repository;

  GetAllSlimReservationsUseCase(this.repository);

  Future<Either<Failure, List<SlimReservation>>> call() async {
    return await repository.getAllSlimReservations();
  }
}
