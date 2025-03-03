import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
// استيراد ملف GetIt
import 'package:local_tammoz_chat/core/injection/service_locator.dart';
import 'package:local_tammoz_chat/presentation/expenses/bloc/setup_expense_bloc.dart';
import 'package:local_tammoz_chat/presentation/expenses/bloc/setup_expense_event.dart';
import 'package:local_tammoz_chat/presentation/expenses/bloc/setup_expense_state.dart';
import 'add_expense_page.dart';
import 'edit_expense_page.dart';

class ExpenseListPage extends StatelessWidget {
  const ExpenseListPage({super.key});

  String _formatCost(double cost) {
    final formatter = NumberFormat('#,##0.00');
    return formatter.format(cost);
  }

  // أيقونة توضيح الحالة لكل سجل:
  Icon _getSyncIcon(String syncStatus) {
    switch (syncStatus) {
      case 'synced':
        return const Icon(Icons.check_circle, color: Colors.green, size: 20);
      case 'pending':
        return const Icon(Icons.sync, color: Colors.orange, size: 20);
      case 'error':
        return const Icon(Icons.error, color: Colors.red, size: 20);
      default:
        return const Icon(Icons.help_outline, size: 20);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('قائمة المصروفات'),
        actions: [
          // عرض أيقونة توضح حالة المزامنة العامة:
          BlocBuilder<SetupExpenseBloc, SetupExpenseState>(
            builder: (context, state) {
              if (state is SetupExpenseLoaded) {
                // إذا كانت كل السجلات متزامنة
                bool allSynced = state.expenses.every((expense) => expense.syncStatus == 'synced');
                return IconButton(
                  icon: Icon(
                    Icons.cloud,
                    color: allSynced ? Colors.green : Colors.red,
                  ),
                  tooltip: allSynced
                      ? 'جميع البيانات مزامنة'
                      : 'بعض البيانات غير مزامنة - اضغط للمزامنة',
                  onPressed: () {
                    // عند الضغط، إطلاق حدث المزامنة اليدوية
                    getIt<SetupExpenseBloc>().add(SyncExpensesEvent());
                  },
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
      body: BlocBuilder<SetupExpenseBloc, SetupExpenseState>(
        builder: (context, state) {
          if (state is SetupExpenseLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SetupExpenseLoaded) {
            final expenses = state.expenses;
            if (expenses.isEmpty) {
              return const Center(child: Text('لا توجد مصروفات'));
            }
            return ListView.builder(
              itemCount: expenses.length,
              itemBuilder: (context, index) {
                final expense = expenses[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    leading: _getSyncIcon(expense.syncStatus),
                    title: Text('الفئة: ${expense.categoryType}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('نوع المصروف: ${expense.expenseType}'),
                        Text('التاريخ: ${DateFormat('yyyy-MM-dd').format(expense.date)}'),
                        Text('الكلفة: ${_formatCost(expense.cost)}'),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        // نستخدم GetIt لاسترجاع الـ Bloc
                        context
                            .read<SetupExpenseBloc>()
                            .add(DeleteSetupExpenseEvent(expense.id!));
                      },
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditExpensePage(expense: expense),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          } else if (state is SetupExpenseError) {
            return Center(child: Text('خطأ: ${state.message}'));
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddExpensePage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
