import 'package:dartz/dartz.dart';
import 'package:local_tammoz_chat/constants.dart';
import 'package:local_tammoz_chat/domain/entities/operation.dart';
import 'package:local_tammoz_chat/domain/failures/failures.dart';
import 'package:local_tammoz_chat/domain/repositories/operation_repository.dart';
import 'package:local_tammoz_chat/domain/repositories/storage_repository.dart';

import '../../entities/storage.dart';
import '../../failures/operation_failures.dart';
import '../../failures/storage_failures.dart';

class AddOperationAndUpdateStorageUseCase {
  final OperationRepository operationRepository;
  final StorageRepository storageRepository;

  AddOperationAndUpdateStorageUseCase({
    required this.operationRepository,
    required this.storageRepository,
  });

  Future<Either<Failure, Unit>> call(
      Operation operation, int? firstStorageId, int? secondStorageId) async {
    return operationRepository.runInTransaction(() async {
      final addResult = await operationRepository.addOperation(operation);
      return await addResult.fold(
        (failure) => Left(failure),
        (operationId) async {
          return await _handleStorage(
              operation.copyWith(id: operationId), firstStorageId, secondStorageId);
        },
      );
    });
  }

  Future<Either<Failure, Unit>> _handleStorage(Operation operation,
      int? firstStorageId, int? secondStorageId) async {
    try {
      final opType = operation.operationType.name;
      final firstShapeName = operation.firstShape.name;
      final firstQty = operation.quantity;
      final successRatio = operation.operationType.successRatio;
      final firstPlantTypeName = operation.firstType.name;
      final opDate = operation.date;
      switch (opType) {
        case OperationTypesConstants.planting:
          return _handlePlanting(
              firstPlantTypeName, firstShapeName, firstQty, successRatio, opType, opDate);
        case OperationTypesConstants.pruning:
          if (firstStorageId == null) {
            return Left(OperationValidationFailure(
                message: 'لا يمكن تطبيق عملية القص وسجل المخزن غير محدد'));
          }
          return _handlePruning(firstPlantTypeName, firstShapeName, firstQty, successRatio,
              opType, opDate, firstStorageId);
        case OperationTypesConstants.grafting:
          return _handleGrafting(operation, firstStorageId, secondStorageId);
        default:
          return Left(
              StorageFailure(message: 'نوع العملية غير مدعوم'));
      }
    } catch (e) {
      return Left(OperationDatabaseFailure(
          message: 'خطأ أثناء تحديث المخزون: ${e.toString()}'));
    }
  }

  Future<Either<Failure, Unit>> _handlePlanting(
    String plantTypeName,
    String shapeName,
    int qty,
    double successRatio,
    String operationType,
    DateTime operationDate,
  ) async {
    final int adjustedQty = (qty * successRatio).floor();

    switch (shapeName) {
      case PlantShapesConstants.wildSeed:
        return storageRepository.addStorage(
          Storage(
            parentOperationName: operationType,
            parentOperationDate: operationDate,
            plantShape: PlantShapesConstants.origin,
            plantType: plantTypeName,
            quantity: adjustedQty,
          ),
        ).then((either) => either.map((_) => unit));

      case PlantShapesConstants.cultivatedSeed:
        return storageRepository.addStorage(
          Storage(
            parentOperationName: operationType,
            parentOperationDate: operationDate,
            plantShape: PlantShapesConstants.seedling,
            plantType: plantTypeName,
            quantity: adjustedQty,
          ),
        ).then((either) => either.map((_) => unit));

      default:
        return Left(StorageFailure(
            message: 'شكل النبات غير مدعوم في الزراعة'));
    }
  }

  Future<Either<Failure, Unit>> _handlePruning(
      String plantTypeName,
      String shapeName,
      int qty,
      double successRatio,
      String operationName,
      DateTime operationDate,
      int prunedStorageId,
      ) async {
    final res1 = await storageRepository.decreaseQuantity(
      storageId: prunedStorageId,
      amount: qty,
    );
    if (res1.isLeft()) return res1;

    if (shapeName == PlantShapesConstants.seedling) {
      final res2 = await storageRepository.addStorage(
        Storage(
          plantType: plantTypeName,
          plantShape: PlantShapesConstants.qarmah,
          quantity: qty,
          parentOperationName: operationName,
          parentOperationDate: operationDate,
        ),
      ).then((either) => either.map((_) => unit));
      if (res2.isLeft()) return res2;

      final rasiyaQty = (qty * successRatio).round();
      return storageRepository.addStorage(
        Storage(
          plantType: plantTypeName,
          plantShape: PlantShapesConstants.rasiya,
          quantity: rasiyaQty,
          parentOperationName: operationName,
          parentOperationDate: operationDate,
        ),
      ).then((either) => either.map((_) => unit));
    } else if (shapeName == PlantShapesConstants.rasiya) {
      final res2 = await storageRepository.addStorage(
        Storage(
          plantType: plantTypeName,
          plantShape: PlantShapesConstants.falqa,
          quantity: qty,
          parentOperationName: operationName,
          parentOperationDate: operationDate,
        ),
      ).then((either) => either.map((_) => unit));
      if (res2.isLeft()) return res2;

      final rasiyaRasiyaQty = (qty * successRatio).round();
      return storageRepository.addStorage(
        Storage(
          plantType: plantTypeName,
          plantShape: PlantShapesConstants.rasiyaRasiya,
          quantity: rasiyaRasiyaQty,
          parentOperationName: operationName,
          parentOperationDate: operationDate,
        ),
      ).then((either) => either.map((_) => unit));
    }

    return Left(
      StorageFailure(message: 'شكل النبات غير مدعوم في القص'),
    );
  }

  Future<Either<Failure, Unit>> _handleGrafting(
      Operation operation,
      int? headStorageId,
      int? rootStorageId
      ) async {
    final rootTypeName  = operation.secondType?.name;
    final rootShapeName = operation.secondShape?.name;
    if(rootTypeName == null || rootShapeName == null){
      return Left(OperationValidationFailure(message: 'لم يتم تحديد نوع وشكل الجذر'));
    }
      
    final headTypeName = operation.firstType.name;
    final headShapeName = operation.firstShape.name;

    if(headStorageId == null || rootStorageId == null) {
      return Left(OperationValidationFailure(message: 'لم يتم تحديد سجلين في المستودع لعملية التطعيم هضه'));
    }
    //decreases
    final res1 = await storageRepository.decreaseQuantity(
        storageId: headStorageId, amount: operation.quantity);
    if (res1.isLeft()) return res1;
    final res2 = await storageRepository.decreaseQuantity(
        storageId: rootStorageId, amount: operation.quantity);
    if (res2.isLeft()) return res2;

    //adding
    //الشكل المطعم نحدده  عن طريق تحديد الطعم اولا ثم الجذر ثم تطبيق تابع الدمج عليهما

    // head handling
    {
      String? shapeOfRootOfHead =
      PlantShapesConstants.rootOf(headShapeName);
      Storage? rootOfHead = shapeOfRootOfHead != null
          ? Storage(
          parentOperationName: operation.operationType.name,
          parentOperationDate: operation.date,
          plantShape: shapeOfRootOfHead,
          plantType: headTypeName,
          quantity: operation.quantity)
          : null;
      if (rootOfHead != null) {
        final res31 = await storageRepository
            .addStorage(rootOfHead)
            .then((either) => either.map((_) => unit));
        if (res31.isLeft()) return res31;
      }
    }

    // root handling
    {
      String? shapeOfHeadOfRoot =
      PlantShapesConstants.headOf(rootShapeName);
      final Storage? headOfRoot = shapeOfHeadOfRoot != null
          ? Storage(
        plantShape: shapeOfHeadOfRoot,
        plantType: rootTypeName,
        quantity: (operation.quantity * operation.operationType.successRatio)
            .round(),
        parentOperationDate: operation.date,
        parentOperationName: operation.operationType.name,
      )
          : null;
      if (headOfRoot != null) {
        final res32 = await storageRepository
            .addStorage(headOfRoot)
            .then((either) => either.map((_) => unit));
        if (res32.isLeft()) return res32;
      }
    }

    //grafting handling
    final String headShapeForGrafting =headShapeName;
    final String  rootShapeForGrafting = rootShapeName;
    final String graftingShape = PlantShapesConstants.mergeForGrafting(
      headShapeForGrafting,
      rootShapeForGrafting);
    final Storage graftingStorage = Storage(
      parentOperationName: operation.operationType.name,
      parentOperationDate: operation.date,
      quantity: (operation.quantity * operation.operationType.successRatio).round(),
      plantType: headTypeName,
      plantShape: graftingShape,
    );
    final res4 = await storageRepository.addStorage(graftingStorage)
      .then((either) => either.map((_) => unit));
    return res4;
  }



}
