// data/data_sources/firebase_expense_datasource.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import '../../core/injection/service_locator.dart';
import '../models/expense_dto.dart';

class FirebaseExpenseDataSource {
  /// إضافة مصروف إلى Firestore باستخدام ExpenseDTO
  Future<void> addExpense(ExpenseDTO expenseDTO) async {
    final docRef = getIt<FirebaseFirestore>()
        .collection('expenses')
        .doc(expenseDTO.globalId);
    await docRef.set(expenseDTO.toMap());
  }

  /// تحديث مصروف في Firestore باستخدام ExpenseDTO
  Future<void> updateExpense(String globalId, ExpenseDTO expenseDTO) async {
    await getIt<FirebaseFirestore>()
        .collection('expenses')
        .doc(globalId)
        .update(expenseDTO.toMap());
  }

  /// حذف مصروف من Firestore
  Future<void> deleteExpense(String globalId) async {
    await getIt<FirebaseFirestore>()
        .collection('expenses')
        .doc(globalId)
        .delete();
  }

  /// دالة استماع للتغييرات في Firestore تُعيد Stream من ExpenseDTO
  Stream<List<ExpenseDTO>> streamExpenseDTOs() {
    return getIt<FirebaseFirestore>()
        .collection('expenses')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
      final data = doc.data();
      return ExpenseDTO.fromMap(data);
    }).toList());
  }
}
