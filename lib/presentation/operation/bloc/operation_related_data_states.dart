
part of 'operation_related_data_cubit.dart';


class OperationRelatedDataState {
  final List<OperationType> operationTypes;
  final List<PlantType> plantTypes;
  final List<PlantShape> plantShapes;
  final bool isLoading;
  final String? error;

  OperationRelatedDataState({
    this.operationTypes = const [],
    this.plantTypes = const [],
    this.plantShapes = const [],
    this.isLoading = false,
    this.error,
  });

  OperationRelatedDataState copyWith({
    List<OperationType>? operationTypes,
    List<PlantType>? plantTypes,
    List<PlantShape>? plantShapes,
    bool? isLoading,
    String? error,
  }) {
    return OperationRelatedDataState(
      operationTypes: operationTypes ?? this.operationTypes,
      plantTypes: plantTypes ?? this.plantTypes,
      plantShapes: plantShapes ?? this.plantShapes,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}