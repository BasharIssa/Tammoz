// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:local_tammoz_chat/presentation/expenses/bloc/setup_expense_event.dart';
import 'package:local_tammoz_chat/presentation/expenses/pages/expense_list_page.dart' ;
import 'package:local_tammoz_chat/presentation/main_page..dart';
import 'package:local_tammoz_chat/presentation/plant_types/bloc/plant_type_bloc.dart';
import 'package:local_tammoz_chat/presentation/plant_types/bloc/plant_type_events.dart';

import 'package:shadcn_ui/shadcn_ui.dart';
// إخفاء التكرار

//امبورتات الزراعة
import 'domain/repositories/planting_repository.dart';
import 'presentation/plantings/bloc/planting_bloc.dart';
import 'presentation/plantings/pages/plantings_page.dart';
import 'package:local_tammoz_chat/presentation/plantings/bloc/planting_events.dart';

import 'core/injection/service_locator.dart';
import 'package:local_tammoz_chat/presentation/expenses/bloc/setup_expense_bloc.dart';
import 'firebase_options.dart'; // تأكد من إعداد هذا الملف

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupLocator();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PlantingBloc>(
          create: (_) => PlantingBloc(getIt<PlantingRepository>())..add(LoadPlantings()),
        ),
        BlocProvider<PlantTypeBloc>(
          create: (_) => PlantTypeBloc(getIt<PlantingRepository>())..add(LoadPlantTypes()),
        ),
      ],
      child: MaterialApp(
        title: 'تطبيق النباتات',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const MainPage(),
      ),
    );
  }
}
