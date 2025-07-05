
part of 'operation_bloc.dart';

abstract class OperationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadOperations extends OperationEvent {}

class AddOperationEvent extends OperationEvent {
  final Operation operation;
  final int? firstStorageId;
  final int? secondStorageId;

  AddOperationEvent(this.operation, {this.firstStorageId, this.secondStorageId});

  @override
  List<Object?> get props => [operation, firstStorageId, secondStorageId];
}