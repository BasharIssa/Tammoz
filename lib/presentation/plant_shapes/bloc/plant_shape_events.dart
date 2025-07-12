import 'package:equatable/equatable.dart';
import 'package:local_tammoz_chat/domain/entities/plant_shape.dart';

abstract class PlantShapeEvent extends Equatable {
  const PlantShapeEvent();

  @override
  List<Object?> get props => [];
}

class LoadPlantShapes extends PlantShapeEvent {}

class AddPlantShape extends PlantShapeEvent {
  final PlantShape plantShape;

  const AddPlantShape(this.plantShape);

  @override
  List<Object?> get props => [plantShape];
}

class UpdatePlantShape extends PlantShapeEvent {
  final PlantShape plantShape;

  const UpdatePlantShape(this.plantShape);

  @override
  List<Object?> get props => [plantShape];
}

class DeletePlantShape extends PlantShapeEvent {
  final int id;

  const DeletePlantShape(this.id);

  @override
  List<Object?> get props => [id];
}