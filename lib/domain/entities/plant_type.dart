// lib/domain/entities/plant_type.dart

import 'package:equatable/equatable.dart';

/// كيان يمثل نوع النبات
class PlantType extends Equatable {
  final int? id;
  final String name;

  const PlantType({this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
