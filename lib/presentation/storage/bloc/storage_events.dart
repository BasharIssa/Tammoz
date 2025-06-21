// storage_event.dart

part of 'storage_bloc.dart';

abstract class StorageEvent extends Equatable {
  const StorageEvent();

  @override
  List<Object> get props => [];
}

class LoadAllStorages extends StorageEvent {
  const LoadAllStorages();
}

class LoadStorageById extends StorageEvent {
  final int id;

  const LoadStorageById(this.id);

  @override
  List<Object> get props => [id];
}

class AddStorage extends StorageEvent {
  final Storage storage;

  const AddStorage(this.storage);

  @override
  List<Object> get props => [storage];
}

class UpdateStorage extends StorageEvent {
  final Storage storage;

  const UpdateStorage(this.storage);

  @override
  List<Object> get props => [storage];
}

class DeleteStorage extends StorageEvent {
  final int id;

  const DeleteStorage(this.id);

  @override
  List<Object> get props => [id];
}

class IncreaseQuantity extends StorageEvent {
  final int storageId;
  final int amount;

  const IncreaseQuantity({required this.storageId, required this.amount});

  @override
  List<Object> get props => [storageId, amount];
}

class DecreaseQuantity extends StorageEvent {
  final int storageId;
  final int amount;

  const DecreaseQuantity({required this.storageId, required this.amount});

  @override
  List<Object> get props => [storageId, amount];
}

class SearchStorages extends StorageEvent {
  final String? plantType;
  final String? plantShape;

  const SearchStorages({this.plantType, this.plantShape});

  @override
  List<Object> get props => [
    if (plantType != null) plantType!,
    if (plantShape != null) plantShape!,
  ];
}

class CheckQuantityAvailability extends StorageEvent {
  final int storageId;
  final int requiredQuantity;

  const CheckQuantityAvailability({
    required this.storageId,
    required this.requiredQuantity,
  });

  @override
  List<Object> get props => [storageId, requiredQuantity];
}