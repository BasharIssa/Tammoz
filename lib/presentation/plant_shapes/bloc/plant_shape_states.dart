import 'package:equatable/equatable.dart';
import 'package:local_tammoz_chat/domain/entities/plant_shape.dart';

abstract class PlantShapeStates extends Equatable {
  const PlantShapeStates();

  @override
  List<Object?> get props => [];
}

class PlantShapesInitial extends PlantShapeStates {}

class PlantShapesLoading extends PlantShapeStates {}

class PlantShapesLoaded extends PlantShapeStates {
  final List<PlantShape> plantShapes;

  const PlantShapesLoaded(this.plantShapes);

  @override
  List<Object?> get props => [plantShapes];
}

class PlantShapesError extends PlantShapeStates {
  final String message;

  const PlantShapesError(this.message);

  @override
  List<Object?> get props => [message];
}
