import 'package:equatable/equatable.dart';
import 'package:local_tammoz_chat/domain/entities/plant_shape.dart';
import 'package:local_tammoz_chat/domain/entities/plant_type.dart';

class Price extends Equatable {
  final int? id;
  final PlantType plantType;
  final PlantShape plantShape;
  final double price;

  const Price({
    this.id,
    required this.plantType,
    required this.plantShape,
    required this.price,
  });


  Price copyWith({
    int? id,
    PlantType? plantType,
    PlantShape? plantShape,
    double? price,
  }) {
    return Price(
      id: id ?? this.id,
      plantType: plantType ?? this.plantType,
      plantShape: plantShape ?? this.plantShape,
      price: price ?? this.price,
    );
  }

  @override
  List<Object?> get props => [id, plantType, plantShape, price];

// يمكنك إضافة دوال مساعدة مثل copyWith أو toString إذا أردت
}
