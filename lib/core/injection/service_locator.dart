import 'package:get_it/get_it.dart';
import '../../data/repositories/setup_expense_repository_impl.dart';
import '../../domain/repositories/setup_expense_repository.dart';
import '../../domain/use_cases/add_setup_expense.dart';
import '../../domain/use_cases/delete_setup_expense.dart';
import '../../domain/use_cases/get_all_setup_expenses.dart';
import '../../domain/use_cases/update_setup_expense.dart';
import '../../presentation/bloc/setup_expense_bloc.dart';
import '../../data/local/local_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/data_sources/firebase_expense_datasource.dart';


final getIt = GetIt.instance;

void setupLocator() {
  // تسجيل FirebaseFirestore كمصدر مشترك يمكن استخدامه في أي مكان
  getIt.registerLazySingleton<FirebaseFirestore>(
          () => FirebaseFirestore.instance
  );

  // تسجيل FirebaseExpenseDataSource مع تمرير FirebaseFirestore إليه
  getIt.registerLazySingleton<FirebaseExpenseDataSource>(
        () => FirebaseExpenseDataSource(),
  );


  // تسجيل قاعدة البيانات
  getIt.registerLazySingleton<LocalDatabase>(() => LocalDatabase());

  // تسجيل المستودع
  getIt.registerLazySingleton<SetupExpenseRepository>(
        () => SetupExpenseRepositoryImpl(),
  );

  // تسجيل حالات الاستخدام
  getIt.registerLazySingleton(() => AddSetupExpense(getIt<SetupExpenseRepository>()));
  getIt.registerLazySingleton(() => DeleteSetupExpense(getIt<SetupExpenseRepository>()));
  getIt.registerLazySingleton(() => GetAllSetupExpenses(getIt<SetupExpenseRepository>()));
  getIt.registerLazySingleton(() => UpdateSetupExpense(getIt<SetupExpenseRepository>()));

  // تسجيل SetupExpenseBloc الذي يعتمد على SetupExpenseRepository
  getIt.registerFactory<SetupExpenseBloc>(
        () => SetupExpenseBloc(),
  );
}
