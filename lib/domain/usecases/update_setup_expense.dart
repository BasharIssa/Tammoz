import '../entities/setup_expense.dart';
import '../repositories/setup_expense_repository.dart';

class UpdateSetupExpense {
  final SetupExpenseRepository repository;

  UpdateSetupExpense(this.repository);

  Future<void> call(SetupExpense expense) async {
    return await repository.updateExpense(expense);
  }
}
