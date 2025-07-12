
part of 'operation_related_data_cubit.dart';


class OperationRelatedDataState {
  final List<OperationType> operationTypes;
  final List<PlantType> plantTypes;
  final List<PlantShape> plantShapes;
  final List<PlantShape> plantSeeds;
  final bool isLoading;
  final String? error;

  OperationRelatedDataState( {
    this.operationTypes = const [],
    this.plantTypes = const [],
    this.plantShapes = const [],
    this.plantSeeds = const [],
    this.isLoading = false,
    this.error,
  });

  OperationRelatedDataState copyWith({
    List<OperationType>? operationTypes,
    List<PlantType>? plantTypes,
    List<PlantShape>? plantShapes,
    List<PlantShape>? plantSeeds,
    bool? isLoading,
    String? error,
  }) {
    return OperationRelatedDataState(
      operationTypes: operationTypes ?? this.operationTypes,
      plantTypes: plantTypes ?? this.plantTypes,
      plantShapes: plantShapes ?? this.plantShapes,
      plantSeeds: plantSeeds ?? this.plantSeeds,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}