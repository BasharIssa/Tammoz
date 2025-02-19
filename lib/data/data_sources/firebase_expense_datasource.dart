import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/setup_expense.dart';
import 'package:local_tammoz_chat/core/injection/service_locator.dart';

class FirebaseExpenseDataSource {

  /// إضافة مصروف جديد إلى Firestore
  Future<void> addExpense(SetupExpense expense) async {
    // استخدام globalId كمعرف المستند
    final docRef = getIt<FirebaseFirestore>().collection('expenses').doc(expense.globalId);
    await docRef.set({
      'globalId': expense.globalId,
      'syncStatus': expense.syncStatus,
      'categoryType': expense.categoryType,
      'expenseType': expense.expenseType,
      'materialName': expense.materialName,
      'cost': expense.cost,
      'date': expense.date.toIso8601String(),
      'createdAt': DateTime.now().toIso8601String(),
      'updatedAt': DateTime.now().toIso8601String(),
    });
  }

  /// جلب كل المصروفات من Firestore
  Future<List<SetupExpense>> getAllExpenses() async {
    final snapshot = await getIt<FirebaseFirestore>().collection('expenses').get();
    return snapshot.docs.map((doc) {
      final data = doc.data();
      return SetupExpense(
        id: null, // لا يتم استخدام id المحلي هنا
        globalId: data['globalId'] as String,
        syncStatus: data['syncStatus'] as String,
        categoryType: data['categoryType'] as String,
        expenseType: data['expenseType'] as String,
        materialName: data['materialName'] as String?,
        cost: (data['cost'] as num).toDouble(),
        date: DateTime.parse(data['date'] as String),
      );
    }).toList();
  }

  /// تحديث مصروف في Firestore
  Future<void> updateExpense(String globalId, SetupExpense expense) async {
    await getIt<FirebaseFirestore>().collection('expenses').doc(globalId).update({
      'categoryType': expense.categoryType,
      'expenseType': expense.expenseType,
      'materialName': expense.materialName,
      'cost': expense.cost,
      'date': expense.date.toIso8601String(),
      'updatedAt': DateTime.now().toIso8601String(),
    });
  }

  /// حذف مصروف من Firestore
  Future<void> deleteExpense(String globalId) async {
    await getIt<FirebaseFirestore>().collection('expenses').doc(globalId).delete();
  }
}
