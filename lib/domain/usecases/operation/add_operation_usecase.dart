import 'package:dartz/dartz.dart';
import 'package:local_tammoz_chat/constants.dart';
import 'package:local_tammoz_chat/data/mappers/operation_mapper.dart';
import 'package:local_tammoz_chat/domain/entities/operation.dart';
import 'package:local_tammoz_chat/domain/entities/operation_brief.dart';
import 'package:local_tammoz_chat/domain/entities/plant_shape.dart';
import 'package:local_tammoz_chat/domain/entities/plant_type.dart';
import 'package:local_tammoz_chat/domain/failures/failures.dart';
import 'package:local_tammoz_chat/domain/repositories/operation_repository.dart';
import 'package:local_tammoz_chat/domain/repositories/plant_shape_repository.dart';
import 'package:local_tammoz_chat/domain/repositories/plant_type_repository.dart';
import 'package:local_tammoz_chat/domain/repositories/storage_repository.dart';
import 'package:local_tammoz_chat/domain/usecases/storage/add_storage_usecase.dart';
import '../../failures/operation_failures.dart';
import '../../failures/storage_failures.dart';

class AddOperationAndUpdateStorageUseCase {
  final OperationRepository operationRepository;
  final StorageRepository storageRepository;
  final PlantShapeRepository plantShapeRepository;
  final PlantTypeRerpository plantTypeRerpository;
  final AddStorageUseCase addStorageUseCase;
  AddOperationAndUpdateStorageUseCase({
    required this.plantShapeRepository,
    required this.plantTypeRerpository,
    required this.operationRepository,
    required this.storageRepository,
    required this.addStorageUseCase,
  });

  Future<Either<Failure, Unit>> call(
      Operation operation, int? firstStorageId, int? secondStorageId) async {
    return operationRepository.runInTransaction(() async {
      final addResult = await operationRepository.addOperation(operation);
      return await addResult.fold(
        (failure) => Left(failure),
        (operationId) async {
          return await _handleStorage(operation.copyWith(id: operationId),
              firstStorageId, secondStorageId);
        },
      );
    });
  }

  Future<Either<Failure, Unit>> _handleStorage(
      Operation operation, int? firstStorageId, int? secondStorageId) async {
    try {
      final opType = operation.operationType.name;
      final firstShapeName = operation.firstShape.name;
      final firstQty = operation.quantity;
      final successRatio = operation.operationType.successRatio;
      final opIsScheduled = operation.isScheduled;
      switch (opType) {
        case OperationTypesConstants.planting:
          return _handlePlanting(
              operation.firstType,
              operation.firstShape,
              firstQty,
              successRatio, OperationMapper.entityToBriefEntity(operation),
              opIsScheduled
          );
        case OperationTypesConstants.pruning:
          if (firstStorageId == null) {
            return Left(OperationValidationFailure(
                message: 'لا يمكن تطبيق عملية القص وسجل المخزن غير محدد'));
          }
          return _handlePruning(
              operation.firstType,
              firstQty,
              successRatio,
              OperationMapper.entityToBriefEntity(operation),
              opIsScheduled,
              firstShapeName,
              firstStorageId);
        case OperationTypesConstants.grafting:
          return _handleGrafting(operation, firstStorageId, secondStorageId);
        default:
          return Left(StorageFailure(message: 'نوع العملية غير مدعوم'));
      }
    } catch (e) {
      return Left(OperationDatabaseFailure(
          message: 'خطأ أثناء تحديث المخزون: ${e.toString()}'));
    }
  }

  Future<Either<Failure, Unit>> _handlePlanting(
    PlantType plantType,
    PlantShape plantShape,
    int qty,
    double successRatio,
    OperationBrief operationBrief,
    bool isScheduled,
  ) async {
    final int adjustedQty = (qty * successRatio).floor();
    String toFindShapeName;

    switch (plantShape.name) {
      case PlantShapesConstants.wildSeed:
        toFindShapeName = PlantShapesConstants.origin;

      case PlantShapesConstants.cultivatedSeed:
        toFindShapeName = PlantShapesConstants.seedling;

      default:
        return Left(StorageFailure(message: 'شكل النبات غير مدعوم في الزراعة'));
    }

    return await addStorageUseCase(
        shapeName: toFindShapeName,
        plantType: plantType,
        operationBrief: operationBrief,
        quantity: adjustedQty,
        isScheduled: isScheduled).then((either) => either.map((_) => unit));
  }


  Future<Either<Failure, Unit>> _handlePruning(
      PlantType plantType,
      int qty,
      double successRatio,
      OperationBrief operationBrief,
      bool isScheduled,
      String shapeName,
      int prunedStorageId,
      ) async {
    final res1 = await storageRepository.decreaseQuantity(
      storageId: prunedStorageId,
      amount: qty,
    );
    if (res1.isLeft()) return res1;

    late final String toAddHeadShapeName;
    late final String toAddRootShapeName;
    final toAddHeadQuantity = (qty * successRatio).round();
    final toAddRootquantity = qty;

    if (shapeName == PlantShapesConstants.seedling) {
      toAddHeadShapeName = PlantShapesConstants.rasiya;
      toAddRootShapeName = PlantShapesConstants.qarmah;
    } else if (shapeName == PlantShapesConstants.rasiya) {
      toAddRootShapeName = PlantShapesConstants.falqa;
      toAddHeadShapeName = PlantShapesConstants.rasiyaRasiya;
    } else {
      return Left(
        StorageFailure(message: 'شكل النبات غير مدعوم في القص'),
      );
    }

    final res2 = await  addStorageUseCase(
        shapeName: toAddRootShapeName,
        plantType: plantType,
        operationBrief: operationBrief,
        quantity: toAddRootquantity,
        isScheduled: isScheduled).then((either) => either.map((_) => unit));

    if (res2.isLeft()) return res2;

    final res3 = await  addStorageUseCase(
        shapeName: toAddHeadShapeName,
        plantType: plantType,
        operationBrief: operationBrief,
        quantity: toAddHeadQuantity,
        isScheduled: isScheduled).then((either) => either.map((_) => unit));

    return res3;
  }


  Future<Either<Failure, Unit>> _handleGrafting(
      Operation operation, int? headStorageId, int? rootStorageId) async {
    final rootTypeName = operation.secondType?.name;
    final rootShapeName = operation.secondShape?.name;
    if (rootTypeName == null || rootShapeName == null) {
      return Left(
          OperationValidationFailure(message: 'لم يتم تحديد نوع وشكل الجذر'));
    }

    final headShapeName = operation.firstShape.name;

    if (headStorageId == null || rootStorageId == null) {
      return Left(OperationValidationFailure(
          message: 'لم يتم تحديد سجلين في المستودع لعملية التطعيم '));
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
      String? shapeNameOfRootOfHead = PlantShapesConstants.rootOf(headShapeName);

      if (shapeNameOfRootOfHead != null) {
        final res31 = await addStorageUseCase(
            shapeName: shapeNameOfRootOfHead,
            plantType: operation.firstType,
            operationBrief: OperationMapper.entityToBriefEntity(operation),
            quantity:  operation.quantity,
            isScheduled: operation.isScheduled).then((either) => either.map((_) => unit));

        if (res31.isLeft()) return res31;
      }
    }

    // root handling
    {
      String? shapeOfHeadOfRoot = PlantShapesConstants.headOf(rootShapeName);

      if (shapeOfHeadOfRoot != null) {
        final res32 = await addStorageUseCase(
            shapeName: shapeOfHeadOfRoot,
            plantType: operation.secondType!,
            operationBrief: OperationMapper.entityToBriefEntity(operation),
            quantity:  (operation.quantity
                * OperationTypesConstants.pruningDefaultSuccessRatio).round(),
            isScheduled: operation.isScheduled).then((either) => either.map((_) => unit));

        if (res32.isLeft()) return res32;
      }
    }

    //grafting handling
    final String graftingShape = PlantShapesConstants.mergeForGrafting(
        headShapeName, rootShapeName);

    final res4 = await addStorageUseCase(
        shapeName: graftingShape,
        plantType: operation.firstType,
        operationBrief: OperationMapper.entityToBriefEntity(operation),
        quantity:  (operation.quantity
            * operation.operationType.successRatio).round(),
        isScheduled: operation.isScheduled).then((either) => either.map((_) => unit));

    return res4;
  }

}
