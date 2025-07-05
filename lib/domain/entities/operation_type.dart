import 'package:equatable/equatable.dart';

class OperationType extends Equatable {
  final int? id;
  final String name;
  final double successRatio;

  const OperationType({
    this.id,
    required this.name,
    this.successRatio = 1.0,
  });

  @override
  List<Object?> get props => [id, name, successRatio];

}

extension OperationTypeExt on OperationType {
  OperationType copyWith({int? id, String? name, double? successRatio}) {
    return OperationType(
      id: id ?? this.id,
      name: name ?? this.name,
      successRatio: successRatio ?? this.successRatio,
    );
  }
}


