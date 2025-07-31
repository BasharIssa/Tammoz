// lib/domain/usecases/create_reservation_usecase.dart
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:local_tammoz_chat/domain/entities/reservation.dart';
import 'package:local_tammoz_chat/domain/failures/failures.dart';
import 'package:local_tammoz_chat/domain/repositories/reservation_repository.dart';


class CreateReservationUseCase {
  final ReservationRepository repository;

  CreateReservationUseCase(this.repository);

  Future<Either<Failure, int>> call(CreateReservationParams params) async {
    return await repository.createReservation(params.reservation);
  }
}

class CreateReservationParams extends Equatable {
  final Reservation reservation;

  const CreateReservationParams({required this.reservation});

  @override
  List<Object?> get props => [reservation];
}
