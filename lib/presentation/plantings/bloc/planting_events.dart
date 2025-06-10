// lib/presentation/plantings/bloc/planting_events.dart

import 'package:equatable/equatable.dart';
import 'package:local_tammoz_chat/domain/entities/planting.dart';

abstract class PlantingEvent extends Equatable {
  const PlantingEvent();

  @override
  List<Object?> get props => [];
}

class LoadPlantings extends PlantingEvent {}

class AddPlanting extends PlantingEvent {
  final Planting planting;

  const AddPlanting(this.planting);

  @override
  List<Object?> get props => [planting];
}

class UpdatePlanting extends PlantingEvent {
  final Planting planting;

  const UpdatePlanting(this.planting);

  @override
  List<Object?> get props => [planting];
}

class DeletePlanting extends PlantingEvent {
  final int id;

  const DeletePlanting(this.id);

  @override
  List<Object?> get props => [id];
}
