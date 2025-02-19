import '../repositories/setup_expense_repository.dart';

class DeleteSetupExpense {
  final SetupExpenseRepository repository;

  DeleteSetupExpense(this.repository);

  Future<void> call(int id) async {
    return await repository.deleteExpense(id);
  }
}
