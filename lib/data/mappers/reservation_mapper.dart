import 'package:drift/drift.dart';
import 'package:local_tammoz_chat/data/local/local_database.dart';
import 'package:local_tammoz_chat/data/models/reservation_dto.dart';
import 'package:local_tammoz_chat/domain/entities/reservation.dart';

import 'plant_shape_mapper.dart';
import 'plant_type_mapper.dart'; // فرضًا هذا مسار قاعدة البيانات

class ReservationMapper {
  static SlimReservation toSlimEntity(ReservationDto dto){
    return SlimReservation(id: dto.id, fullName: dto.fullName);
  }
  
  static Reservation toEntity(ReservationDto dto) {
    return Reservation(
      id: dto.id,
      fullName: dto.fullName,
      phone: dto.phone,
      reservationDate: dto.reservationDate,
      deliveryDate: dto.deliveryDate,
      plantType: PlantTypeMapper.toEntity(dto.plantType),
      plantShape: PlantShapeMapper.toEntity(dto.plantShape),
      quantity: dto.quantity,
      calculatedTotalAmount: dto.calculatedTotalAmount,
      deposit: dto.deposit,
      isFullyPaid: dto.isFullyPaid,
      isDelivered: dto.isDelivered,
      notes: dto.notes,
    );
  }

  static ReservationDto fromEntity(Reservation entity) {
    return ReservationDto(
      id: entity.id,
      fullName: entity.fullName,
      phone: entity.phone,
      reservationDate: entity.reservationDate,
      deliveryDate: entity.deliveryDate,
      plantType: PlantTypeMapper.fromEntity(entity.plantType),
      plantShape: PlantShapeMapper.fromEntity(entity.plantShape),
      quantity: entity.quantity,
      calculatedTotalAmount: entity.calculatedTotalAmount,
      deposit: entity.deposit,
      isFullyPaid: entity.isFullyPaid,
      isDelivered: entity.isDelivered,
      notes: entity.notes,
    );
  }

  static ReservationsTableCompanion toCompanion(ReservationDto dto) {
    return ReservationsTableCompanion(
      id: dto.id != null ? Value(dto.id!) : const Value.absent(),
      fullName: Value(dto.fullName),
      phone: Value(dto.phone),
      reservationDate: Value(dto.reservationDate),
      deliveryDate: dto.deliveryDate != null
          ? Value(dto.deliveryDate!)
          : const Value.absent(),
      plantTypeId: Value(dto.plantType.id!),
      // نفترض أن PlantTypeDto يحتوي على id
      plantShapeId: Value(dto.plantShape.id!),
      // نفس الافتراض لـ PlantShapeDto
      quantity: Value(dto.quantity),
      deposit: dto.deposit != null ? Value(dto.deposit!) : const Value.absent(),
      isFullyPaid: Value(dto.isFullyPaid),
      isDelivered: Value(dto.isDelivered),
      notes: dto.notes != null ? Value(dto.notes!) : const Value.absent(),
    );
  }

  static ReservationDto fromTableData(
      ReservationsTableData data,
      double calculatedTotalAmount,
      PlantTypesTableData plantTypeData,
      PlantShapesTableData plantShapeData
      ) {
    return ReservationDto(
      id: data.id,
      fullName: data.fullName,
      phone: data.phone,
      reservationDate: data.reservationDate,
      deliveryDate: data.deliveryDate,
      plantType: PlantTypeMapper.fromTableData(plantTypeData),
      plantShape: PlantShapeMapper.fromTableData(plantShapeData),
      quantity: data.quantity,
      calculatedTotalAmount: calculatedTotalAmount,
      deposit: data.deposit,
      isFullyPaid: data.isFullyPaid,
      isDelivered: data.isDelivered,
      notes: data.notes,
    );
  }
}
