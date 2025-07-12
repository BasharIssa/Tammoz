// lib/presentation/bloc/reservation_events.dart
part of 'reservation_bloc.dart';


abstract class ReservationEvent extends Equatable {
  const ReservationEvent();

  @override
  List<Object> get props => [];
}

class CreateReservationEvent extends ReservationEvent {
  final Reservation reservation;

  const CreateReservationEvent({required this.reservation});

  @override
  List<Object> get props => [reservation];
}

class GetReservationByIdEvent extends ReservationEvent {
  final int id;

  const GetReservationByIdEvent({required this.id});

  @override
  List<Object> get props => [id];
}

class GetAllReservationsEvent extends ReservationEvent {}

class GetAllSlimReservationsEvent extends ReservationEvent {}
