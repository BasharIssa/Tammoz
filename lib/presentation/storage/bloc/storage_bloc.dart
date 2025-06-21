//lib/presentation/storage/bloc/storage_bloc.dart

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/failures/storage_failures.dart';
import 'package:equatable/equatable.dart';
import 'package:local_tammoz_chat/domain/entities/storage.dart';
import 'package:local_tammoz_chat/domain/failures/failures.dart';
import 'package:local_tammoz_chat/domain/repositories/storage_repository.dart';

part 'storage_events.dart';
part 'storage_states.dart';

/// Bloc لإدارة عمليات التخزين المختلفة
class StorageBloc extends Bloc<StorageEvent, StorageState> {
  final StorageRepository storageRepository;

  StorageBloc( this.storageRepository) : super(StorageInitial()) {
    on<LoadAllStorages>(_onLoadAllStorages);
    on<LoadStorageById>(_onLoadStorageById);
    on<AddStorage>(_onAddStorage);
    on<UpdateStorage>(_onUpdateStorage);
    on<DeleteStorage>(_onDeleteStorage);
    on<IncreaseQuantity>(_onIncreaseQuantity);
    on<DecreaseQuantity>(_onDecreaseQuantity);
    on<SearchStorages>(_onSearchStorages);
    on<CheckQuantityAvailability>(_onCheckQuantityAvailability);
  }

  /// تحميل كل التخزينات
  Future<void> _onLoadAllStorages(
      LoadAllStorages event,
      Emitter<StorageState> emit,
      ) async {
    emit(StorageLoading());
    final result = await storageRepository.getAllStorages();
    emit(_handleStorageListResult(result));
  }

  /// تحميل تخزين محدد حسب المعرف
  Future<void> _onLoadStorageById(
      LoadStorageById event,
      Emitter<StorageState> emit,
      ) async {
    emit(StorageLoading());
    final result = await storageRepository.getStorageById(event.id);
    emit(_handleStorageResult(result));
  }

  /// إضافة تخزين جديد
  Future<void> _onAddStorage(
      AddStorage event,
      Emitter<StorageState> emit,
      ) async {
    emit(StorageOperationInProgress());
    final result = await storageRepository.addStorage(event.storage);
    emit(_handleStorageOperationResult(result));
  }

  /// تحديث تخزين موجود
  Future<void> _onUpdateStorage(
      UpdateStorage event,
      Emitter<StorageState> emit,
      ) async {
    emit(StorageOperationInProgress());
    final result = await storageRepository.updateStorage(event.storage);
    emit(_handleStorageOperationResult(result));
  }

  /// حذف تخزين
  Future<void> _onDeleteStorage(
      DeleteStorage event,
      Emitter<StorageState> emit,
      ) async {
    emit(StorageOperationInProgress());
    final result = await storageRepository.deleteStorage(event.id);
    emit(_handleStorageOperationResult(result));
  }

  /// زيادة كمية التخزين
  Future<void> _onIncreaseQuantity(
      IncreaseQuantity event,
      Emitter<StorageState> emit,
      ) async {
    emit(StorageOperationInProgress());
    final result = await storageRepository.increaseQuantity(
      storageId: event.storageId,
      amount: event.amount,
    );
    emit(_handleStorageOperationResult(result));
  }

  /// نقصان كمية التخزين
  Future<void> _onDecreaseQuantity(
      DecreaseQuantity event,
      Emitter<StorageState> emit,
      ) async {
    emit(StorageOperationInProgress());
    final result = await storageRepository.decreaseQuantity(
      storageId: event.storageId,
      amount: event.amount,
    );
    emit(_handleStorageOperationResult(result));
  }

  /// البحث في التخزينات حسب نوع وشكل النبات
  Future<void> _onSearchStorages(
      SearchStorages event,
      Emitter<StorageState> emit,
      ) async {
    emit(StorageLoading());
    final result = await storageRepository.searchStorages(
      plantType: event.plantType,
      plantShape: event.plantShape,
    );
    emit(_handleStorageListResult(result));
  }

  /// فحص توفر الكمية المطلوبة في التخزين
  Future<void> _onCheckQuantityAvailability(
      CheckQuantityAvailability event,
      Emitter<StorageState> emit,
      ) async {
    emit(StorageLoading());
    final result = await storageRepository.checkQuantityAvailability(
      storageId: event.storageId,
      requiredQuantity: event.requiredQuantity,
    );
    emit(_handleQuantityCheckResult(result));
  }

  /// توحيد التعامل مع نتائج قائمة التخزينات
// This method centralizes the handling of storage list results
  // to ensure consistent error handling and state emission
  StorageState _handleStorageListResult(
      Either<Failure, List<Storage>> result,
      ) {
    return result.fold(
          (failure) => StorageOperationFailure(failure),
          (storages) => StorageLoaded(storages),
    );
  }

  StorageState _handleStorageResult(
      Either<Failure, Storage> result,
      ) {
    return result.fold(
          (failure) => StorageOperationFailure(failure is StorageFailure
          ? failure
          : StorageFailure(message: failure.message)),
          (storage) => SingleStorageLoaded(storage),
    );
  }
  /// توحيد التعامل مع نتائج العمليات (إضافة، تعديل، حذف، تحديث كميات)
  StorageState _handleStorageOperationResult(
      Either<Failure, dynamic> result,
      ) {
    return result.fold(
          (failure) => StorageOperationFailure(failure is StorageFailure
          ? failure
          : StorageFailure(message: failure.message)),
          (_) => StorageOperationSuccess(),
    );
  }

  /// توحيد التعامل مع نتائج فحص توفر الكمية
  StorageState _handleQuantityCheckResult(
      Either<Failure, bool> result,
      ) {
    return result.fold(
          (failure) => StorageOperationFailure(failure),
          (isAvailable) => QuantityAvailabilityChecked(isAvailable),
    );
  }


}