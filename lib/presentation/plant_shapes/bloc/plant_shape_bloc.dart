import 'package:bloc/bloc.dart';
import 'package:local_tammoz_chat/domain/failures/failures.dart';
import 'package:local_tammoz_chat/domain/failures/general_failures.dart';
import 'package:local_tammoz_chat/domain/repositories/plant_shape_repository.dart';

import 'plant_shape_events.dart';
import 'plant_shape_states.dart';

class PlantShapeBloc extends Bloc<PlantShapeEvent, PlantShapeStates> {
  final PlantShapeRepository repository;

  PlantShapeBloc({required this.repository}) : super(PlantShapesInitial()) {
    on<LoadPlantShapes>(_onLoadPlantShapes);
    on<AddPlantShape>(_onAddPlantShape);
    on<UpdatePlantShape>(_onUpdatePlantShape);
    on<DeletePlantShape>(_onDeletePlantShape);
  }

  String _mapFailureToMessage(Failure failure) {
    // عدل الرسائل حسب احتياجك
    switch (failure.runtimeType) {
      case ServerFailure _:
        return 'فشل في الاتصال بالخادم، يرجى المحاولة لاحقًا.';
      case CacheFailure _:
        return 'فشل في استرجاع البيانات من التخزين المؤقت.';
      case NotFoundFailure _:
        return 'لم يتم العثور على شكل النبات المطلوب.';
      case InvalidInputFailure _:
        return 'البيانات المدخلة غير صحيحة.';
      default:
        return 'حدث خطأ غير متوقع، يرجى المحاولة لاحقًا.';
    }
  }

  Future<void> _onLoadPlantShapes(
      LoadPlantShapes event, Emitter<PlantShapeStates> emit) async {
    emit(PlantShapesLoading());
    final result = await repository.getAllPlantShapes();
    result.fold(
          (failure) => emit(PlantShapesError(_mapFailureToMessage(failure))),
          (plantShapes) => emit(PlantShapesLoaded(plantShapes)),
    );
  }

  Future<void> _onAddPlantShape(
      AddPlantShape event, Emitter<PlantShapeStates> emit) async {
    emit(PlantShapesLoading());
    final result = await repository.addPlantShape(event.plantShape);
    result.fold(
          (failure) => emit(PlantShapesError(_mapFailureToMessage(failure))),
          (_) async {
        // بعد الإضافة نعيد تحميل القائمة
        add(LoadPlantShapes());
      },
    );
  }

  Future<void> _onUpdatePlantShape(
      UpdatePlantShape event, Emitter<PlantShapeStates> emit) async {
    emit(PlantShapesLoading());
    final result = await repository.updatePlantShape(event.plantShape);
    result.fold(
          (failure) => emit(PlantShapesError(_mapFailureToMessage(failure))),
          (_) async {
        // بعد التحديث نعيد تحميل القائمة
        add(LoadPlantShapes());
      },
    );
  }

  Future<void> _onDeletePlantShape(
      DeletePlantShape event, Emitter<PlantShapeStates> emit) async {
    emit(PlantShapesLoading());
    final result = await repository.deletePlantShape(event.id);
    result.fold(
          (failure) => emit(PlantShapesError(_mapFailureToMessage(failure))),
          (_) async {
        // بعد الحذف نعيد تحميل القائمة
        add(LoadPlantShapes());
      },
    );
  }
}
