// lib/presentation/bloc/reservation_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:local_tammoz_chat/domain/entities/reservation.dart';
import 'package:local_tammoz_chat/domain/failures/failures.dart';
import 'package:local_tammoz_chat/domain/failures/general_failures.dart';
import 'package:local_tammoz_chat/domain/usecases/reservation/create_reservation_usecase.dart';
import 'package:local_tammoz_chat/domain/usecases/reservation/get_all_reservations_usecase.dart';
import 'package:local_tammoz_chat/domain/usecases/reservation/get_all_slim_reservation_usecase.dart';
import 'package:local_tammoz_chat/domain/usecases/reservation/get_reservation_by_id_usecase.dart';

part 'reservation_events.dart';
part 'reservation_states.dart';

const String _serverFailureMessage = 'حدث خطأ في الخادم، يرجى المحاولة لاحقًا.';
const String _cacheFailureMessage = 'فشل في استرجاع البيانات من التخزين المؤقت.';
const String _invalidInputFailureMessage = 'بيانات الحجز غير صحيحة، يرجى التحقق والمحاولة مرة أخرى.';
const String _notFoundFailureMessage = 'الحجز المطلوب غير موجود.';
const String _unexpectedErrorMessage = 'حدث خطأ غير متوقع، يرجى المحاولة لاحقًا.';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  final CreateReservationUseCase createReservation;
  final GetReservationByIdUseCase getReservationById;
  final GetAllReservationsUseCase getAllReservations;
  final GetAllSlimReservationsUseCase getAllSlimReservations;

  ReservationBloc({
    required this.createReservation,
    required this.getReservationById,
    required this.getAllReservations,
    required this.getAllSlimReservations,
  }) : super(ReservationInitial()) {
    on<CreateReservationEvent>(_onCreateReservation);
    on<GetReservationByIdEvent>(_onGetReservationById);
    on<GetAllReservationsEvent>(_onGetAllReservations);
    on<GetAllSlimReservationsEvent>(_onGetAllSlimReservations);
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure _:
        return _serverFailureMessage;
      case CacheFailure _:
        return _cacheFailureMessage;
      case InvalidInputFailure _:
        return _invalidInputFailureMessage;
      case NotFoundFailure _:
        return _notFoundFailureMessage;
      default:
        return _unexpectedErrorMessage;
    }
  }

  Future<void> _onCreateReservation(
      CreateReservationEvent event,
      Emitter<ReservationState> emit,
      ) async {
    emit(ReservationLoading());
    final result = await createReservation(
      CreateReservationParams(reservation: event.reservation),
    );
    result.fold(
          (failure) => emit(ReservationError(message: _mapFailureToMessage(failure))),
          (id) => emit(ReservationCreated(id: id)),
    );
  }

  Future<void> _onGetReservationById(
      GetReservationByIdEvent event,
      Emitter<ReservationState> emit,
      ) async {
    emit(ReservationLoading());
    final result = await getReservationById(event.id);
    result.fold(
          (failure) => emit(ReservationError(message: _mapFailureToMessage(failure))),
          (reservation) => emit(ReservationLoaded(reservation: reservation)),
    );
  }

  Future<void> _onGetAllReservations(
      GetAllReservationsEvent event,
      Emitter<ReservationState> emit,
      ) async {
    emit(ReservationLoading());
    final result = await getAllReservations();
    result.fold(
          (failure) => emit(ReservationError(message: _mapFailureToMessage(failure))),
          (reservations) => emit(AllReservationsLoaded(reservations: reservations)),
    );
  }

  Future<void> _onGetAllSlimReservations(
      GetAllSlimReservationsEvent event,
      Emitter<ReservationState> emit,
      ) async {
    emit(ReservationLoading());
    final result = await getAllSlimReservations();
    result.fold(
          (failure) => emit(ReservationError(message: _mapFailureToMessage(failure))),
          (slimReservations) => emit(AllSlimReservationsLoaded(slimReservations: slimReservations)),
    );
  }
}
