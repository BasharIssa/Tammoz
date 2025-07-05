import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_tammoz_chat/domain/entities/storage.dart';
import 'package:local_tammoz_chat/presentation/operation/pages/add_grafting_page.dart';
import 'package:local_tammoz_chat/presentation/operation/pages/add_pruning_page.dart';
import 'package:local_tammoz_chat/presentation/plant_types/bloc/plant_type_events.dart';
import 'package:local_tammoz_chat/presentation/storage/pages/select_second_storage_page.dart';

import 'constants.dart';
import 'core/injection/service_locator.dart';
import 'firebase_options.dart';
import 'presentation/main_page.dart';
import 'presentation/operation/bloc/operation_bloc.dart';
import 'presentation/operation/bloc/operation_related_data_cubit.dart';
import 'presentation/operation/pages/add_operation_page.dart';
import 'presentation/operation/pages/add_planting_page.dart';
import 'presentation/operation/pages/operations_page.dart';
import 'presentation/plant_types/bloc/plant_type_bloc.dart';
import 'presentation/storage/bloc/storage_bloc.dart';
import 'presentation/storage/pages/storage_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupLocator();

  //
  //getIt<LocalDatabase>().deleteDatabaseFile();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider<PlantingBloc>(
        //   create: (_) => getIt<PlantingBloc>()..add(LoadPlantings()),
        // ),
        BlocProvider<PlantTypeBloc>(
          create: (_) => getIt<PlantTypeBloc>()..add(LoadPlantTypes()),
        ),
        BlocProvider<StorageBloc>(
          create: (_) => getIt<StorageBloc>()..add(LoadAllStorages()),
        ),
        BlocProvider<OperationBloc>(
          create: (_) => getIt<OperationBloc>(),
        ),
        BlocProvider<OperationRelatedDataCubit>(
          create: (_) => getIt<OperationRelatedDataCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'تطبيق النباتات',
        theme: ThemeData(primarySwatch: Colors.green),
        initialRoute: PagesRoutesConstants.root,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case PagesRoutesConstants.root:
              return MaterialPageRoute(builder: (_) => const MainPage());

            case PagesRoutesConstants.addGrafting:
            // استخرج الوسيطات المرسلة مع التنقل
              final args = settings.arguments as Map<String, dynamic>?;

              if (args == null) {
                // يمكنك إرجاع صفحة خطأ أو صفحة افتراضية
                return MaterialPageRoute(
                  builder: (_) => const Scaffold(
                    body: Center(child: Text('خطأ: لم يتم تمرير المعاملات')),
                  ),
                );
              }
              return MaterialPageRoute(
                builder: (_) => AddGraftingPage(
                  preselectedOperationName: args['preselectedOperationName'] as String,
                  firstStorage: args['firstStorage'] as Storage,
                  secondStorage: args['secondStorage'] as Storage,
                ),
              );


            case PagesRoutesConstants.selectSecondStorage:
            // استخرج الوسيطات المرسلة مع التنقل
              final args = settings.arguments as Map<String, dynamic>?;

              if (args == null) {
                // يمكنك إرجاع صفحة خطأ أو صفحة افتراضية
                return MaterialPageRoute(
                  builder: (_) => const Scaffold(
                    body: Center(child: Text('خطأ: لم يتم تمرير المعاملات')),
                  ),
                );
              }
              return MaterialPageRoute(
                builder: (_) => SelectSecondStoragePage(
                  preselectedOperationName: args['preselectedOperationName'] as String,
                  firstStorage: args['firstStorage'] as Storage,
                ),
              );

            case PagesRoutesConstants.addPruning:
            // استخرج الوسيطات المرسلة مع التنقل
              final args = settings.arguments as Map<String, dynamic>?;

              if (args == null) {
                // يمكنك إرجاع صفحة خطأ أو صفحة افتراضية
                return MaterialPageRoute(
                  builder: (_) => const Scaffold(
                    body: Center(child: Text('خطأ: لم يتم تمرير المعاملات')),
                  ),
                );
              }
              return MaterialPageRoute(
                builder: (_) => AddPruningPage(
                  preselectedOperationName: args['preselectedOperationName'] as String?,
                  firstStorageId: args['firstStorageId'] as int,
                  plantTypeName: args['plantTypeName'] as String,
                  plantShapeName: args['plantShapeName'] as String,
                  maxQuantity: args['maxQuantity'] as int,
                ),
              );

            case PagesRoutesConstants.addPlanting:
              final args = settings.arguments as String?;
              return MaterialPageRoute(
                builder: (_) => AddPlantingPage(preselectedOperationName: args),
              );

            case '/addOperation':
              final args = settings.arguments as Map<String, dynamic>?;
              return MaterialPageRoute(
                builder: (_) => AddOperationPage(
                  preselectedOperationName:
                      args?['preselectedOperationName'] as String?,
                  plantType: args?['plantType'] as String?,
                  plantShape: args?['plantShape'] as String?,
                  quantity: args?['quantity'] as int?,
                ),
              );

            case PagesRoutesConstants.storage:
              return MaterialPageRoute(builder: (_) => const StoragePage());

            case PagesRoutesConstants.operations:
              return MaterialPageRoute(builder: (_) => const OperationsPage());

            default:
              return MaterialPageRoute(
                builder: (_) => const Scaffold(
                  body: Center(child: Text('الصفحة غير موجودة')),
                ),
              );
          }
        },
      ),
    );
  }
}
