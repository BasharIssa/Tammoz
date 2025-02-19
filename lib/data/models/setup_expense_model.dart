import 'package:drift/drift.dart';

class SetupExpenseTable extends Table {
  // المعرف المحلي (يُنشأ تلقائيًا)
  IntColumn get id => integer().autoIncrement()();

  // المعرف الموحد (UUID) مع قيمة افتراضية غير فارغة
  TextColumn get globalId => text().withDefault(Constant(''))();

  // حالة المزامنة: 'pending' (افتراضي) أو 'synced' أو 'error'
  TextColumn get syncStatus => text().withDefault(Constant('pending'))();

  // باقي الحقول الخاصة ببيانات المصروف
  TextColumn get categoryType => text()();
  TextColumn get expenseType => text()();
  TextColumn get materialName => text().nullable()();
  RealColumn get cost => real()();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}
