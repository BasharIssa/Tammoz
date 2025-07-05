import '../entities/setup_expense.dart';
import '../repositories/setup_expense_repository.dart';

class GetAllSetupExpenses {
  final SetupExpenseRepository repository;

  GetAllSetupExpenses(this.repository);

  Future<List<SetupExpense>> call() async {
    return await repository.getAllExpenses();
  }
}
