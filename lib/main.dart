// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:local_tammoz_chat/presentation/expenses/bloc/setup_expense_event.dart';
import 'package:local_tammoz_chat/presentation/expenses/pages/expense_list_page.dart' ;
import 'package:shadcn_ui/shadcn_ui.dart';
// إخفاء التكرار



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
    return BlocProvider(

      create: (context) => getIt<SetupExpenseBloc>()..add(LoadSetupExpenses()),
      child: ShadApp.material(
        debugShowCheckedModeBanner: false,
        title: 'اختبار قاعدة البيانات',

        home: ExpenseListPage(),
      ),
    );
  }
}
