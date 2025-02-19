import '../entities/setup_expense.dart';
import '../repositories/setup_expense_repository.dart';

class AddSetupExpense {
  final SetupExpenseRepository repository;

  AddSetupExpense(this.repository);

  Future<int> call(SetupExpense expense) async {
    return await repository.addExpense(expense);
  }
}
