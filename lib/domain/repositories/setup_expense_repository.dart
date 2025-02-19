import '../entities/setup_expense.dart';

abstract class SetupExpenseRepository {
  Future<List<SetupExpense>> getAllExpenses();
  Future<int> addExpense(SetupExpense expense);
  Future<void> updateExpense(SetupExpense expense);
  Future<void> deleteExpense(int id);

  // دالة لمزامنة السجلات غير المتزامنة
  Future<void> syncPendingExpenses();
}
