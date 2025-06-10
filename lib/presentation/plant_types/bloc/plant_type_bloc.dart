// lib/presentation/plant_type/bloc/plant_type_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_tammoz_chat/domain/repositories/planting_repository.dart';
import 'package:local_tammoz_chat/presentation/plant_types/bloc/plant_type_events.dart';
import 'package:local_tammoz_chat/presentation/plant_types/bloc/plant_type_states.dart';

import '../../../domain/entities/plant_type.dart';

class PlantTypeBloc extends Bloc<PlantTypeEvent, PlantTypeState> {
  final PlantingRepository repository ;

  PlantTypeBloc(this.repository) : super(PlantTypeInitial()) {
    on<LoadPlantTypes>((event, emit) async {
      emit(PlantTypeLoading());
      try {
        final plantTypes = await repository.getAllPlantTypes();
        if (plantTypes.isEmpty) {
          emit(PlantTypeEmpty()); // أضف هذه الحالة في states.dart
        } else {
          emit(PlantTypeLoaded(plantTypes));
        }
      } catch (e) {
        emit(PlantTypeError('فشل تحميل أنواع النباتات'));
      }
    });


    on<AddPlantType>((event, emit) async {
      try {
        final typeId =await repository.addPlantType(event.plantType);
        final  PlantType addedPlantType = PlantType (id: typeId, name: event.plantType.name);
        emit(PlantTypeAdded(addedPlantType));
      } catch (e) {
        emit(PlantTypeError('فشل إضافة نوع النبات'));
      }
    });
  }
}
