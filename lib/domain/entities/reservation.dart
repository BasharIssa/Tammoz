import 'package:equatable/equatable.dart';
import 'package:local_tammoz_chat/domain/entities/plant_shape.dart';
import 'package:local_tammoz_chat/domain/entities/plant_type.dart';

class Reservation extends Equatable {
  final int? id;
  final String fullName;
  final String phone;
  final DateTime reservationDate;
  final DateTime? deliveryDate;
  final PlantType plantType;
  final PlantShape plantShape;
  final int quantity;
  final double? calculatedTotalAmount;
  final double? deposit ;
  final bool isFullyPaid;
  final bool isDelivered;
  final String? notes;

  const Reservation({
    this.id,
    required this.fullName,
    required this.phone,
    required this.reservationDate,
    this.deliveryDate,
    required this.plantType,
    required this.plantShape,
    required this.quantity,
    this.calculatedTotalAmount,
    this.deposit,
    this.isFullyPaid = false,
    this.isDelivered = false,
    this.notes,
  });

  Reservation copyWith({
    int? id,
    String? fullName,
    String? phone,
    DateTime? reservationDate,
    DateTime? deliveryDate,
    PlantType? plantType,
    PlantShape? plantShape,
    int? quantity,
    double? totalAmount,
    double? deposit,
    bool? isFullyPaid,
    bool? isDelivered,
    String? notes,
  }) {
    return Reservation(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      reservationDate: reservationDate ?? this.reservationDate,
      deliveryDate: deliveryDate ?? this.deliveryDate,
      plantType: plantType ?? this.plantType,
      plantShape: plantShape ?? this.plantShape,
      quantity: quantity ?? this.quantity,
      calculatedTotalAmount: totalAmount ?? calculatedTotalAmount,
      deposit: deposit ?? this.deposit,
      isFullyPaid: isFullyPaid ?? this.isFullyPaid,
      isDelivered: isDelivered ?? this.isDelivered,
      notes: notes ?? this.notes,
    );
  }

  @override
  List<Object?> get props => [
    id,
    fullName,
    phone,
    reservationDate,
    deliveryDate,
    plantType,
    plantShape,
    quantity,
    calculatedTotalAmount,
    deposit,
    isFullyPaid,
    isDelivered,
    notes,
  ];
}

class SlimReservation extends Equatable{
  final int? id;
  final String fullName;
  const SlimReservation(
  {
    this.id,
    required this.fullName
  }
      );
  SlimReservation copyWith({
    int? id,
    String? fullName
}) {
    return SlimReservation(id:id??this.id,
        fullName: fullName??this.fullName);

  }
  @override
  List<Object?> get props => [
    id,
    fullName
  ];

}
