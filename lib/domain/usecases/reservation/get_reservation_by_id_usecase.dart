// lib/domain/usecases/get_reservation_by_id_usecase.dart
import 'package:dartz/dartz.dart';
import 'package:local_tammoz_chat/domain/entities/reservation.dart';
import 'package:local_tammoz_chat/domain/failures/failures.dart';
import 'package:local_tammoz_chat/domain/repositories/reservation_repository.dart';


class GetReservationByIdUseCase {
  final ReservationRepository repository;

  GetReservationByIdUseCase(this.repository);

  Future<Either<Failure, Reservation>> call(int id) async {
    return await repository.getReservationById(id);
  }
}
