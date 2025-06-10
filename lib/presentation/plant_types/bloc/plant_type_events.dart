// lib/presentation/plant_type/bloc/plant_type_events.dart

import 'package:equatable/equatable.dart';
import 'package:local_tammoz_chat/domain/entities/plant_type.dart';

abstract class PlantTypeEvent extends Equatable {
  const PlantTypeEvent();

  @override
  List<Object?> get props => [];
}

class LoadPlantTypes extends PlantTypeEvent {}

class AddPlantType extends PlantTypeEvent {
  final PlantType plantType;

  const AddPlantType(this.plantType);

  @override
  List<Object?> get props => [plantType];
}
