// lib/presentation/pages/expense_list_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/setup_expense_bloc.dart';
import '../bloc/setup_expense_event.dart';
import '../bloc/setup_expense_state.dart';
import 'add_expense_page.dart';

class ExpenseListPage extends StatelessWidget {
  const ExpenseListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold يعرض قائمة المصروفات وزر إضافة
    return Scaffold(
      appBar: AppBar(
        title: const Text('قائمة المصروفات'),
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
                return ListTile(
                  title: Text(expense.expenseType),
                  subtitle: Text('التكلفة: ${expense.cost}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      // إرسال حدث الحذف باستخدام BLoC
                      context
                          .read<SetupExpenseBloc>()
                          .add(DeleteSetupExpenseEvent(expense.id!));
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
          // التنقل إلى شاشة إضافة المصروف
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
