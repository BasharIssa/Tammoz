// lib/presentation/bloc/planting_states.dart
import 'package:equatable/equatable.dart';
import 'package:local_tammoz_chat/domain/entities/planting.dart';

abstract class PlantingState extends Equatable {
  const PlantingState();

  @override
  List<Object?> get props => [];
}

class PlantingInitial extends PlantingState {}

class PlantingLoading extends PlantingState {}

class PlantingLoaded extends PlantingState {
  final List<Planting> plantings;

  const PlantingLoaded(this.plantings);

  @override
  List<Object?> get props => [plantings];
}

class PlantingError extends PlantingState {
  final String message;

  const PlantingError(this.message);

  @override
  List<Object?> get props => [message];
}
