//tikder 0707:هنا اردت تجريب الاكستنجنز

import 'package:drift/drift.dart';
import 'package:local_tammoz_chat/data/local/local_database.dart'; // حيث تعرف جدول Prices
import 'package:local_tammoz_chat/data/mappers/plant_shape_mapper.dart';
import 'package:local_tammoz_chat/data/mappers/plant_type_mapper.dart';
import 'package:local_tammoz_chat/data/models/price_dto.dart';
import 'package:local_tammoz_chat/domain/entities/price.dart';

extension PriceDtoMapper on PriceDto {
  // من DTO إلى Entity
  PriceEntity toEntity() {
    return PriceEntity(
      id: id,
      plantType: PlantTypeMapper.toEntity(plantTypeDto),
      plantShape: PlantShapeMapper.toEntity(plantShapeDto),
      price: price,
    );
  }

  // من DTO إلى TableCompanion (لإدخال/تحديث في قاعدة البيانات)
  PricesTableCompanion toTableCompanion() {
    return PricesTableCompanion(
      id: id == null ? const Value.absent() : Value(id!),
      plantTypeId: Value(plantTypeDto.id!),
      plantShapeId: Value(plantShapeDto.id!),
      price: Value(price),
    );
  }
}

extension PriceMapper on PriceEntity {
  // من Entity إلى DTO
  PriceDto toDto() {
    return PriceDto(
      id: id,
      plantTypeDto: PlantTypeMapper.fromEntity(plantType),
      plantShapeDto: PlantShapeMapper.fromEntity(plantShape),
      price: price,
    );
  }
}

extension PricesTableDataMapper on PricesTableData {
  // من TableData (Price) إلى DTO
  PriceDto toDto(
        PlantTypesTableData plantTypeData,
        PlantShapesTableData plantShapeData,
      ) {
    return PriceDto(
      id: id,
      plantTypeDto: PlantTypeMapper.fromTableData(plantTypeData),
      plantShapeDto: PlantShapeMapper.fromTableData(plantShapeData),
      price: price,
    );
  }
}
