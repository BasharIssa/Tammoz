// lib/presentation/plant_type/bloc/plant_type_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_tammoz_chat/domain/repositories/plant_type_repository.dart';
import 'package:local_tammoz_chat/presentation/plant_types/bloc/plant_type_events.dart';
import 'package:local_tammoz_chat/presentation/plant_types/bloc/plant_type_states.dart';

import '../../../domain/entities/plant_type.dart';

class PlantTypeBloc extends Bloc<PlantTypeEvent, PlantTypeState> {
  final PlantTypeRerpository repository;

  PlantTypeBloc(this.repository) : super(PlantTypeInitial()) {
    on<LoadPlantTypes>((event, emit) async {
      emit(PlantTypeLoading());
      try {
        final res = await repository.getAllPlantTypes();
        res.fold(
              (failure) => emit(PlantTypeError(failure.message)),
              (list) {
            if (list.isEmpty) {
              emit(PlantTypeEmpty());
            } else {
              emit(PlantTypeLoaded(list));
            }
          },
        );
      } catch (e) {
        emit(PlantTypeError('فشل تحميل أنواع النباتات'));
      }
    });

    on<AddPlantType>((event, emit) async {
      try {
        final res = await repository.addPlantType(event.plantType);
        res.fold(
              (failure) => emit(PlantTypeError(failure.message)),
              (typeId) {
            final addedPlantType = PlantType(id: typeId, name: event.plantType.name);
            emit(PlantTypeAdded(addedPlantType));
          },
        );
      } catch (e) {
        emit(PlantTypeError('فشل إضافة نوع النبات'));
      }
    });
  }
}

