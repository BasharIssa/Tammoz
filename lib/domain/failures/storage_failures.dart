// في ملف domain/failures/storage_failures.dart
import 'failures.dart';

class StorageFailure extends Failure {
  const StorageFailure({required super.message, super.stackTrace});
}

class StorageNotFoundFailure extends StorageFailure {
  const StorageNotFoundFailure({super.stackTrace})
      : super(
    message: 'لم يتم العثور على العنصر في المخزن',
  );
}

class StorageInvalidDataFailure extends StorageFailure {
  const StorageInvalidDataFailure({super.stackTrace, required String message})
      : super(
    message: 'بيانات المخزن غير صالحة',
  );
}

class StorageQuantityExceededFailure extends StorageFailure {
  const StorageQuantityExceededFailure({super.stackTrace})
      : super(
    message: 'الكمية المطلوبة تتجاوز الكمية المتاحة في المخزن',
  );
}