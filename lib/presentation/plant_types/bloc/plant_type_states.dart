// lib/presentation/plant_type/bloc/plant_type_states.dart

import 'package:equatable/equatable.dart';
import 'package:local_tammoz_chat/domain/entities/plant_type.dart';

abstract class PlantTypeState extends Equatable {
  const PlantTypeState();

  @override
  List<Object?> get props => [];
}
class PlantTypeEmpty extends PlantTypeState {}

class PlantTypeInitial extends PlantTypeState {}

class PlantTypeLoading extends PlantTypeState {}

class PlantTypeLoaded extends PlantTypeState {
  final List<PlantType> plantTypes;

  const PlantTypeLoaded(this.plantTypes);

  @override
  List<Object?> get props => [plantTypes];
}
class PlantTypeAdded extends PlantTypeState {
  final PlantType plantType;
  const PlantTypeAdded(this.plantType);

  @override
  List<Object> get props => [plantType];
}
class PlantTypeError extends PlantTypeState {
  final String message;

  const PlantTypeError(this.message);

  @override
  List<Object?> get props => [message];
}
