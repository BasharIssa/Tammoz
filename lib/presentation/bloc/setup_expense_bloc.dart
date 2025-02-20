import 'package:flutter_bloc/flutter_bloc.dart';
import 'setup_expense_event.dart';
import 'setup_expense_state.dart';
import '../../domain/repositories/setup_expense_repository.dart';

import '../../core/injection/service_locator.dart'; // استيراد getIt

class SetupExpenseBloc extends Bloc<SetupExpenseEvent, SetupExpenseState> {
  SetupExpenseBloc() : super(SetupExpenseInitial()) {
    on<LoadSetupExpenses>((event, emit) async {
      emit(SetupExpenseLoading());
      try {
        final expenses = await getIt<SetupExpenseRepository>().getAllExpenses();
        emit(SetupExpenseLoaded(expenses));
      } catch (e) {
        emit(SetupExpenseError(e.toString()));
      }
    });

    on<AddSetupExpenseEvent>((event, emit) async {
      try {
        await getIt<SetupExpenseRepository>().addExpense(event.expense);
        // يمكن إضافة حالة Loading أثناء التحديث*1
        emit(SetupExpenseLoading());
        final expenses = await getIt<SetupExpenseRepository>().getAllExpenses();
        emit(SetupExpenseLoaded(expenses));
      } catch (e) {
        emit(SetupExpenseError('فشل الإضافة: ${e.toString()}'));
      }
    });

    on<UpdateSetupExpenseEvent>((event, emit) async {
      try {
        await getIt<SetupExpenseRepository>().updateExpense(event.expense);
        final expenses = await getIt<SetupExpenseRepository>().getAllExpenses();
        emit(SetupExpenseLoaded(expenses));
      } catch (e) {
        emit(SetupExpenseError(e.toString()));
      }
    });

    on<DeleteSetupExpenseEvent>((event, emit) async {
      try {
        await getIt<SetupExpenseRepository>().deleteExpense(event.expenseId);
        final expenses = await getIt<SetupExpenseRepository>().getAllExpenses();
        emit(SetupExpenseLoaded(expenses));
      } catch (e) {
        emit(SetupExpenseError(e.toString()));
      }
    });

    on<SyncExpensesEvent>((event, emit) async {
      try {
        await getIt<SetupExpenseRepository>().syncPendingExpenses();
        final expenses = await getIt<SetupExpenseRepository>().getAllExpenses();
        emit(SetupExpenseLoaded(expenses));
      } catch (e) {
        emit(SetupExpenseError(e.toString()));
      }
    });
  }
}
