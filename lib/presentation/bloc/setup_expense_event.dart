import 'package:equatable/equatable.dart';
import '../../domain/entities/setup_expense.dart';

abstract class SetupExpenseEvent extends Equatable {
  const SetupExpenseEvent();
  @override
  List<Object?> get props => [];
}

class LoadSetupExpenses extends SetupExpenseEvent {}

class AddSetupExpenseEvent extends SetupExpenseEvent {
  final SetupExpense expense;
  const AddSetupExpenseEvent(this.expense);
  //@override
  //List<Object?> get props => [expense];
}

class UpdateSetupExpenseEvent extends SetupExpenseEvent {
  final SetupExpense expense;
  const UpdateSetupExpenseEvent(this.expense);
  @override
  List<Object?> get props => [expense];
}

class DeleteSetupExpenseEvent extends SetupExpenseEvent {
  final int expenseId;
  const DeleteSetupExpenseEvent(this.expenseId);
  @override
  List<Object?> get props => [expenseId];
}

class SyncExpensesEvent extends SetupExpenseEvent {}
