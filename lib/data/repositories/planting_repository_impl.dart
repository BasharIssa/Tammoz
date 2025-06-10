// lib/data/repositories/planting_repository_impl.dart

import 'package:get_it/get_it.dart';
import 'package:local_tammoz_chat/domain/entities/planting.dart';
import 'package:local_tammoz_chat/domain/entities/plant_type.dart';
import 'package:local_tammoz_chat/domain/repositories/planting_repository.dart';
import 'package:local_tammoz_chat/data/local/local_database.dart';
import 'package:local_tammoz_chat/data/mappers/planting_mapper.dart';
import 'package:local_tammoz_chat/data/mappers/plant_type_mapper.dart';
import 'package:local_tammoz_chat/data/models/planting_dto.dart';
import 'package:drift/drift.dart';

import '../models/plant_type_dto.dart';

class PlantingRepositoryImpl implements PlantingRepository {
  final LocalDatabase _db = GetIt.instance<LocalDatabase>();

  @override
  Future<List<Planting>> getAllPlantings() async {
    final query = (_db.select(_db.plantingTable)
      ..orderBy([(t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc)]))
        .join([
      leftOuterJoin(_db.plantTypesTable, _db.plantTypesTable.id.equalsExp(_db.plantingTable.typeId)),
    ]);

    final results = await query.get();

    // نعيد تحويل كل صف إلى DTO ثم إلى Domain Entity مع اسم النوع
    final plantings = results.map((row) {
      final plantingData = row.readTable(_db.plantingTable);
      final plantTypeData = row.readTableOrNull(_db.plantTypesTable);

      final dto = PlantingDto(
        id: plantingData.id,
        typeId: plantingData.typeId,
        quantity: plantingData.quantity,
        date: plantingData.date,
        initialCost: plantingData.initialCost,
      );

      return toDomain(dto, plantTypeData?.name ?? 'غير معروف');
    }).toList();

    return plantings;
  }

  @override
  Future<int> addPlanting(Planting planting) {
    final dto = toDto(planting);
    final companion = PlantingTableCompanion(
      typeId: Value(dto.typeId),
      quantity: Value(dto.quantity),
      date: Value(dto.date),
      initialCost: Value(dto.initialCost),
    );
    return _db.into(_db.plantingTable).insert(companion);
  }

  @override
  Future<void> updatePlanting(Planting planting) async {
    final dto = toDto(planting);
    final companion = PlantingTableCompanion(
      id:  Value(dto.id!) ,
      typeId: Value(dto.typeId),
      quantity: Value(dto.quantity),
      date: Value(dto.date),
      initialCost: Value(dto.initialCost),
    );
    await (_db.update(_db.plantingTable)).replace(companion);
  }

  @override
  Future<void> deletePlanting(int id) async {
    await (_db.delete(_db.plantingTable)..where((tbl) => tbl.id.equals(id))).go();
  }


  @override

  Future<List<PlantType>> getAllPlantTypes() async {
    final dataList = await _db.select(_db.plantTypesTable).get();

    if (dataList.isEmpty) {
      return []; // أو يمكنك رمي استثناء مخصص
    }

    final dtos = dataList
        .map((data) => PlantTypeDto(id: data.id, name: data.name))
        .toList();

    return dtos.map(toDomainPlantType).toList();
  }

  @override
  Future<int> addPlantType(PlantType plantType) {
    final dto = toDtoPlantType(plantType);
    final companion = PlantTypesTableCompanion(
      id: dto.id != null ? Value(dto.id!) : const Value.absent(),
      name: Value(dto.name),
    );
    return _db.into(_db.plantTypesTable).insert(companion);
  }
}
