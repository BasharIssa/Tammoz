// data/repositories/setup_expense_repository_impl.dart

import 'package:drift/drift.dart';
import 'package:local_tammoz_chat/data/sync/expense_upsert.dart';
import '../../core/injection/service_locator.dart';
import '../../domain/entities/setup_expense.dart';
import '../../domain/repositories/setup_expense_repository.dart';
import '../local/local_database.dart';
import '../data_sources/firebase_expense_datasource.dart';
import '../mappers/expense_mapper.dart'; // دوال التحويل بين ExpenseDTO والكيان
//import '../models/expense_dto.dart';     // نموذج ExpenseDTO

class SetupExpenseRepositoryImpl implements SetupExpenseRepository {
  final LocalDatabase _localDb = getIt<LocalDatabase>();
  final FirebaseExpenseDataSource _firebaseDS = getIt<
      FirebaseExpenseDataSource>();

  SetupExpenseRepositoryImpl() {
    // الاشتراك في الـ Stream الخاص ببيانات Firestore (ExpenseDTO) لتحديث القاعدة المحلية بشكل ثنائي الاتجاه
    _firebaseDS.streamExpenseDTOs().listen((remoteDTOs) async {
      // أولاً، نقوم بتحديث أو إدخال السجلات الموجودة (upsert) من بيانات Firestore
      await _localDb.upsertExpensesFromDTO(remoteDTOs);

      // الآن نقوم بفحص السجلات المحلية وحذف تلك التي لم تعد موجودة في بيانات Firestore
      // (أي أنه تم حذفها من السحابة)
      final remoteGlobalIds = remoteDTOs.map((dto) => dto.globalId).toSet();
      final localExpenses = await _localDb.select(_localDb.setupExpenseTable)
          .get();
      for (var localExpense in localExpenses) {
        // إذا كان globalId للسجل المحلي غير موجود في مجموعة الـ remoteGlobalIds،
        // فهذا يعني أن المصروف تم حذفه من Firestore؛ لذا نقوم بحذفه محلياً.
        if (!remoteGlobalIds.contains(localExpense.globalId)) {
          await (_localDb.delete(_localDb.setupExpenseTable)
            ..where((tbl) => tbl.globalId.equals(localExpense.globalId)))
              .go();
        }
      }
    });
  }

  @override
  Future<List<SetupExpense>> getAllExpenses() async {
    final localExpenses = await _localDb.select(_localDb.setupExpenseTable)
        .get();
    // تحويل بيانات الجدول المحلي إلى كيان Domain (SetupExpense)
    return localExpenses.map(toEntity).toList();
  }

  @override
  Future<int> addExpense(SetupExpense expense) async {
    // إضافة المصروف محلياً أولاً
    final id = await _localDb.into(_localDb.setupExpenseTable).insert(
        toCompanion(expense));
    // إرسال المصروف إلى Firestore
    await _firebaseDS.addExpense(toDTO(expense, updatedAt: DateTime.now()));
    return id;
  }

  @override
  Future<void> updateExpense(SetupExpense expense) async {
    final expenseDTO = toDTO(expense, updatedAt: DateTime.now());
    await (_localDb.update(_localDb.setupExpenseTable)
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
        updatedAt: Value(DateTime.now()),
      ),
    );
    await _firebaseDS.updateExpense(expense.globalId, expenseDTO);
  }

  @override
  Future<void> deleteExpense(int id) async {
    final expenseData = await (_localDb.select(_localDb.setupExpenseTable)
      ..where((tbl) => tbl.id.equals(id)))
        .getSingle();
    final globalId = expenseData.globalId;
    // حذف السجل محلياً
    await (_localDb.delete(_localDb.setupExpenseTable)
      ..where((tbl) => tbl.id.equals(id)))
        .go();
    // حذف السجل من Firestore
    await _firebaseDS.deleteExpense(globalId);
  }

  @override
  Future<void> syncPendingExpenses() async {
    final query = _localDb.select(_localDb.setupExpenseTable)
      ..where((tbl) => tbl.syncStatus.equals('synced').not());
    final pendingExpenses = await query.get();
    for (var expenseData in pendingExpenses) {
      final expense = toEntity(expenseData);
      final expenseDTO = toDTO(expense, updatedAt: DateTime.now());
      try {
        await _firebaseDS.addExpense(expenseDTO);
        await (_localDb.update(_localDb.setupExpenseTable)
          ..where((tbl) => tbl.id.equals(expense.id!)))
            .write(
          SetupExpenseTableCompanion(
            syncStatus: Value('synced'),
            updatedAt: Value(DateTime.now()),
          ),
        );
      } catch (e) {
        print('Error syncing expense ${expense.id}: $e');
        await (_localDb.update(_localDb.setupExpenseTable)
          ..where((tbl) => tbl.id.equals(expense.id!)))
            .write(
          SetupExpenseTableCompanion(
            syncStatus: Value('error'),
            updatedAt: Value(DateTime.now()),
          ),
        );
      }
    }
  }
}