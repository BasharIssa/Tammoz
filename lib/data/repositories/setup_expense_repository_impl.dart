import 'package:drift/drift.dart';
import '../../core/injection/service_locator.dart';
import '../../domain/entities/setup_expense.dart';
import '../../domain/repositories/setup_expense_repository.dart';
import '../local/local_database.dart';
import '../data_sources/firebase_expense_datasource.dart';


class SetupExpenseRepositoryImpl implements SetupExpenseRepository {

  @override
  Future<List<SetupExpense>> getAllExpenses() async {
    final localExpenses = await getIt<LocalDatabase>().select(getIt<LocalDatabase>().setupExpenseTable).get();
    return localExpenses.map(_toEntity).toList();
  }

  @override
  Future<int> addExpense(SetupExpense expense) async {
    // إجراء الإضافة على قاعدة البيانات المحلية
    final id = await getIt<LocalDatabase>().into(getIt<LocalDatabase>().setupExpenseTable).insert(
      _toCompanion(expense),
    );
    // استدعاء عملية المزامنة في الخلفية
    syncPendingExpenses();
    return id;
  }

  @override
  Future<void> updateExpense(SetupExpense expense) async {
    await (getIt<LocalDatabase>().update(getIt<LocalDatabase>().setupExpenseTable)
      ..where((tbl) => tbl.id.equals(expense.id!)))
        .write(
      SetupExpenseTableCompanion(
        globalId: Value(expense.globalId),
        syncStatus: Value(expense.syncStatus),
        categoryType: Value(expense.categoryType),
        expenseType: Value(expense.expenseType),
        materialName: Value(expense.materialName),
        cost: Value(expense.cost),
        date: Value(expense.date),
        // عند التحديث نقوم بتعيين الوقت الحالي في updatedAt
        updatedAt: Value(DateTime.now()),
      ),
    );
    try {
      // استخدام set مع merge:true في دالة updateExpense بالسحابة
      await getIt<FirebaseExpenseDataSource>().updateExpense(expense.globalId, expense);
    } catch (e) {
      print('Firebase sync error on update: $e');
    }
  }

  @override
  Future<void> deleteExpense(int id) async {
    // استرجاع السجل المحلي للحصول على الـ globalId
    final expenseData = await (getIt<LocalDatabase>().select(getIt<LocalDatabase>().setupExpenseTable)
      ..where((tbl) => tbl.id.equals(id))).getSingle();
    final globalId = expenseData.globalId;

    await (getIt<LocalDatabase>().delete(getIt<LocalDatabase>().setupExpenseTable)
      ..where((tbl) => tbl.id.equals(id)))
        .go();
    try {
      await getIt<FirebaseExpenseDataSource>().deleteExpense(globalId);
    } catch (e) {
      print('Firebase sync error on delete: $e');
    }
  }

  @override
  Future<void> syncPendingExpenses() async {
    // ابحث عن السجلات التي لم تتم مزامنتها (syncStatus != 'synced')
    final query = getIt<LocalDatabase>().select(getIt<LocalDatabase>().setupExpenseTable)
      ..where((tbl) => tbl.syncStatus.equals('synced').not());
    final pendingExpenses = await query.get();

    for (var expenseData in pendingExpenses) {
      final expense = _toEntity(expenseData);
      try {
        await getIt<FirebaseExpenseDataSource>().addExpense(expense);
        // إذا نجحت المزامنة، تحديث الحالة إلى 'synced'
        await (getIt<LocalDatabase>().update(getIt<LocalDatabase>().setupExpenseTable)
          ..where((tbl) => tbl.id.equals(expense.id!)))
            .write(SetupExpenseTableCompanion(
          syncStatus: Value('synced'),
          updatedAt: Value(DateTime.now()),
        ));
      } catch (e) {
        print('Error syncing expense ${expense.id}: $e');
        // في حال حدوث خطأ، تحديث الحالة إلى 'error'
        await (getIt<LocalDatabase>().update(getIt<LocalDatabase>().setupExpenseTable)
          ..where((tbl) => tbl.id.equals(expense.id!)))
            .write(SetupExpenseTableCompanion(
          syncStatus: Value('error'),
          updatedAt: Value(DateTime.now()),
        ));
      }
    }
  }

  SetupExpense _toEntity(SetupExpenseTableData data) => SetupExpense(
    id: data.id,
    globalId: data.globalId,
    syncStatus: data.syncStatus,
    categoryType: data.categoryType,
    expenseType: data.expenseType,
    materialName: data.materialName,
    cost: data.cost,
    date: data.date,
  );

  SetupExpenseTableCompanion _toCompanion(SetupExpense expense) => SetupExpenseTableCompanion(
    id: expense.id == null ? const Value.absent() : Value(expense.id!),
    globalId: Value(expense.globalId),
    syncStatus: Value(expense.syncStatus),
    categoryType: Value(expense.categoryType),
    expenseType: Value(expense.expenseType),
    materialName: Value(expense.materialName),
    cost: Value(expense.cost),
    date: Value(expense.date),
    createdAt: Value(DateTime.now()),
    updatedAt: Value(DateTime.now()),
  );
}
