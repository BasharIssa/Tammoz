// storage_event.dart

part of 'storage_bloc.dart';

abstract class StorageEvent extends Equatable {
  const StorageEvent();

  @override
  List<Object?> get props => [];
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
// storage_events.dart


//
// // استبدال AddStorage لتأخذ بيانات الإدخال فقط
// //بحاجة اكمال Tider 7-25
// class AddStorage extends StorageEvent {
//   final String plantTypeName;
//   final String plantShapeName;
//   final int quantity;
//   final String notes;
//   final int parentOperationId;
//   final DateTime parentOperationDate;
//   final String parentOperationName;
//   final bool isScheduled;
//   // في حال أردت يمكن إضافة معرف `id` إذا ضروري للتحديث (عادة يكون null في الإضافة)
//
//   const AddStorage({
//     required this.plantType,
//     required this.plantShape,
//     required this.quantity,
//     required this.notes,
//     required this.parentOperationId,
//     required this.parentOperationDate,
//     required this.parentOperationName,
//     required this.isScheduled,
//   });
//
//   @override
//   List<Object?> get props => [
//     plantType,
//     plantShape,
//     quantity,
//     notes,
//     parentOperationId,
//     parentOperationDate,
//     parentOperationName,
//     isScheduled,
//   ];
// }
//
// // استبدال UpdateStorage بشكل مشابه، مع تضمين id
// class UpdateStorage extends StorageEvent {
//   final int id;
//   final String plantType;
//   final String plantShape;
//   final int quantity;
//   final String notes;
//   final int parentOperationId;
//   final DateTime parentOperationDate;
//   final String parentOperationName;
//   final bool isScheduled;
//
//   const UpdateStorage({
//     required this.id,
//     required this.plantType,
//     required this.plantShape,
//     required this.quantity,
//     required this.notes,
//     required this.parentOperationId,
//     required this.parentOperationDate,
//     required this.parentOperationName,
//     required this.isScheduled,
//   });
//
//   @override
//   List<Object?> get props =>
//       [
//         id,
//         plantType,
//         plantShape,
//         quantity,
//         notes,
//         parentOperationId,
//         parentOperationDate,
//         parentOperationName,
//         isScheduled,
//       ];
// }
//

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
  final String? plantTypeName;
  final String? plantShapeName;

  const SearchStorages({this.plantTypeName, this.plantShapeName});

  @override
  List<Object> get props => [
    if (plantTypeName != null) plantTypeName!,
    if (plantShapeName != null) plantShapeName!,
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