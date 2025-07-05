import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:local_tammoz_chat/domain/entities/operation.dart';
import 'package:local_tammoz_chat/domain/entities/storage.dart';
import 'package:local_tammoz_chat/domain/repositories/operation_repository.dart';
import 'package:local_tammoz_chat/domain/usecases/operation/add_operation.dart';

part 'operation_events.dart';
part 'operation_states.dart';



class OperationBloc extends Bloc<OperationEvent, OperationState> {
  final OperationRepository operationRepository;
  final AddOperationAndUpdateStorageUseCase addOperationAndUpdateStorageUseCase;

  OperationBloc({
    required this.operationRepository,
    required this.addOperationAndUpdateStorageUseCase,
  }) : super(OperationsInitial()) {
    on<LoadOperations>(_onLoadOperations);
    on<AddOperationEvent>(_onAddOperation);
  }

  Future<void> _onLoadOperations(
      LoadOperations event, Emitter<OperationState> emit) async {
    emit(OperationsLoading());
    final result = await operationRepository.getAllOperations();
    result.fold(
          (failure) => emit(OperationError(failure.message)),
          (operations) => emit(OperationsLoaded(operations)),
    );
  }

  Future<void> _onAddOperation(
      AddOperationEvent event, Emitter<OperationState> emit) async {
    emit(OperationsLoading());
    final result = await addOperationAndUpdateStorageUseCase(
      event.operation,
      event.firstStorageId,
      event.secondStorageId,
    );
    result.fold(
          (failure) => emit(OperationAddFailure(failure.message)),
          (_) => emit(OperationAddSuccess()),
    );

    add(LoadOperations());
  }
}
