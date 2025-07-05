import 'package:equatable/equatable.dart';

class PlantShape extends Equatable {
  final int? id;
  final String name;
  final int nurseryPeriod; // بالأيام

  const PlantShape({
    this.id,
    required this.name,
    required this.nurseryPeriod,
  });

  @override
  List<Object?> get props => [id, name, nurseryPeriod];

  PlantShape copyWith({int? id, String? name, int? nurseryPeriod}){
    return PlantShape(
      id: id?? this.id,
      name: name?? this.name,
      nurseryPeriod:  nurseryPeriod?? this.nurseryPeriod

    );
  }
}