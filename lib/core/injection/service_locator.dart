import 'package:get_it/get_it.dart';
import 'package:local_tammoz_chat/domain/repositories/setup_expense_repository.dart';
import 'package:local_tammoz_chat/domain/use_cases/add_setup_expense.dart';
import 'package:local_tammoz_chat/domain/use_cases/delete_setup_expense.dart';
import 'package:local_tammoz_chat/domain/use_cases/get_all_setup_expenses.dart';
import 'package:local_tammoz_chat/domain/use_cases/update_setup_expense.dart';
import 'package:local_tammoz_chat/presentation/expenses/bloc/setup_expense_bloc.dart';
import 'package:local_tammoz_chat/data/local/local_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:local_tammoz_chat/data/data_sources/firebase_expense_datasource.dart';
import 'package:local_tammoz_chat/data/repositories/setup_expense_repository_impl.dart';
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