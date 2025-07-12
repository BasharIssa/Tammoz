import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_tammoz_chat/domain/entities/operation_type.dart';
import 'package:local_tammoz_chat/domain/entities/plant_type.dart';
import 'package:local_tammoz_chat/domain/entities/plant_shape.dart';
import 'package:local_tammoz_chat/domain/repositories/operation_repository.dart';

part 'operation_related_data_states.dart';


class OperationRelatedDataCubit extends Cubit<OperationRelatedDataState> {
  final OperationRepository operationRepository;

  OperationRelatedDataCubit(this.operationRepository) : super(OperationRelatedDataState());

  Future<void> loadFormData() async {
    emit(state.copyWith(isLoading: true, error: null));

    final opTypesResult = await operationRepository.getAllOperationsTypes();
    final plantTypesResult = await operationRepository.getAllPlantTypes();
    final plantShapesResult = await operationRepository.getAllPlantShapes();

    opTypesResult.fold(
          (failure) => emit(state.copyWith(isLoading: false, error: failure.message)),
          (opTypes) {
        plantTypesResult.fold(
              (failure) => emit(state.copyWith(isLoading: false, error: failure.message)),
              (plantTypes) {
            plantShapesResult.fold(
                  (failure) => emit(state.copyWith(isLoading: false, error: failure.message)),
                  (plantShapes) {
                    final plantSeedsResult = plantShapes.where((shape) => shape.name.contains('بذرة')).toList();
                emit(state.copyWith(
                  isLoading: false,
                  operationTypes: opTypes,
                  plantTypes: plantTypes,
                  plantShapes: plantShapes,
                  error: null,
                ));
              },
            );
          },
        );
      },
    );
  }

  /// دالة مساعدة للبحث عن نوع العملية بناءً على الاسم النصي
  /// تعيد null إذا لم تجد النوع
  OperationType? findOperationTypeByName(String name) {
    try {
      return state.operationTypes.firstWhere((opType) => opType.name == name);
    } catch (_) {
      return null;
    }
  }
}
