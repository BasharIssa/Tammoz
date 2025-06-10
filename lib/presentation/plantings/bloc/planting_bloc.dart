// lib/presentation/planting/bloc/planting_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_tammoz_chat/domain/repositories/planting_repository.dart';
import 'planting_events.dart';
import 'planting_states.dart';

class PlantingBloc extends Bloc<PlantingEvent, PlantingState> {
  final PlantingRepository repository;

  PlantingBloc(this.repository) : super(PlantingInitial()) {
    on<LoadPlantings>((event, emit) async {
      emit(PlantingLoading());
      try {
        final plantings = await repository.getAllPlantings();
        emit(PlantingLoaded(plantings));
      } catch (e) {
        emit(PlantingError('فشل تحميل النباتات: $e'));
      }
    });

    on<AddPlanting>((event, emit) async {
      try {
        await repository.addPlanting(event.planting);
        add(LoadPlantings());
      } catch (e) {
        emit(PlantingError('فشل إضافة النبات: $e'));
      }
    });

    on<UpdatePlanting>((event, emit) async {
      try {
        await repository.updatePlanting(event.planting);
        add(LoadPlantings());
      } catch (e) {
        emit(PlantingError('فشل تحديث النبات: $e'));
      }
    });

    on<DeletePlanting>((event, emit) async {
      try {
        await repository.deletePlanting(event.id);
        add(LoadPlantings());
      } catch (e) {
        emit(PlantingError('فشل حذف النبات: $e'));
      }
    });
  }
}
