// في ملف domain/failures/failures.dart

abstract class Failure {
  final String message;
  final StackTrace? stackTrace;

  const Failure({required this.message, this.stackTrace});

  @override
  String toString() => message;
}