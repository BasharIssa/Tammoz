import 'package:cloud_firestore/cloud_firestore.dart';
import '../../core/injection/service_locator.dart';
import '../models/expense_dto.dart';

class FirebaseExpenseDataSource {
  /// إضافة مصروف إلى Firestore باستخدام ExpenseDto
  Future<void> addExpense(ExpenseDto ExpenseDto) async {
    final docRef = getIt<FirebaseFirestore>()
        .collection('expenses')
        .doc(ExpenseDto.globalId);
    await docRef.set(ExpenseDto.toJson());
  }

  /// تحديث مصروف في Firestore باستخدام ExpenseDto
  Future<void> updateExpense(String globalId, ExpenseDto ExpenseDto) async {

    await getIt<FirebaseFirestore>()
        .collection('expenses')
        .doc(globalId)
        .update(ExpenseDto.toJson());
  }

  /// حذف مصروف من Firestore
  Future<void> deleteExpense(String globalId) async {
    await getIt<FirebaseFirestore>()
        .collection('expenses')
        .doc(globalId)
        .delete();
  }

  /// دالة استماع للتغييرات في Firestore تُعيد Stream من ExpenseDto
  Stream<List<ExpenseDto>> streamExpenseDtos() {
    return getIt<FirebaseFirestore>()
        .collection('expenses')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
      final data = doc.data();
      return ExpenseDto.fromJson(data);
    }).toList());
  }
}