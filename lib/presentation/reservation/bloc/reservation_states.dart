// lib/presentation/bloc/reservation_states.dart
part of 'reservation_bloc.dart';



abstract class ReservationState extends Equatable {
  const ReservationState();

  @override
  List<Object> get props => [];
}

class ReservationInitial extends ReservationState {}

class ReservationLoading extends ReservationState {}

class ReservationLoaded extends ReservationState {
  final Reservation reservation;

  const ReservationLoaded({required this.reservation});

  @override
  List<Object> get props => [reservation];
}

class AllReservationsLoaded extends ReservationState {
  final List<Reservation> reservations;

  const AllReservationsLoaded({required this.reservations});

  @override
  List<Object> get props => [reservations];
}

class AllSlimReservationsLoaded extends ReservationState {
  final List<SlimReservation> slimReservations;

  const AllSlimReservationsLoaded({required this.slimReservations});

  @override
  List<Object> get props => [slimReservations];
}

class ReservationCreated extends ReservationState {
  final int id;

  const ReservationCreated({required this.id});

  @override
  List<Object> get props => [id];
}

class ReservationError extends ReservationState {
  final String message;

  const ReservationError({required this.message});

  @override
  List<Object> get props => [message];
}
