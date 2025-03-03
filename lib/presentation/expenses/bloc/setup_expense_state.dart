import 'package:equatable/equatable.dart';
import 'package:local_tammoz_chat/domain/entities/setup_expense.dart';

abstract class SetupExpenseState extends Equatable {
  const SetupExpenseState();

  @override
  List<Object?> get props => [];
}

/// الحالة الابتدائية للتطبيق
class SetupExpenseInitial extends SetupExpenseState {}

/// حالة التحميل عند جلب البيانات
class SetupExpenseLoading extends SetupExpenseState {}

/// الحالة عند تحميل البيانات بنجاح
class SetupExpenseLoaded extends SetupExpenseState {
  final List<SetupExpense> expenses;

  const SetupExpenseLoaded(this.expenses);

  @override
  List<Object?> get props => [expenses];
}

/// حالة حدوث خطأ ما أثناء العمليات
class SetupExpenseError extends SetupExpenseState {
  final String message;

  const SetupExpenseError(this.message);

  @override
  List<Object?> get props => [message];
}
