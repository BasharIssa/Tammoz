// lib/domain/usecases/add_storage_usecase.dart
import 'package:dartz/dartz.dart';
import 'package:local_tammoz_chat/domain/entities/operation_brief.dart';
import 'package:local_tammoz_chat/domain/entities/plant_type.dart';
import 'package:local_tammoz_chat/domain/entities/storage.dart';
import 'package:local_tammoz_chat/domain/failures/failures.dart';
import 'package:local_tammoz_chat/domain/repositories/plant_shape_repository.dart';
import 'package:local_tammoz_chat/domain/repositories/storage_repository.dart';

class AddStorageUseCase {
  final PlantShapeRepository plantShapeRepository;
  final StorageRepository storageRepository;

  AddStorageUseCase({
    required this.plantShapeRepository,
    required this.storageRepository,
  });

  Future<Either<Failure, int>> call({
    required String shapeName,
    required PlantType plantType,
    required OperationBrief operationBrief,
    required int quantity,
    required bool isScheduled,
  }) async {
    final findResult = await plantShapeRepository.getPlantShapeByName(shapeName);

    return await findResult.fold(
          (failure) async => Left(failure),

          (foundPlantShape) async {
        return await storageRepository.addStorage(
          Storage(
            plantShape: foundPlantShape,
            plantType: plantType,
            parentOperation: operationBrief,
            quantity: quantity,
            isScheduled: isScheduled,
          ),
        );
      },
    );
  }
}
