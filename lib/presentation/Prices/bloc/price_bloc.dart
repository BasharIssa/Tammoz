// lib/presentation/bloc/price/price_bloc.dart

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_tammoz_chat/domain/entities/price.dart';
import 'package:local_tammoz_chat/domain/repositories/price_repository.dart';

part 'price_events.dart';
part 'price_states.dart';

class PriceBloc extends Bloc<PriceEvent, PriceState> {
  final PriceRepository _priceRepository;

  PriceBloc(this._priceRepository) : super(PriceInitial()) {
    on<LoadAllPrices>(_onLoadAllPrices);
    on<LoadPriceById>(_onLoadPriceById);
    on<InsertPrice>(_onInsertPrice);
    on<UpdatePrice>(_onUpdatePrice);
    on<DeletePrice>(_onDeletePrice);
  }

  Future<void> _onLoadAllPrices(
      LoadAllPrices event,
      Emitter<PriceState> emit,
      ) async {
    emit(PriceLoading());
    try {
      final prices = await _priceRepository.getAllPrices();
      emit(PriceLoadSuccess(prices));
    } catch (e) {
      emit(PriceError('لم نتمكن من تحميل كل الاسعار'));
    }
  }

  Future<void> _onLoadPriceById(
      LoadPriceById event,
      Emitter<PriceState> emit,
      ) async {
    emit(PriceLoading());
    try {
      final price = await _priceRepository.getPriceById(event.id);
      if (price != null) {
        emit(PriceLoadSuccess([price]));
      } else {
        emit(PriceError("لا يوجد سعر موافق للمعرف المدخل"));
      }
    } catch (e) {
      emit(PriceError("لم نتمكن من الوصول الى السعر عن طريق المعرف"));
    }
  }

  Future<void> _onInsertPrice(
      InsertPrice event,
      Emitter<PriceState> emit,
      ) async {
    emit(PriceLoading());
    try {
      await _priceRepository.insertPrice(event.price);
      final prices = await _priceRepository.getAllPrices();
      emit(PriceLoadSuccess(prices));
    } catch (e) {
      emit(PriceError("لم نتمكن من اضافة السعر"));
    }
  }

  Future<void> _onUpdatePrice(
      UpdatePrice event,
      Emitter<PriceState> emit,
      ) async {
    emit(PriceLoading());
    try {
      final result = await _priceRepository.updatePrice(event.price);
      result.fold(
            (failure) => emit(PriceError(failure.message)),
            (_) async {
              final prices = await _priceRepository.getAllPrices();
              emit(PriceLoadSuccess(prices));
            },
      );
    } catch (e) {
      emit(PriceError("لم نتمكن من تحديث السعر"));
    }
  }

  Future<void> _onDeletePrice(
      DeletePrice event,
      Emitter<PriceState> emit,
      ) async {
    emit(PriceLoading());
    try {
      final success = await _priceRepository.deletePrice(event.id);
      if (success) {
        final prices = await _priceRepository.getAllPrices();
        emit(PriceLoadSuccess(prices));
      } else {
        emit(PriceError("لم نتمكن من حذف السجل"));
      }
    } catch (e) {
      emit(PriceError("حدث خطأ غير متوقع! لم نتمكن من حذف السعر"));
    }
  }
}
