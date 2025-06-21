// storage_states.dart

part of 'storage_bloc.dart';

abstract class StorageState extends Equatable {
  const StorageState();

  @override
  List<Object> get props => [];
}

class StorageInitial extends StorageState {}

class StorageLoading extends StorageState {}

class StorageLoaded extends StorageState {
  final List<Storage> storages;

  const StorageLoaded(this.storages);

  @override
  List<Object> get props => [storages];
}

class SingleStorageLoaded extends StorageState {
  final Storage storage;

  const SingleStorageLoaded(this.storage);

  @override
  List<Object> get props => [storage];
}

class StorageOperationInProgress extends StorageState {}

class StorageOperationSuccess extends StorageState {}

class StorageOperationFailure extends StorageState {
  final Failure failure;

  const StorageOperationFailure(this.failure);

  @override
  List<Object> get props => [failure];
}

class QuantityAvailabilityChecked extends StorageState {
  final bool isAvailable;

  const QuantityAvailabilityChecked(this.isAvailable);

  @override
  List<Object> get props => [isAvailable];
}