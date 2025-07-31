import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:local_tammoz_chat/data/data_sources/firebase_expense_datasource.dart';
import 'package:local_tammoz_chat/data/local/local_database.dart';
import 'package:local_tammoz_chat/data/repositories/operation_repository_impl.dart';
import 'package:local_tammoz_chat/data/repositories/plant_shape_repository_impl.dart';
import 'package:local_tammoz_chat/data/repositories/plant_type_repository_impl.dart';
import 'package:local_tammoz_chat/data/repositories/price_repository_impl.dart';
import 'package:local_tammoz_chat/data/repositories/reservation_repository.dart';
import 'package:local_tammoz_chat/data/repositories/setup_expense_repository_impl.dart';
import 'package:local_tammoz_chat/domain/repositories/operation_repository.dart';
import 'package:local_tammoz_chat/domain/repositories/plant_shape_repository.dart';
import 'package:local_tammoz_chat/domain/repositories/plant_type_repository.dart';
import 'package:local_tammoz_chat/domain/repositories/price_repository.dart';
import 'package:local_tammoz_chat/domain/repositories/reservation_repository.dart';
import 'package:local_tammoz_chat/domain/repositories/setup_expense_repository.dart';
import 'package:local_tammoz_chat/domain/usecases/add_setup_expense.dart';
import 'package:local_tammoz_chat/domain/usecases/delete_setup_expense.dart';
import 'package:local_tammoz_chat/domain/usecases/get_all_setup_expenses.dart';
import 'package:local_tammoz_chat/domain/usecases/operation/add_operation_usecase.dart';
import 'package:local_tammoz_chat/domain/usecases/operation/find_operation_type_usecase.dart';
import 'package:local_tammoz_chat/domain/usecases/reservation/create_reservation_usecase.dart';
import 'package:local_tammoz_chat/domain/usecases/reservation/get_all_reservations_usecase.dart';
import 'package:local_tammoz_chat/domain/usecases/reservation/get_all_slim_reservation_usecase.dart';
import 'package:local_tammoz_chat/domain/usecases/reservation/get_reservation_by_id_usecase.dart';
import 'package:local_tammoz_chat/domain/usecases/storage/add_storage_usecase.dart';
import 'package:local_tammoz_chat/presentation/Prices/bloc/price_bloc.dart';
import 'package:local_tammoz_chat/presentation/expenses/bloc/setup_expense_bloc.dart';
import 'package:local_tammoz_chat/presentation/operation/bloc/operation_bloc.dart';
import 'package:local_tammoz_chat/presentation/operation/bloc/operation_related_data_cubit.dart';
import 'package:local_tammoz_chat/presentation/plant_shapes/bloc/plant_shape_bloc.dart';
import 'package:local_tammoz_chat/presentation/plant_types/bloc/plant_type_bloc.dart';
import 'package:local_tammoz_chat/presentation/reservation/bloc/reservation_bloc.dart';
import 'package:local_tammoz_chat/presentation/storage/bloc/storage_bloc.dart';

import '../../data/repositories/storage_repository_impl.dart';
import '../../domain/repositories/storage_repository.dart';
import '../../domain/usecases/update_setup_expense.dart';
//import 'package:connectivity_plus/connectivity_plus.dart'; // أضيفت حزمة جديدة


final getIt = GetIt.instance;

void setupLocator() {
  // تسجيل FirebaseFirestore كمصدر مشترك يمكن استخدامه في أي مكان
  getIt.registerLazySingleton<FirebaseFirestore>(
          () => FirebaseFirestore.instance
  );

  // تسجيل FirebaseExpenseDataSource
  getIt.registerLazySingleton<FirebaseExpenseDataSource>(
        () => FirebaseExpenseDataSource(),
  );


  // تسجيل قاعدة البيانات
  getIt.registerLazySingleton<LocalDatabase>(() => LocalDatabase());

  // تسجيل المستودعات
  getIt.registerLazySingleton<SetupExpenseRepository>(
        () => SetupExpenseRepositoryImpl(),
  );

getIt.registerLazySingleton<StorageRepository>(
    () => StorageRepositoryImpl(getIt<LocalDatabase>())
);

  getIt.registerLazySingleton<OperationRepository>(() => OperationRepositoryImpl());

  getIt.registerLazySingleton<ReservationRepository>(
          () => ReservationRepositoryImpl(localDatabase: getIt<LocalDatabase>()));

  getIt.registerLazySingleton<PlantShapeRepository>(
      () => PlantShapeRepositoryImpl(getIt<LocalDatabase>())
  );

  getIt.registerLazySingleton<PlantTypeRerpository>(
      () => PlantTypeRepositoryImpl(getIt<LocalDatabase>())
  );

  getIt.registerLazySingleton<PriceRepository>(
      () => PriceRepositoryImpl(getIt<LocalDatabase>())
  );
  // تسجيل حالات الاستخدام
  getIt.registerLazySingleton(() => AddOperationAndUpdateStorageUseCase(
      operationRepository: getIt<OperationRepository>(),
      storageRepository: getIt<StorageRepository>(),
  plantShapeRepository: getIt<PlantShapeRepository>(),
  plantTypeRerpository: getIt<PlantTypeRerpository>(),
    addStorageUseCase: getIt<AddStorageUseCase>(),));
  getIt.registerLazySingleton(() => FindOperationTypeUseCase());
  getIt.registerLazySingleton(() => AddSetupExpense(getIt<SetupExpenseRepository>()));
  getIt.registerLazySingleton(() => DeleteSetupExpense(getIt<SetupExpenseRepository>()));
  getIt.registerLazySingleton(() => GetAllSetupExpenses(getIt<SetupExpenseRepository>()));
  getIt.registerLazySingleton(() => UpdateSetupExpense(getIt<SetupExpenseRepository>()));
  getIt.registerLazySingleton(() => CreateReservationUseCase(getIt()));
  getIt.registerLazySingleton(() => GetReservationByIdUseCase(getIt()));
  getIt.registerLazySingleton(() => GetAllReservationsUseCase(getIt()));
  getIt.registerLazySingleton(() => GetAllSlimReservationsUseCase(getIt()));
  getIt.registerLazySingleton(() => AddStorageUseCase(
      plantShapeRepository: getIt<PlantShapeRepository>(),
      storageRepository: getIt<StorageRepository>())
  );
  
  // blocs (and cubits)
  getIt.registerFactory<OperationBloc>(() => OperationBloc(
      operationRepository:getIt<OperationRepository>(),
      addOperationAndUpdateStorageUseCase: getIt<AddOperationAndUpdateStorageUseCase>()));


  getIt.registerFactory<StorageBloc>(() => StorageBloc(getIt<StorageRepository>()));

  getIt.registerFactory<PlantTypeBloc>(() => PlantTypeBloc(getIt<PlantTypeRerpository>()));

  getIt.registerFactory<SetupExpenseBloc>(
        () => SetupExpenseBloc(),
  );


  getIt.registerFactory<OperationRelatedDataCubit>(() => OperationRelatedDataCubit(
      getIt<OperationRepository>(),
      getIt<PlantTypeRerpository>(),
      getIt<PlantShapeRepository>()));


  getIt.registerFactory(() => ReservationBloc(
    createReservation: getIt(),
    getReservationById: getIt(),
    getAllReservations: getIt(),
    getAllSlimReservations: getIt(),
  ));

  getIt.registerFactory(() => PlantShapeBloc(repository: getIt<PlantShapeRepository>()));

  getIt.registerFactory<PriceBloc>(
      () => PriceBloc(getIt<PriceRepository>())
  );

}