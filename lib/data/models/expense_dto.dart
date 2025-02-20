// data/models/expense_dto.dart

/// نموذج البيانات (DTO) للمصاريف، ويحتوي على جميع الحقول المطلوبة من مصدر البيانات (مثل Firestore)
class ExpenseDTO {
  final String globalId;
  final String syncStatus;
  final String categoryType;
  final String expenseType;
  final String? materialName;
  final double cost;
  final DateTime date;
  final DateTime updatedAt; // يُستخدم لحل التعارضات في المزامنة

  ExpenseDTO({
    required this.globalId,
    required this.syncStatus,
    required this.categoryType,
    required this.expenseType,
    this.materialName,
    required this.cost,
    required this.date,
    required this.updatedAt,
  });

  /// إنشاء ExpenseDTO من خريطة بيانات (مثلاً البيانات القادمة من Firestore)
  factory ExpenseDTO.fromMap(Map<String, dynamic> map) {
    return ExpenseDTO(
      globalId: map['globalId'] as String,
      syncStatus: map['syncStatus'] as String,
      categoryType: map['categoryType'] as String,
      expenseType: map['expenseType'] as String,
      materialName: map['materialName'] as String?,
      cost: (map['cost'] as num).toDouble(),
      date: DateTime.parse(map['date'] as String),
      updatedAt: DateTime.parse(map['updatedAt'] as String),
    );
  }

  /// تحويل ExpenseDTO إلى خريطة بيانات لتخزينها في Firestore أو القاعدة المحلية
  Map<String, dynamic> toMap() {
    return {
      'globalId': globalId,
      'syncStatus': syncStatus,
      'categoryType': categoryType,
      'expenseType': expenseType,
      'materialName': materialName,
      'cost': cost,
      'date': date.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
