part of 'operation_bloc.dart';

abstract class OperationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class OperationsInitial extends OperationState {}

class OperationsLoading extends OperationState {}

class OperationsLoaded extends OperationState {
  final List<Operation> operations;

  OperationsLoaded(this.operations);

  @override
  List<Object?> get props => [operations];
}

class OperationError extends OperationState {
  final String message;

  OperationError(this.message);

  @override
  List<Object?> get props => [message];
}

class OperationAddSuccess extends OperationState {}
class GraftingAddSuccess extends OperationAddSuccess{}

class OperationAddFailure extends OperationState {
  final String message;

  OperationAddFailure(this.message);

  @override
  List<Object?> get props => [message];
}

