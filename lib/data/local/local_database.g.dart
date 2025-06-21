// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_database.dart';

// ignore_for_file: type=lint
class $SetupExpenseTableTable extends SetupExpenseTable
    with TableInfo<$SetupExpenseTableTable, SetupExpenseTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SetupExpenseTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _globalIdMeta =
      const VerificationMeta('globalId');
  @override
  late final GeneratedColumn<String> globalId = GeneratedColumn<String>(
      'global_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: Constant(''));
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: Constant('pending'));
  static const VerificationMeta _categoryTypeMeta =
      const VerificationMeta('categoryType');
  @override
  late final GeneratedColumn<String> categoryType = GeneratedColumn<String>(
      'category_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _expenseTypeMeta =
      const VerificationMeta('expenseType');
  @override
  late final GeneratedColumn<String> expenseType = GeneratedColumn<String>(
      'expense_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _materialNameMeta =
      const VerificationMeta('materialName');
  @override
  late final GeneratedColumn<String> materialName = GeneratedColumn<String>(
      'material_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _costMeta = const VerificationMeta('cost');
  @override
  late final GeneratedColumn<double> cost = GeneratedColumn<double>(
      'cost', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        globalId,
        syncStatus,
        categoryType,
        expenseType,
        materialName,
        cost,
        date,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'setup_expense_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<SetupExpenseTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('global_id')) {
      context.handle(_globalIdMeta,
          globalId.isAcceptableOrUnknown(data['global_id']!, _globalIdMeta));
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    if (data.containsKey('category_type')) {
      context.handle(
          _categoryTypeMeta,
          categoryType.isAcceptableOrUnknown(
              data['category_type']!, _categoryTypeMeta));
    } else if (isInserting) {
      context.missing(_categoryTypeMeta);
    }
    if (data.containsKey('expense_type')) {
      context.handle(
          _expenseTypeMeta,
          expenseType.isAcceptableOrUnknown(
              data['expense_type']!, _expenseTypeMeta));
    } else if (isInserting) {
      context.missing(_expenseTypeMeta);
    }
    if (data.containsKey('material_name')) {
      context.handle(
          _materialNameMeta,
          materialName.isAcceptableOrUnknown(
              data['material_name']!, _materialNameMeta));
    }
    if (data.containsKey('cost')) {
      context.handle(
          _costMeta, cost.isAcceptableOrUnknown(data['cost']!, _costMeta));
    } else if (isInserting) {
      context.missing(_costMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SetupExpenseTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SetupExpenseTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      globalId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}global_id'])!,
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
      categoryType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_type'])!,
      expenseType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}expense_type'])!,
      materialName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}material_name']),
      cost: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}cost'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $SetupExpenseTableTable createAlias(String alias) {
    return $SetupExpenseTableTable(attachedDatabase, alias);
  }
}

class SetupExpenseTableData extends DataClass
    implements Insertable<SetupExpenseTableData> {
  final int id;
  final String globalId;
  final String syncStatus;
  final String categoryType;
  final String expenseType;
  final String? materialName;
  final double cost;
  final DateTime date;
  final DateTime createdAt;
  final DateTime updatedAt;
  const SetupExpenseTableData(
      {required this.id,
      required this.globalId,
      required this.syncStatus,
      required this.categoryType,
      required this.expenseType,
      this.materialName,
      required this.cost,
      required this.date,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['global_id'] = Variable<String>(globalId);
    map['sync_status'] = Variable<String>(syncStatus);
    map['category_type'] = Variable<String>(categoryType);
    map['expense_type'] = Variable<String>(expenseType);
    if (!nullToAbsent || materialName != null) {
      map['material_name'] = Variable<String>(materialName);
    }
    map['cost'] = Variable<double>(cost);
    map['date'] = Variable<DateTime>(date);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SetupExpenseTableCompanion toCompanion(bool nullToAbsent) {
    return SetupExpenseTableCompanion(
      id: Value(id),
      globalId: Value(globalId),
      syncStatus: Value(syncStatus),
      categoryType: Value(categoryType),
      expenseType: Value(expenseType),
      materialName: materialName == null && nullToAbsent
          ? const Value.absent()
          : Value(materialName),
      cost: Value(cost),
      date: Value(date),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory SetupExpenseTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SetupExpenseTableData(
      id: serializer.fromJson<int>(json['id']),
      globalId: serializer.fromJson<String>(json['globalId']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      categoryType: serializer.fromJson<String>(json['categoryType']),
      expenseType: serializer.fromJson<String>(json['expenseType']),
      materialName: serializer.fromJson<String?>(json['materialName']),
      cost: serializer.fromJson<double>(json['cost']),
      date: serializer.fromJson<DateTime>(json['date']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'globalId': serializer.toJson<String>(globalId),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'categoryType': serializer.toJson<String>(categoryType),
      'expenseType': serializer.toJson<String>(expenseType),
      'materialName': serializer.toJson<String?>(materialName),
      'cost': serializer.toJson<double>(cost),
      'date': serializer.toJson<DateTime>(date),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  SetupExpenseTableData copyWith(
          {int? id,
          String? globalId,
          String? syncStatus,
          String? categoryType,
          String? expenseType,
          Value<String?> materialName = const Value.absent(),
          double? cost,
          DateTime? date,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      SetupExpenseTableData(
        id: id ?? this.id,
        globalId: globalId ?? this.globalId,
        syncStatus: syncStatus ?? this.syncStatus,
        categoryType: categoryType ?? this.categoryType,
        expenseType: expenseType ?? this.expenseType,
        materialName:
            materialName.present ? materialName.value : this.materialName,
        cost: cost ?? this.cost,
        date: date ?? this.date,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  SetupExpenseTableData copyWithCompanion(SetupExpenseTableCompanion data) {
    return SetupExpenseTableData(
      id: data.id.present ? data.id.value : this.id,
      globalId: data.globalId.present ? data.globalId.value : this.globalId,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
      categoryType: data.categoryType.present
          ? data.categoryType.value
          : this.categoryType,
      expenseType:
          data.expenseType.present ? data.expenseType.value : this.expenseType,
      materialName: data.materialName.present
          ? data.materialName.value
          : this.materialName,
      cost: data.cost.present ? data.cost.value : this.cost,
      date: data.date.present ? data.date.value : this.date,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SetupExpenseTableData(')
          ..write('id: $id, ')
          ..write('globalId: $globalId, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('categoryType: $categoryType, ')
          ..write('expenseType: $expenseType, ')
          ..write('materialName: $materialName, ')
          ..write('cost: $cost, ')
          ..write('date: $date, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, globalId, syncStatus, categoryType,
      expenseType, materialName, cost, date, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SetupExpenseTableData &&
          other.id == this.id &&
          other.globalId == this.globalId &&
          other.syncStatus == this.syncStatus &&
          other.categoryType == this.categoryType &&
          other.expenseType == this.expenseType &&
          other.materialName == this.materialName &&
          other.cost == this.cost &&
          other.date == this.date &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SetupExpenseTableCompanion
    extends UpdateCompanion<SetupExpenseTableData> {
  final Value<int> id;
  final Value<String> globalId;
  final Value<String> syncStatus;
  final Value<String> categoryType;
  final Value<String> expenseType;
  final Value<String?> materialName;
  final Value<double> cost;
  final Value<DateTime> date;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const SetupExpenseTableCompanion({
    this.id = const Value.absent(),
    this.globalId = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.categoryType = const Value.absent(),
    this.expenseType = const Value.absent(),
    this.materialName = const Value.absent(),
    this.cost = const Value.absent(),
    this.date = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  SetupExpenseTableCompanion.insert({
    this.id = const Value.absent(),
    this.globalId = const Value.absent(),
    this.syncStatus = const Value.absent(),
    required String categoryType,
    required String expenseType,
    this.materialName = const Value.absent(),
    required double cost,
    required DateTime date,
    required DateTime createdAt,
    required DateTime updatedAt,
  })  : categoryType = Value(categoryType),
        expenseType = Value(expenseType),
        cost = Value(cost),
        date = Value(date),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<SetupExpenseTableData> custom({
    Expression<int>? id,
    Expression<String>? globalId,
    Expression<String>? syncStatus,
    Expression<String>? categoryType,
    Expression<String>? expenseType,
    Expression<String>? materialName,
    Expression<double>? cost,
    Expression<DateTime>? date,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (globalId != null) 'global_id': globalId,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (categoryType != null) 'category_type': categoryType,
      if (expenseType != null) 'expense_type': expenseType,
      if (materialName != null) 'material_name': materialName,
      if (cost != null) 'cost': cost,
      if (date != null) 'date': date,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  SetupExpenseTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? globalId,
      Value<String>? syncStatus,
      Value<String>? categoryType,
      Value<String>? expenseType,
      Value<String?>? materialName,
      Value<double>? cost,
      Value<DateTime>? date,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return SetupExpenseTableCompanion(
      id: id ?? this.id,
      globalId: globalId ?? this.globalId,
      syncStatus: syncStatus ?? this.syncStatus,
      categoryType: categoryType ?? this.categoryType,
      expenseType: expenseType ?? this.expenseType,
      materialName: materialName ?? this.materialName,
      cost: cost ?? this.cost,
      date: date ?? this.date,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (globalId.present) {
      map['global_id'] = Variable<String>(globalId.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (categoryType.present) {
      map['category_type'] = Variable<String>(categoryType.value);
    }
    if (expenseType.present) {
      map['expense_type'] = Variable<String>(expenseType.value);
    }
    if (materialName.present) {
      map['material_name'] = Variable<String>(materialName.value);
    }
    if (cost.present) {
      map['cost'] = Variable<double>(cost.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SetupExpenseTableCompanion(')
          ..write('id: $id, ')
          ..write('globalId: $globalId, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('categoryType: $categoryType, ')
          ..write('expenseType: $expenseType, ')
          ..write('materialName: $materialName, ')
          ..write('cost: $cost, ')
          ..write('date: $date, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $PlantTypesTableTable extends PlantTypesTable
    with TableInfo<$PlantTypesTableTable, PlantTypesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlantTypesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'plant_types_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<PlantTypesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlantTypesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlantTypesTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $PlantTypesTableTable createAlias(String alias) {
    return $PlantTypesTableTable(attachedDatabase, alias);
  }
}

class PlantTypesTableData extends DataClass
    implements Insertable<PlantTypesTableData> {
  final int id;
  final String name;
  const PlantTypesTableData({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  PlantTypesTableCompanion toCompanion(bool nullToAbsent) {
    return PlantTypesTableCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory PlantTypesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlantTypesTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  PlantTypesTableData copyWith({int? id, String? name}) => PlantTypesTableData(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  PlantTypesTableData copyWithCompanion(PlantTypesTableCompanion data) {
    return PlantTypesTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlantTypesTableData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlantTypesTableData &&
          other.id == this.id &&
          other.name == this.name);
}

class PlantTypesTableCompanion extends UpdateCompanion<PlantTypesTableData> {
  final Value<int> id;
  final Value<String> name;
  const PlantTypesTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  PlantTypesTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<PlantTypesTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  PlantTypesTableCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return PlantTypesTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlantTypesTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $PlantingTableTable extends PlantingTable
    with TableInfo<$PlantingTableTable, PlantingTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlantingTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _typeIdMeta = const VerificationMeta('typeId');
  @override
  late final GeneratedColumn<int> typeId = GeneratedColumn<int>(
      'type_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES plant_types_table (id)'));
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _initialCostMeta =
      const VerificationMeta('initialCost');
  @override
  late final GeneratedColumn<double> initialCost = GeneratedColumn<double>(
      'initial_cost', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, typeId, quantity, date, initialCost];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'planting_table';
  @override
  VerificationContext validateIntegrity(Insertable<PlantingTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('type_id')) {
      context.handle(_typeIdMeta,
          typeId.isAcceptableOrUnknown(data['type_id']!, _typeIdMeta));
    } else if (isInserting) {
      context.missing(_typeIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('initial_cost')) {
      context.handle(
          _initialCostMeta,
          initialCost.isAcceptableOrUnknown(
              data['initial_cost']!, _initialCostMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlantingTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlantingTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      typeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type_id'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      initialCost: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}initial_cost']),
    );
  }

  @override
  $PlantingTableTable createAlias(String alias) {
    return $PlantingTableTable(attachedDatabase, alias);
  }
}

class PlantingTableData extends DataClass
    implements Insertable<PlantingTableData> {
  final int id;
  final int typeId;
  final int quantity;
  final DateTime date;
  final double? initialCost;
  const PlantingTableData(
      {required this.id,
      required this.typeId,
      required this.quantity,
      required this.date,
      this.initialCost});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['type_id'] = Variable<int>(typeId);
    map['quantity'] = Variable<int>(quantity);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || initialCost != null) {
      map['initial_cost'] = Variable<double>(initialCost);
    }
    return map;
  }

  PlantingTableCompanion toCompanion(bool nullToAbsent) {
    return PlantingTableCompanion(
      id: Value(id),
      typeId: Value(typeId),
      quantity: Value(quantity),
      date: Value(date),
      initialCost: initialCost == null && nullToAbsent
          ? const Value.absent()
          : Value(initialCost),
    );
  }

  factory PlantingTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlantingTableData(
      id: serializer.fromJson<int>(json['id']),
      typeId: serializer.fromJson<int>(json['typeId']),
      quantity: serializer.fromJson<int>(json['quantity']),
      date: serializer.fromJson<DateTime>(json['date']),
      initialCost: serializer.fromJson<double?>(json['initialCost']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'typeId': serializer.toJson<int>(typeId),
      'quantity': serializer.toJson<int>(quantity),
      'date': serializer.toJson<DateTime>(date),
      'initialCost': serializer.toJson<double?>(initialCost),
    };
  }

  PlantingTableData copyWith(
          {int? id,
          int? typeId,
          int? quantity,
          DateTime? date,
          Value<double?> initialCost = const Value.absent()}) =>
      PlantingTableData(
        id: id ?? this.id,
        typeId: typeId ?? this.typeId,
        quantity: quantity ?? this.quantity,
        date: date ?? this.date,
        initialCost: initialCost.present ? initialCost.value : this.initialCost,
      );
  PlantingTableData copyWithCompanion(PlantingTableCompanion data) {
    return PlantingTableData(
      id: data.id.present ? data.id.value : this.id,
      typeId: data.typeId.present ? data.typeId.value : this.typeId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      date: data.date.present ? data.date.value : this.date,
      initialCost:
          data.initialCost.present ? data.initialCost.value : this.initialCost,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlantingTableData(')
          ..write('id: $id, ')
          ..write('typeId: $typeId, ')
          ..write('quantity: $quantity, ')
          ..write('date: $date, ')
          ..write('initialCost: $initialCost')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, typeId, quantity, date, initialCost);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlantingTableData &&
          other.id == this.id &&
          other.typeId == this.typeId &&
          other.quantity == this.quantity &&
          other.date == this.date &&
          other.initialCost == this.initialCost);
}

class PlantingTableCompanion extends UpdateCompanion<PlantingTableData> {
  final Value<int> id;
  final Value<int> typeId;
  final Value<int> quantity;
  final Value<DateTime> date;
  final Value<double?> initialCost;
  const PlantingTableCompanion({
    this.id = const Value.absent(),
    this.typeId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.date = const Value.absent(),
    this.initialCost = const Value.absent(),
  });
  PlantingTableCompanion.insert({
    this.id = const Value.absent(),
    required int typeId,
    required int quantity,
    required DateTime date,
    this.initialCost = const Value.absent(),
  })  : typeId = Value(typeId),
        quantity = Value(quantity),
        date = Value(date);
  static Insertable<PlantingTableData> custom({
    Expression<int>? id,
    Expression<int>? typeId,
    Expression<int>? quantity,
    Expression<DateTime>? date,
    Expression<double>? initialCost,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (typeId != null) 'type_id': typeId,
      if (quantity != null) 'quantity': quantity,
      if (date != null) 'date': date,
      if (initialCost != null) 'initial_cost': initialCost,
    });
  }

  PlantingTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? typeId,
      Value<int>? quantity,
      Value<DateTime>? date,
      Value<double?>? initialCost}) {
    return PlantingTableCompanion(
      id: id ?? this.id,
      typeId: typeId ?? this.typeId,
      quantity: quantity ?? this.quantity,
      date: date ?? this.date,
      initialCost: initialCost ?? this.initialCost,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (typeId.present) {
      map['type_id'] = Variable<int>(typeId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (initialCost.present) {
      map['initial_cost'] = Variable<double>(initialCost.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlantingTableCompanion(')
          ..write('id: $id, ')
          ..write('typeId: $typeId, ')
          ..write('quantity: $quantity, ')
          ..write('date: $date, ')
          ..write('initialCost: $initialCost')
          ..write(')'))
        .toString();
  }
}

class $PlantShapesTableTable extends PlantShapesTable
    with TableInfo<$PlantShapesTableTable, PlantShapesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlantShapesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _nurseryPeriodMeta =
      const VerificationMeta('nurseryPeriod');
  @override
  late final GeneratedColumn<int> nurseryPeriod = GeneratedColumn<int>(
      'nursery_period', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, nurseryPeriod];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'plant_shapes_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<PlantShapesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('nursery_period')) {
      context.handle(
          _nurseryPeriodMeta,
          nurseryPeriod.isAcceptableOrUnknown(
              data['nursery_period']!, _nurseryPeriodMeta));
    } else if (isInserting) {
      context.missing(_nurseryPeriodMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlantShapesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlantShapesTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      nurseryPeriod: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}nursery_period'])!,
    );
  }

  @override
  $PlantShapesTableTable createAlias(String alias) {
    return $PlantShapesTableTable(attachedDatabase, alias);
  }
}

class PlantShapesTableData extends DataClass
    implements Insertable<PlantShapesTableData> {
  final int id;
  final String name;
  final int nurseryPeriod;
  const PlantShapesTableData(
      {required this.id, required this.name, required this.nurseryPeriod});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['nursery_period'] = Variable<int>(nurseryPeriod);
    return map;
  }

  PlantShapesTableCompanion toCompanion(bool nullToAbsent) {
    return PlantShapesTableCompanion(
      id: Value(id),
      name: Value(name),
      nurseryPeriod: Value(nurseryPeriod),
    );
  }

  factory PlantShapesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlantShapesTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      nurseryPeriod: serializer.fromJson<int>(json['nurseryPeriod']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'nurseryPeriod': serializer.toJson<int>(nurseryPeriod),
    };
  }

  PlantShapesTableData copyWith({int? id, String? name, int? nurseryPeriod}) =>
      PlantShapesTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        nurseryPeriod: nurseryPeriod ?? this.nurseryPeriod,
      );
  PlantShapesTableData copyWithCompanion(PlantShapesTableCompanion data) {
    return PlantShapesTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      nurseryPeriod: data.nurseryPeriod.present
          ? data.nurseryPeriod.value
          : this.nurseryPeriod,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlantShapesTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nurseryPeriod: $nurseryPeriod')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, nurseryPeriod);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlantShapesTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.nurseryPeriod == this.nurseryPeriod);
}

class PlantShapesTableCompanion extends UpdateCompanion<PlantShapesTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> nurseryPeriod;
  const PlantShapesTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.nurseryPeriod = const Value.absent(),
  });
  PlantShapesTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int nurseryPeriod,
  })  : name = Value(name),
        nurseryPeriod = Value(nurseryPeriod);
  static Insertable<PlantShapesTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? nurseryPeriod,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (nurseryPeriod != null) 'nursery_period': nurseryPeriod,
    });
  }

  PlantShapesTableCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<int>? nurseryPeriod}) {
    return PlantShapesTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      nurseryPeriod: nurseryPeriod ?? this.nurseryPeriod,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (nurseryPeriod.present) {
      map['nursery_period'] = Variable<int>(nurseryPeriod.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlantShapesTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nurseryPeriod: $nurseryPeriod')
          ..write(')'))
        .toString();
  }
}

class $OperationTypesTableTable extends OperationTypesTable
    with TableInfo<$OperationTypesTableTable, OperationTypesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OperationTypesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _successRatioMeta =
      const VerificationMeta('successRatio');
  @override
  late final GeneratedColumn<double> successRatio = GeneratedColumn<double>(
      'success_ratio', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  @override
  List<GeneratedColumn> get $columns => [id, name, successRatio];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'operation_types_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<OperationTypesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('success_ratio')) {
      context.handle(
          _successRatioMeta,
          successRatio.isAcceptableOrUnknown(
              data['success_ratio']!, _successRatioMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OperationTypesTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OperationTypesTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      successRatio: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}success_ratio'])!,
    );
  }

  @override
  $OperationTypesTableTable createAlias(String alias) {
    return $OperationTypesTableTable(attachedDatabase, alias);
  }
}

class OperationTypesTableData extends DataClass
    implements Insertable<OperationTypesTableData> {
  final int id;
  final String name;
  final double successRatio;
  const OperationTypesTableData(
      {required this.id, required this.name, required this.successRatio});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['success_ratio'] = Variable<double>(successRatio);
    return map;
  }

  OperationTypesTableCompanion toCompanion(bool nullToAbsent) {
    return OperationTypesTableCompanion(
      id: Value(id),
      name: Value(name),
      successRatio: Value(successRatio),
    );
  }

  factory OperationTypesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OperationTypesTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      successRatio: serializer.fromJson<double>(json['successRatio']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'successRatio': serializer.toJson<double>(successRatio),
    };
  }

  OperationTypesTableData copyWith(
          {int? id, String? name, double? successRatio}) =>
      OperationTypesTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        successRatio: successRatio ?? this.successRatio,
      );
  OperationTypesTableData copyWithCompanion(OperationTypesTableCompanion data) {
    return OperationTypesTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      successRatio: data.successRatio.present
          ? data.successRatio.value
          : this.successRatio,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OperationTypesTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('successRatio: $successRatio')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, successRatio);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OperationTypesTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.successRatio == this.successRatio);
}

class OperationTypesTableCompanion
    extends UpdateCompanion<OperationTypesTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<double> successRatio;
  const OperationTypesTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.successRatio = const Value.absent(),
  });
  OperationTypesTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.successRatio = const Value.absent(),
  }) : name = Value(name);
  static Insertable<OperationTypesTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? successRatio,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (successRatio != null) 'success_ratio': successRatio,
    });
  }

  OperationTypesTableCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<double>? successRatio}) {
    return OperationTypesTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      successRatio: successRatio ?? this.successRatio,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (successRatio.present) {
      map['success_ratio'] = Variable<double>(successRatio.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OperationTypesTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('successRatio: $successRatio')
          ..write(')'))
        .toString();
  }
}

class $OperationsTableTable extends OperationsTable
    with TableInfo<$OperationsTableTable, OperationsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OperationsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _operationTypeIdMeta =
      const VerificationMeta('operationTypeId');
  @override
  late final GeneratedColumn<int> operationTypeId = GeneratedColumn<int>(
      'operation_type_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES operation_types_table (id)'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _firstTypeIdMeta =
      const VerificationMeta('firstTypeId');
  @override
  late final GeneratedColumn<int> firstTypeId = GeneratedColumn<int>(
      'first_type_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES plant_types_table (id)'));
  static const VerificationMeta _firstShapeIdMeta =
      const VerificationMeta('firstShapeId');
  @override
  late final GeneratedColumn<int> firstShapeId = GeneratedColumn<int>(
      'first_shape_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES plant_shapes_table (id)'));
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _secondTypeIdMeta =
      const VerificationMeta('secondTypeId');
  @override
  late final GeneratedColumn<int> secondTypeId = GeneratedColumn<int>(
      'second_type_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES plant_types_table (id)'));
  static const VerificationMeta _secondShapeIdMeta =
      const VerificationMeta('secondShapeId');
  @override
  late final GeneratedColumn<int> secondShapeId = GeneratedColumn<int>(
      'second_shape_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES plant_shapes_table (id)'));
  static const VerificationMeta _scheduledMeta =
      const VerificationMeta('scheduled');
  @override
  late final GeneratedColumn<bool> scheduled = GeneratedColumn<bool>(
      'scheduled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("scheduled" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _reservationIdMeta =
      const VerificationMeta('reservationId');
  @override
  late final GeneratedColumn<int> reservationId = GeneratedColumn<int>(
      'reservation_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        operationTypeId,
        date,
        firstTypeId,
        firstShapeId,
        quantity,
        secondTypeId,
        secondShapeId,
        scheduled,
        reservationId,
        notes
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'operations_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<OperationsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('operation_type_id')) {
      context.handle(
          _operationTypeIdMeta,
          operationTypeId.isAcceptableOrUnknown(
              data['operation_type_id']!, _operationTypeIdMeta));
    } else if (isInserting) {
      context.missing(_operationTypeIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('first_type_id')) {
      context.handle(
          _firstTypeIdMeta,
          firstTypeId.isAcceptableOrUnknown(
              data['first_type_id']!, _firstTypeIdMeta));
    } else if (isInserting) {
      context.missing(_firstTypeIdMeta);
    }
    if (data.containsKey('first_shape_id')) {
      context.handle(
          _firstShapeIdMeta,
          firstShapeId.isAcceptableOrUnknown(
              data['first_shape_id']!, _firstShapeIdMeta));
    } else if (isInserting) {
      context.missing(_firstShapeIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('second_type_id')) {
      context.handle(
          _secondTypeIdMeta,
          secondTypeId.isAcceptableOrUnknown(
              data['second_type_id']!, _secondTypeIdMeta));
    }
    if (data.containsKey('second_shape_id')) {
      context.handle(
          _secondShapeIdMeta,
          secondShapeId.isAcceptableOrUnknown(
              data['second_shape_id']!, _secondShapeIdMeta));
    }
    if (data.containsKey('scheduled')) {
      context.handle(_scheduledMeta,
          scheduled.isAcceptableOrUnknown(data['scheduled']!, _scheduledMeta));
    }
    if (data.containsKey('reservation_id')) {
      context.handle(
          _reservationIdMeta,
          reservationId.isAcceptableOrUnknown(
              data['reservation_id']!, _reservationIdMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OperationsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OperationsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      operationTypeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}operation_type_id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      firstTypeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}first_type_id'])!,
      firstShapeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}first_shape_id'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      secondTypeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}second_type_id']),
      secondShapeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}second_shape_id']),
      scheduled: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}scheduled'])!,
      reservationId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}reservation_id']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
    );
  }

  @override
  $OperationsTableTable createAlias(String alias) {
    return $OperationsTableTable(attachedDatabase, alias);
  }
}

class OperationsTableData extends DataClass
    implements Insertable<OperationsTableData> {
  final int id;
  final int operationTypeId;
  final DateTime date;
  final int firstTypeId;
  final int firstShapeId;
  final int quantity;
  final int? secondTypeId;
  final int? secondShapeId;
  final bool scheduled;
  final int? reservationId;
  final String? notes;
  const OperationsTableData(
      {required this.id,
      required this.operationTypeId,
      required this.date,
      required this.firstTypeId,
      required this.firstShapeId,
      required this.quantity,
      this.secondTypeId,
      this.secondShapeId,
      required this.scheduled,
      this.reservationId,
      this.notes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['operation_type_id'] = Variable<int>(operationTypeId);
    map['date'] = Variable<DateTime>(date);
    map['first_type_id'] = Variable<int>(firstTypeId);
    map['first_shape_id'] = Variable<int>(firstShapeId);
    map['quantity'] = Variable<int>(quantity);
    if (!nullToAbsent || secondTypeId != null) {
      map['second_type_id'] = Variable<int>(secondTypeId);
    }
    if (!nullToAbsent || secondShapeId != null) {
      map['second_shape_id'] = Variable<int>(secondShapeId);
    }
    map['scheduled'] = Variable<bool>(scheduled);
    if (!nullToAbsent || reservationId != null) {
      map['reservation_id'] = Variable<int>(reservationId);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  OperationsTableCompanion toCompanion(bool nullToAbsent) {
    return OperationsTableCompanion(
      id: Value(id),
      operationTypeId: Value(operationTypeId),
      date: Value(date),
      firstTypeId: Value(firstTypeId),
      firstShapeId: Value(firstShapeId),
      quantity: Value(quantity),
      secondTypeId: secondTypeId == null && nullToAbsent
          ? const Value.absent()
          : Value(secondTypeId),
      secondShapeId: secondShapeId == null && nullToAbsent
          ? const Value.absent()
          : Value(secondShapeId),
      scheduled: Value(scheduled),
      reservationId: reservationId == null && nullToAbsent
          ? const Value.absent()
          : Value(reservationId),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory OperationsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OperationsTableData(
      id: serializer.fromJson<int>(json['id']),
      operationTypeId: serializer.fromJson<int>(json['operationTypeId']),
      date: serializer.fromJson<DateTime>(json['date']),
      firstTypeId: serializer.fromJson<int>(json['firstTypeId']),
      firstShapeId: serializer.fromJson<int>(json['firstShapeId']),
      quantity: serializer.fromJson<int>(json['quantity']),
      secondTypeId: serializer.fromJson<int?>(json['secondTypeId']),
      secondShapeId: serializer.fromJson<int?>(json['secondShapeId']),
      scheduled: serializer.fromJson<bool>(json['scheduled']),
      reservationId: serializer.fromJson<int?>(json['reservationId']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'operationTypeId': serializer.toJson<int>(operationTypeId),
      'date': serializer.toJson<DateTime>(date),
      'firstTypeId': serializer.toJson<int>(firstTypeId),
      'firstShapeId': serializer.toJson<int>(firstShapeId),
      'quantity': serializer.toJson<int>(quantity),
      'secondTypeId': serializer.toJson<int?>(secondTypeId),
      'secondShapeId': serializer.toJson<int?>(secondShapeId),
      'scheduled': serializer.toJson<bool>(scheduled),
      'reservationId': serializer.toJson<int?>(reservationId),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  OperationsTableData copyWith(
          {int? id,
          int? operationTypeId,
          DateTime? date,
          int? firstTypeId,
          int? firstShapeId,
          int? quantity,
          Value<int?> secondTypeId = const Value.absent(),
          Value<int?> secondShapeId = const Value.absent(),
          bool? scheduled,
          Value<int?> reservationId = const Value.absent(),
          Value<String?> notes = const Value.absent()}) =>
      OperationsTableData(
        id: id ?? this.id,
        operationTypeId: operationTypeId ?? this.operationTypeId,
        date: date ?? this.date,
        firstTypeId: firstTypeId ?? this.firstTypeId,
        firstShapeId: firstShapeId ?? this.firstShapeId,
        quantity: quantity ?? this.quantity,
        secondTypeId:
            secondTypeId.present ? secondTypeId.value : this.secondTypeId,
        secondShapeId:
            secondShapeId.present ? secondShapeId.value : this.secondShapeId,
        scheduled: scheduled ?? this.scheduled,
        reservationId:
            reservationId.present ? reservationId.value : this.reservationId,
        notes: notes.present ? notes.value : this.notes,
      );
  OperationsTableData copyWithCompanion(OperationsTableCompanion data) {
    return OperationsTableData(
      id: data.id.present ? data.id.value : this.id,
      operationTypeId: data.operationTypeId.present
          ? data.operationTypeId.value
          : this.operationTypeId,
      date: data.date.present ? data.date.value : this.date,
      firstTypeId:
          data.firstTypeId.present ? data.firstTypeId.value : this.firstTypeId,
      firstShapeId: data.firstShapeId.present
          ? data.firstShapeId.value
          : this.firstShapeId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      secondTypeId: data.secondTypeId.present
          ? data.secondTypeId.value
          : this.secondTypeId,
      secondShapeId: data.secondShapeId.present
          ? data.secondShapeId.value
          : this.secondShapeId,
      scheduled: data.scheduled.present ? data.scheduled.value : this.scheduled,
      reservationId: data.reservationId.present
          ? data.reservationId.value
          : this.reservationId,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OperationsTableData(')
          ..write('id: $id, ')
          ..write('operationTypeId: $operationTypeId, ')
          ..write('date: $date, ')
          ..write('firstTypeId: $firstTypeId, ')
          ..write('firstShapeId: $firstShapeId, ')
          ..write('quantity: $quantity, ')
          ..write('secondTypeId: $secondTypeId, ')
          ..write('secondShapeId: $secondShapeId, ')
          ..write('scheduled: $scheduled, ')
          ..write('reservationId: $reservationId, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      operationTypeId,
      date,
      firstTypeId,
      firstShapeId,
      quantity,
      secondTypeId,
      secondShapeId,
      scheduled,
      reservationId,
      notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OperationsTableData &&
          other.id == this.id &&
          other.operationTypeId == this.operationTypeId &&
          other.date == this.date &&
          other.firstTypeId == this.firstTypeId &&
          other.firstShapeId == this.firstShapeId &&
          other.quantity == this.quantity &&
          other.secondTypeId == this.secondTypeId &&
          other.secondShapeId == this.secondShapeId &&
          other.scheduled == this.scheduled &&
          other.reservationId == this.reservationId &&
          other.notes == this.notes);
}

class OperationsTableCompanion extends UpdateCompanion<OperationsTableData> {
  final Value<int> id;
  final Value<int> operationTypeId;
  final Value<DateTime> date;
  final Value<int> firstTypeId;
  final Value<int> firstShapeId;
  final Value<int> quantity;
  final Value<int?> secondTypeId;
  final Value<int?> secondShapeId;
  final Value<bool> scheduled;
  final Value<int?> reservationId;
  final Value<String?> notes;
  const OperationsTableCompanion({
    this.id = const Value.absent(),
    this.operationTypeId = const Value.absent(),
    this.date = const Value.absent(),
    this.firstTypeId = const Value.absent(),
    this.firstShapeId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.secondTypeId = const Value.absent(),
    this.secondShapeId = const Value.absent(),
    this.scheduled = const Value.absent(),
    this.reservationId = const Value.absent(),
    this.notes = const Value.absent(),
  });
  OperationsTableCompanion.insert({
    this.id = const Value.absent(),
    required int operationTypeId,
    required DateTime date,
    required int firstTypeId,
    required int firstShapeId,
    required int quantity,
    this.secondTypeId = const Value.absent(),
    this.secondShapeId = const Value.absent(),
    this.scheduled = const Value.absent(),
    this.reservationId = const Value.absent(),
    this.notes = const Value.absent(),
  })  : operationTypeId = Value(operationTypeId),
        date = Value(date),
        firstTypeId = Value(firstTypeId),
        firstShapeId = Value(firstShapeId),
        quantity = Value(quantity);
  static Insertable<OperationsTableData> custom({
    Expression<int>? id,
    Expression<int>? operationTypeId,
    Expression<DateTime>? date,
    Expression<int>? firstTypeId,
    Expression<int>? firstShapeId,
    Expression<int>? quantity,
    Expression<int>? secondTypeId,
    Expression<int>? secondShapeId,
    Expression<bool>? scheduled,
    Expression<int>? reservationId,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (operationTypeId != null) 'operation_type_id': operationTypeId,
      if (date != null) 'date': date,
      if (firstTypeId != null) 'first_type_id': firstTypeId,
      if (firstShapeId != null) 'first_shape_id': firstShapeId,
      if (quantity != null) 'quantity': quantity,
      if (secondTypeId != null) 'second_type_id': secondTypeId,
      if (secondShapeId != null) 'second_shape_id': secondShapeId,
      if (scheduled != null) 'scheduled': scheduled,
      if (reservationId != null) 'reservation_id': reservationId,
      if (notes != null) 'notes': notes,
    });
  }

  OperationsTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? operationTypeId,
      Value<DateTime>? date,
      Value<int>? firstTypeId,
      Value<int>? firstShapeId,
      Value<int>? quantity,
      Value<int?>? secondTypeId,
      Value<int?>? secondShapeId,
      Value<bool>? scheduled,
      Value<int?>? reservationId,
      Value<String?>? notes}) {
    return OperationsTableCompanion(
      id: id ?? this.id,
      operationTypeId: operationTypeId ?? this.operationTypeId,
      date: date ?? this.date,
      firstTypeId: firstTypeId ?? this.firstTypeId,
      firstShapeId: firstShapeId ?? this.firstShapeId,
      quantity: quantity ?? this.quantity,
      secondTypeId: secondTypeId ?? this.secondTypeId,
      secondShapeId: secondShapeId ?? this.secondShapeId,
      scheduled: scheduled ?? this.scheduled,
      reservationId: reservationId ?? this.reservationId,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (operationTypeId.present) {
      map['operation_type_id'] = Variable<int>(operationTypeId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (firstTypeId.present) {
      map['first_type_id'] = Variable<int>(firstTypeId.value);
    }
    if (firstShapeId.present) {
      map['first_shape_id'] = Variable<int>(firstShapeId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (secondTypeId.present) {
      map['second_type_id'] = Variable<int>(secondTypeId.value);
    }
    if (secondShapeId.present) {
      map['second_shape_id'] = Variable<int>(secondShapeId.value);
    }
    if (scheduled.present) {
      map['scheduled'] = Variable<bool>(scheduled.value);
    }
    if (reservationId.present) {
      map['reservation_id'] = Variable<int>(reservationId.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OperationsTableCompanion(')
          ..write('id: $id, ')
          ..write('operationTypeId: $operationTypeId, ')
          ..write('date: $date, ')
          ..write('firstTypeId: $firstTypeId, ')
          ..write('firstShapeId: $firstShapeId, ')
          ..write('quantity: $quantity, ')
          ..write('secondTypeId: $secondTypeId, ')
          ..write('secondShapeId: $secondShapeId, ')
          ..write('scheduled: $scheduled, ')
          ..write('reservationId: $reservationId, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class $StorageTableTable extends StorageTable
    with TableInfo<$StorageTableTable, StorageTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StorageTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _plantTypeIdMeta =
      const VerificationMeta('plantTypeId');
  @override
  late final GeneratedColumn<int> plantTypeId = GeneratedColumn<int>(
      'plant_type_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES plant_types_table (id)'));
  static const VerificationMeta _plantShapeIdMeta =
      const VerificationMeta('plantShapeId');
  @override
  late final GeneratedColumn<int> plantShapeId = GeneratedColumn<int>(
      'plant_shape_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES plant_shapes_table (id)'));
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _parentOperationIdMeta =
      const VerificationMeta('parentOperationId');
  @override
  late final GeneratedColumn<int> parentOperationId = GeneratedColumn<int>(
      'parent_operation_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES operations_table (id)'));
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, plantTypeId, plantShapeId, quantity, parentOperationId, notes];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'storage_table';
  @override
  VerificationContext validateIntegrity(Insertable<StorageTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('plant_type_id')) {
      context.handle(
          _plantTypeIdMeta,
          plantTypeId.isAcceptableOrUnknown(
              data['plant_type_id']!, _plantTypeIdMeta));
    } else if (isInserting) {
      context.missing(_plantTypeIdMeta);
    }
    if (data.containsKey('plant_shape_id')) {
      context.handle(
          _plantShapeIdMeta,
          plantShapeId.isAcceptableOrUnknown(
              data['plant_shape_id']!, _plantShapeIdMeta));
    } else if (isInserting) {
      context.missing(_plantShapeIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('parent_operation_id')) {
      context.handle(
          _parentOperationIdMeta,
          parentOperationId.isAcceptableOrUnknown(
              data['parent_operation_id']!, _parentOperationIdMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StorageTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StorageTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      plantTypeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}plant_type_id'])!,
      plantShapeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}plant_shape_id'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      parentOperationId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}parent_operation_id']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
    );
  }

  @override
  $StorageTableTable createAlias(String alias) {
    return $StorageTableTable(attachedDatabase, alias);
  }
}

class StorageTableData extends DataClass
    implements Insertable<StorageTableData> {
  final int id;
  final int plantTypeId;
  final int plantShapeId;
  final int quantity;
  final int? parentOperationId;
  final String? notes;
  const StorageTableData(
      {required this.id,
      required this.plantTypeId,
      required this.plantShapeId,
      required this.quantity,
      this.parentOperationId,
      this.notes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['plant_type_id'] = Variable<int>(plantTypeId);
    map['plant_shape_id'] = Variable<int>(plantShapeId);
    map['quantity'] = Variable<int>(quantity);
    if (!nullToAbsent || parentOperationId != null) {
      map['parent_operation_id'] = Variable<int>(parentOperationId);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  StorageTableCompanion toCompanion(bool nullToAbsent) {
    return StorageTableCompanion(
      id: Value(id),
      plantTypeId: Value(plantTypeId),
      plantShapeId: Value(plantShapeId),
      quantity: Value(quantity),
      parentOperationId: parentOperationId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentOperationId),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory StorageTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StorageTableData(
      id: serializer.fromJson<int>(json['id']),
      plantTypeId: serializer.fromJson<int>(json['plantTypeId']),
      plantShapeId: serializer.fromJson<int>(json['plantShapeId']),
      quantity: serializer.fromJson<int>(json['quantity']),
      parentOperationId: serializer.fromJson<int?>(json['parentOperationId']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'plantTypeId': serializer.toJson<int>(plantTypeId),
      'plantShapeId': serializer.toJson<int>(plantShapeId),
      'quantity': serializer.toJson<int>(quantity),
      'parentOperationId': serializer.toJson<int?>(parentOperationId),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  StorageTableData copyWith(
          {int? id,
          int? plantTypeId,
          int? plantShapeId,
          int? quantity,
          Value<int?> parentOperationId = const Value.absent(),
          Value<String?> notes = const Value.absent()}) =>
      StorageTableData(
        id: id ?? this.id,
        plantTypeId: plantTypeId ?? this.plantTypeId,
        plantShapeId: plantShapeId ?? this.plantShapeId,
        quantity: quantity ?? this.quantity,
        parentOperationId: parentOperationId.present
            ? parentOperationId.value
            : this.parentOperationId,
        notes: notes.present ? notes.value : this.notes,
      );
  StorageTableData copyWithCompanion(StorageTableCompanion data) {
    return StorageTableData(
      id: data.id.present ? data.id.value : this.id,
      plantTypeId:
          data.plantTypeId.present ? data.plantTypeId.value : this.plantTypeId,
      plantShapeId: data.plantShapeId.present
          ? data.plantShapeId.value
          : this.plantShapeId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      parentOperationId: data.parentOperationId.present
          ? data.parentOperationId.value
          : this.parentOperationId,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StorageTableData(')
          ..write('id: $id, ')
          ..write('plantTypeId: $plantTypeId, ')
          ..write('plantShapeId: $plantShapeId, ')
          ..write('quantity: $quantity, ')
          ..write('parentOperationId: $parentOperationId, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, plantTypeId, plantShapeId, quantity, parentOperationId, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StorageTableData &&
          other.id == this.id &&
          other.plantTypeId == this.plantTypeId &&
          other.plantShapeId == this.plantShapeId &&
          other.quantity == this.quantity &&
          other.parentOperationId == this.parentOperationId &&
          other.notes == this.notes);
}

class StorageTableCompanion extends UpdateCompanion<StorageTableData> {
  final Value<int> id;
  final Value<int> plantTypeId;
  final Value<int> plantShapeId;
  final Value<int> quantity;
  final Value<int?> parentOperationId;
  final Value<String?> notes;
  const StorageTableCompanion({
    this.id = const Value.absent(),
    this.plantTypeId = const Value.absent(),
    this.plantShapeId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.parentOperationId = const Value.absent(),
    this.notes = const Value.absent(),
  });
  StorageTableCompanion.insert({
    this.id = const Value.absent(),
    required int plantTypeId,
    required int plantShapeId,
    required int quantity,
    this.parentOperationId = const Value.absent(),
    this.notes = const Value.absent(),
  })  : plantTypeId = Value(plantTypeId),
        plantShapeId = Value(plantShapeId),
        quantity = Value(quantity);
  static Insertable<StorageTableData> custom({
    Expression<int>? id,
    Expression<int>? plantTypeId,
    Expression<int>? plantShapeId,
    Expression<int>? quantity,
    Expression<int>? parentOperationId,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (plantTypeId != null) 'plant_type_id': plantTypeId,
      if (plantShapeId != null) 'plant_shape_id': plantShapeId,
      if (quantity != null) 'quantity': quantity,
      if (parentOperationId != null) 'parent_operation_id': parentOperationId,
      if (notes != null) 'notes': notes,
    });
  }

  StorageTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? plantTypeId,
      Value<int>? plantShapeId,
      Value<int>? quantity,
      Value<int?>? parentOperationId,
      Value<String?>? notes}) {
    return StorageTableCompanion(
      id: id ?? this.id,
      plantTypeId: plantTypeId ?? this.plantTypeId,
      plantShapeId: plantShapeId ?? this.plantShapeId,
      quantity: quantity ?? this.quantity,
      parentOperationId: parentOperationId ?? this.parentOperationId,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (plantTypeId.present) {
      map['plant_type_id'] = Variable<int>(plantTypeId.value);
    }
    if (plantShapeId.present) {
      map['plant_shape_id'] = Variable<int>(plantShapeId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (parentOperationId.present) {
      map['parent_operation_id'] = Variable<int>(parentOperationId.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StorageTableCompanion(')
          ..write('id: $id, ')
          ..write('plantTypeId: $plantTypeId, ')
          ..write('plantShapeId: $plantShapeId, ')
          ..write('quantity: $quantity, ')
          ..write('parentOperationId: $parentOperationId, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class $ScheduledStorageTableTable extends ScheduledStorageTable
    with TableInfo<$ScheduledStorageTableTable, ScheduledStorageTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScheduledStorageTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _typeIdMeta = const VerificationMeta('typeId');
  @override
  late final GeneratedColumn<int> typeId = GeneratedColumn<int>(
      'type_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES plant_types_table (id)'));
  static const VerificationMeta _shapeIdMeta =
      const VerificationMeta('shapeId');
  @override
  late final GeneratedColumn<int> shapeId = GeneratedColumn<int>(
      'shape_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES plant_shapes_table (id)'));
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _parentOperationIdMeta =
      const VerificationMeta('parentOperationId');
  @override
  late final GeneratedColumn<int> parentOperationId = GeneratedColumn<int>(
      'parent_operation_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, typeId, shapeId, quantity, parentOperationId, notes];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'scheduled_storage_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<ScheduledStorageTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('type_id')) {
      context.handle(_typeIdMeta,
          typeId.isAcceptableOrUnknown(data['type_id']!, _typeIdMeta));
    } else if (isInserting) {
      context.missing(_typeIdMeta);
    }
    if (data.containsKey('shape_id')) {
      context.handle(_shapeIdMeta,
          shapeId.isAcceptableOrUnknown(data['shape_id']!, _shapeIdMeta));
    } else if (isInserting) {
      context.missing(_shapeIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('parent_operation_id')) {
      context.handle(
          _parentOperationIdMeta,
          parentOperationId.isAcceptableOrUnknown(
              data['parent_operation_id']!, _parentOperationIdMeta));
    } else if (isInserting) {
      context.missing(_parentOperationIdMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ScheduledStorageTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ScheduledStorageTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      typeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type_id'])!,
      shapeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}shape_id'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      parentOperationId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}parent_operation_id'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
    );
  }

  @override
  $ScheduledStorageTableTable createAlias(String alias) {
    return $ScheduledStorageTableTable(attachedDatabase, alias);
  }
}

class ScheduledStorageTableData extends DataClass
    implements Insertable<ScheduledStorageTableData> {
  final int id;
  final int typeId;
  final int shapeId;
  final int quantity;
  final int parentOperationId;
  final String? notes;
  const ScheduledStorageTableData(
      {required this.id,
      required this.typeId,
      required this.shapeId,
      required this.quantity,
      required this.parentOperationId,
      this.notes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['type_id'] = Variable<int>(typeId);
    map['shape_id'] = Variable<int>(shapeId);
    map['quantity'] = Variable<int>(quantity);
    map['parent_operation_id'] = Variable<int>(parentOperationId);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  ScheduledStorageTableCompanion toCompanion(bool nullToAbsent) {
    return ScheduledStorageTableCompanion(
      id: Value(id),
      typeId: Value(typeId),
      shapeId: Value(shapeId),
      quantity: Value(quantity),
      parentOperationId: Value(parentOperationId),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory ScheduledStorageTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ScheduledStorageTableData(
      id: serializer.fromJson<int>(json['id']),
      typeId: serializer.fromJson<int>(json['typeId']),
      shapeId: serializer.fromJson<int>(json['shapeId']),
      quantity: serializer.fromJson<int>(json['quantity']),
      parentOperationId: serializer.fromJson<int>(json['parentOperationId']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'typeId': serializer.toJson<int>(typeId),
      'shapeId': serializer.toJson<int>(shapeId),
      'quantity': serializer.toJson<int>(quantity),
      'parentOperationId': serializer.toJson<int>(parentOperationId),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  ScheduledStorageTableData copyWith(
          {int? id,
          int? typeId,
          int? shapeId,
          int? quantity,
          int? parentOperationId,
          Value<String?> notes = const Value.absent()}) =>
      ScheduledStorageTableData(
        id: id ?? this.id,
        typeId: typeId ?? this.typeId,
        shapeId: shapeId ?? this.shapeId,
        quantity: quantity ?? this.quantity,
        parentOperationId: parentOperationId ?? this.parentOperationId,
        notes: notes.present ? notes.value : this.notes,
      );
  ScheduledStorageTableData copyWithCompanion(
      ScheduledStorageTableCompanion data) {
    return ScheduledStorageTableData(
      id: data.id.present ? data.id.value : this.id,
      typeId: data.typeId.present ? data.typeId.value : this.typeId,
      shapeId: data.shapeId.present ? data.shapeId.value : this.shapeId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      parentOperationId: data.parentOperationId.present
          ? data.parentOperationId.value
          : this.parentOperationId,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ScheduledStorageTableData(')
          ..write('id: $id, ')
          ..write('typeId: $typeId, ')
          ..write('shapeId: $shapeId, ')
          ..write('quantity: $quantity, ')
          ..write('parentOperationId: $parentOperationId, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, typeId, shapeId, quantity, parentOperationId, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScheduledStorageTableData &&
          other.id == this.id &&
          other.typeId == this.typeId &&
          other.shapeId == this.shapeId &&
          other.quantity == this.quantity &&
          other.parentOperationId == this.parentOperationId &&
          other.notes == this.notes);
}

class ScheduledStorageTableCompanion
    extends UpdateCompanion<ScheduledStorageTableData> {
  final Value<int> id;
  final Value<int> typeId;
  final Value<int> shapeId;
  final Value<int> quantity;
  final Value<int> parentOperationId;
  final Value<String?> notes;
  const ScheduledStorageTableCompanion({
    this.id = const Value.absent(),
    this.typeId = const Value.absent(),
    this.shapeId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.parentOperationId = const Value.absent(),
    this.notes = const Value.absent(),
  });
  ScheduledStorageTableCompanion.insert({
    this.id = const Value.absent(),
    required int typeId,
    required int shapeId,
    required int quantity,
    required int parentOperationId,
    this.notes = const Value.absent(),
  })  : typeId = Value(typeId),
        shapeId = Value(shapeId),
        quantity = Value(quantity),
        parentOperationId = Value(parentOperationId);
  static Insertable<ScheduledStorageTableData> custom({
    Expression<int>? id,
    Expression<int>? typeId,
    Expression<int>? shapeId,
    Expression<int>? quantity,
    Expression<int>? parentOperationId,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (typeId != null) 'type_id': typeId,
      if (shapeId != null) 'shape_id': shapeId,
      if (quantity != null) 'quantity': quantity,
      if (parentOperationId != null) 'parent_operation_id': parentOperationId,
      if (notes != null) 'notes': notes,
    });
  }

  ScheduledStorageTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? typeId,
      Value<int>? shapeId,
      Value<int>? quantity,
      Value<int>? parentOperationId,
      Value<String?>? notes}) {
    return ScheduledStorageTableCompanion(
      id: id ?? this.id,
      typeId: typeId ?? this.typeId,
      shapeId: shapeId ?? this.shapeId,
      quantity: quantity ?? this.quantity,
      parentOperationId: parentOperationId ?? this.parentOperationId,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (typeId.present) {
      map['type_id'] = Variable<int>(typeId.value);
    }
    if (shapeId.present) {
      map['shape_id'] = Variable<int>(shapeId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (parentOperationId.present) {
      map['parent_operation_id'] = Variable<int>(parentOperationId.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScheduledStorageTableCompanion(')
          ..write('id: $id, ')
          ..write('typeId: $typeId, ')
          ..write('shapeId: $shapeId, ')
          ..write('quantity: $quantity, ')
          ..write('parentOperationId: $parentOperationId, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(e);
  $LocalDatabaseManager get managers => $LocalDatabaseManager(this);
  late final $SetupExpenseTableTable setupExpenseTable =
      $SetupExpenseTableTable(this);
  late final $PlantTypesTableTable plantTypesTable =
      $PlantTypesTableTable(this);
  late final $PlantingTableTable plantingTable = $PlantingTableTable(this);
  late final $PlantShapesTableTable plantShapesTable =
      $PlantShapesTableTable(this);
  late final $OperationTypesTableTable operationTypesTable =
      $OperationTypesTableTable(this);
  late final $OperationsTableTable operationsTable =
      $OperationsTableTable(this);
  late final $StorageTableTable storageTable = $StorageTableTable(this);
  late final $ScheduledStorageTableTable scheduledStorageTable =
      $ScheduledStorageTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        setupExpenseTable,
        plantTypesTable,
        plantingTable,
        plantShapesTable,
        operationTypesTable,
        operationsTable,
        storageTable,
        scheduledStorageTable
      ];
}

typedef $$SetupExpenseTableTableCreateCompanionBuilder
    = SetupExpenseTableCompanion Function({
  Value<int> id,
  Value<String> globalId,
  Value<String> syncStatus,
  required String categoryType,
  required String expenseType,
  Value<String?> materialName,
  required double cost,
  required DateTime date,
  required DateTime createdAt,
  required DateTime updatedAt,
});
typedef $$SetupExpenseTableTableUpdateCompanionBuilder
    = SetupExpenseTableCompanion Function({
  Value<int> id,
  Value<String> globalId,
  Value<String> syncStatus,
  Value<String> categoryType,
  Value<String> expenseType,
  Value<String?> materialName,
  Value<double> cost,
  Value<DateTime> date,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$SetupExpenseTableTableFilterComposer
    extends Composer<_$LocalDatabase, $SetupExpenseTableTable> {
  $$SetupExpenseTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get globalId => $composableBuilder(
      column: $table.globalId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get categoryType => $composableBuilder(
      column: $table.categoryType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get expenseType => $composableBuilder(
      column: $table.expenseType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get materialName => $composableBuilder(
      column: $table.materialName, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get cost => $composableBuilder(
      column: $table.cost, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$SetupExpenseTableTableOrderingComposer
    extends Composer<_$LocalDatabase, $SetupExpenseTableTable> {
  $$SetupExpenseTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get globalId => $composableBuilder(
      column: $table.globalId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get categoryType => $composableBuilder(
      column: $table.categoryType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get expenseType => $composableBuilder(
      column: $table.expenseType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get materialName => $composableBuilder(
      column: $table.materialName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get cost => $composableBuilder(
      column: $table.cost, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$SetupExpenseTableTableAnnotationComposer
    extends Composer<_$LocalDatabase, $SetupExpenseTableTable> {
  $$SetupExpenseTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get globalId =>
      $composableBuilder(column: $table.globalId, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);

  GeneratedColumn<String> get categoryType => $composableBuilder(
      column: $table.categoryType, builder: (column) => column);

  GeneratedColumn<String> get expenseType => $composableBuilder(
      column: $table.expenseType, builder: (column) => column);

  GeneratedColumn<String> get materialName => $composableBuilder(
      column: $table.materialName, builder: (column) => column);

  GeneratedColumn<double> get cost =>
      $composableBuilder(column: $table.cost, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$SetupExpenseTableTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $SetupExpenseTableTable,
    SetupExpenseTableData,
    $$SetupExpenseTableTableFilterComposer,
    $$SetupExpenseTableTableOrderingComposer,
    $$SetupExpenseTableTableAnnotationComposer,
    $$SetupExpenseTableTableCreateCompanionBuilder,
    $$SetupExpenseTableTableUpdateCompanionBuilder,
    (
      SetupExpenseTableData,
      BaseReferences<_$LocalDatabase, $SetupExpenseTableTable,
          SetupExpenseTableData>
    ),
    SetupExpenseTableData,
    PrefetchHooks Function()> {
  $$SetupExpenseTableTableTableManager(
      _$LocalDatabase db, $SetupExpenseTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SetupExpenseTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SetupExpenseTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SetupExpenseTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> globalId = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<String> categoryType = const Value.absent(),
            Value<String> expenseType = const Value.absent(),
            Value<String?> materialName = const Value.absent(),
            Value<double> cost = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              SetupExpenseTableCompanion(
            id: id,
            globalId: globalId,
            syncStatus: syncStatus,
            categoryType: categoryType,
            expenseType: expenseType,
            materialName: materialName,
            cost: cost,
            date: date,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> globalId = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            required String categoryType,
            required String expenseType,
            Value<String?> materialName = const Value.absent(),
            required double cost,
            required DateTime date,
            required DateTime createdAt,
            required DateTime updatedAt,
          }) =>
              SetupExpenseTableCompanion.insert(
            id: id,
            globalId: globalId,
            syncStatus: syncStatus,
            categoryType: categoryType,
            expenseType: expenseType,
            materialName: materialName,
            cost: cost,
            date: date,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SetupExpenseTableTableProcessedTableManager = ProcessedTableManager<
    _$LocalDatabase,
    $SetupExpenseTableTable,
    SetupExpenseTableData,
    $$SetupExpenseTableTableFilterComposer,
    $$SetupExpenseTableTableOrderingComposer,
    $$SetupExpenseTableTableAnnotationComposer,
    $$SetupExpenseTableTableCreateCompanionBuilder,
    $$SetupExpenseTableTableUpdateCompanionBuilder,
    (
      SetupExpenseTableData,
      BaseReferences<_$LocalDatabase, $SetupExpenseTableTable,
          SetupExpenseTableData>
    ),
    SetupExpenseTableData,
    PrefetchHooks Function()>;
typedef $$PlantTypesTableTableCreateCompanionBuilder = PlantTypesTableCompanion
    Function({
  Value<int> id,
  required String name,
});
typedef $$PlantTypesTableTableUpdateCompanionBuilder = PlantTypesTableCompanion
    Function({
  Value<int> id,
  Value<String> name,
});

final class $$PlantTypesTableTableReferences extends BaseReferences<
    _$LocalDatabase, $PlantTypesTableTable, PlantTypesTableData> {
  $$PlantTypesTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PlantingTableTable, List<PlantingTableData>>
      _plantingTableRefsTable(_$LocalDatabase db) =>
          MultiTypedResultKey.fromTable(db.plantingTable,
              aliasName: $_aliasNameGenerator(
                  db.plantTypesTable.id, db.plantingTable.typeId));

  $$PlantingTableTableProcessedTableManager get plantingTableRefs {
    final manager = $$PlantingTableTableTableManager($_db, $_db.plantingTable)
        .filter((f) => f.typeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_plantingTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$OperationsTableTable, List<OperationsTableData>>
      _firstTypeRelationTable(_$LocalDatabase db) =>
          MultiTypedResultKey.fromTable(db.operationsTable,
              aliasName: $_aliasNameGenerator(
                  db.plantTypesTable.id, db.operationsTable.firstTypeId));

  $$OperationsTableTableProcessedTableManager get firstTypeRelation {
    final manager = $$OperationsTableTableTableManager(
            $_db, $_db.operationsTable)
        .filter((f) => f.firstTypeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_firstTypeRelationTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$OperationsTableTable, List<OperationsTableData>>
      _secondTypeRelationTable(_$LocalDatabase db) =>
          MultiTypedResultKey.fromTable(db.operationsTable,
              aliasName: $_aliasNameGenerator(
                  db.plantTypesTable.id, db.operationsTable.secondTypeId));

  $$OperationsTableTableProcessedTableManager get secondTypeRelation {
    final manager = $$OperationsTableTableTableManager(
            $_db, $_db.operationsTable)
        .filter((f) => f.secondTypeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_secondTypeRelationTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$StorageTableTable, List<StorageTableData>>
      _storageTableRefsTable(_$LocalDatabase db) =>
          MultiTypedResultKey.fromTable(db.storageTable,
              aliasName: $_aliasNameGenerator(
                  db.plantTypesTable.id, db.storageTable.plantTypeId));

  $$StorageTableTableProcessedTableManager get storageTableRefs {
    final manager = $$StorageTableTableTableManager($_db, $_db.storageTable)
        .filter((f) => f.plantTypeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_storageTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ScheduledStorageTableTable,
      List<ScheduledStorageTableData>> _scheduledStorageTableRefsTable(
          _$LocalDatabase db) =>
      MultiTypedResultKey.fromTable(db.scheduledStorageTable,
          aliasName: $_aliasNameGenerator(
              db.plantTypesTable.id, db.scheduledStorageTable.typeId));

  $$ScheduledStorageTableTableProcessedTableManager
      get scheduledStorageTableRefs {
    final manager = $$ScheduledStorageTableTableTableManager(
            $_db, $_db.scheduledStorageTable)
        .filter((f) => f.typeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_scheduledStorageTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$PlantTypesTableTableFilterComposer
    extends Composer<_$LocalDatabase, $PlantTypesTableTable> {
  $$PlantTypesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  Expression<bool> plantingTableRefs(
      Expression<bool> Function($$PlantingTableTableFilterComposer f) f) {
    final $$PlantingTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.plantingTable,
        getReferencedColumn: (t) => t.typeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlantingTableTableFilterComposer(
              $db: $db,
              $table: $db.plantingTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> firstTypeRelation(
      Expression<bool> Function($$OperationsTableTableFilterComposer f) f) {
    final $$OperationsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.operationsTable,
        getReferencedColumn: (t) => t.firstTypeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OperationsTableTableFilterComposer(
              $db: $db,
              $table: $db.operationsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> secondTypeRelation(
      Expression<bool> Function($$OperationsTableTableFilterComposer f) f) {
    final $$OperationsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.operationsTable,
        getReferencedColumn: (t) => t.secondTypeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OperationsTableTableFilterComposer(
              $db: $db,
              $table: $db.operationsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> storageTableRefs(
      Expression<bool> Function($$StorageTableTableFilterComposer f) f) {
    final $$StorageTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.storageTable,
        getReferencedColumn: (t) => t.plantTypeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StorageTableTableFilterComposer(
              $db: $db,
              $table: $db.storageTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> scheduledStorageTableRefs(
      Expression<bool> Function($$ScheduledStorageTableTableFilterComposer f)
          f) {
    final $$ScheduledStorageTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.scheduledStorageTable,
            getReferencedColumn: (t) => t.typeId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ScheduledStorageTableTableFilterComposer(
                  $db: $db,
                  $table: $db.scheduledStorageTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$PlantTypesTableTableOrderingComposer
    extends Composer<_$LocalDatabase, $PlantTypesTableTable> {
  $$PlantTypesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));
}

class $$PlantTypesTableTableAnnotationComposer
    extends Composer<_$LocalDatabase, $PlantTypesTableTable> {
  $$PlantTypesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> plantingTableRefs<T extends Object>(
      Expression<T> Function($$PlantingTableTableAnnotationComposer a) f) {
    final $$PlantingTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.plantingTable,
        getReferencedColumn: (t) => t.typeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlantingTableTableAnnotationComposer(
              $db: $db,
              $table: $db.plantingTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> firstTypeRelation<T extends Object>(
      Expression<T> Function($$OperationsTableTableAnnotationComposer a) f) {
    final $$OperationsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.operationsTable,
        getReferencedColumn: (t) => t.firstTypeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OperationsTableTableAnnotationComposer(
              $db: $db,
              $table: $db.operationsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> secondTypeRelation<T extends Object>(
      Expression<T> Function($$OperationsTableTableAnnotationComposer a) f) {
    final $$OperationsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.operationsTable,
        getReferencedColumn: (t) => t.secondTypeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OperationsTableTableAnnotationComposer(
              $db: $db,
              $table: $db.operationsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> storageTableRefs<T extends Object>(
      Expression<T> Function($$StorageTableTableAnnotationComposer a) f) {
    final $$StorageTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.storageTable,
        getReferencedColumn: (t) => t.plantTypeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StorageTableTableAnnotationComposer(
              $db: $db,
              $table: $db.storageTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> scheduledStorageTableRefs<T extends Object>(
      Expression<T> Function($$ScheduledStorageTableTableAnnotationComposer a)
          f) {
    final $$ScheduledStorageTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.scheduledStorageTable,
            getReferencedColumn: (t) => t.typeId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ScheduledStorageTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.scheduledStorageTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$PlantTypesTableTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $PlantTypesTableTable,
    PlantTypesTableData,
    $$PlantTypesTableTableFilterComposer,
    $$PlantTypesTableTableOrderingComposer,
    $$PlantTypesTableTableAnnotationComposer,
    $$PlantTypesTableTableCreateCompanionBuilder,
    $$PlantTypesTableTableUpdateCompanionBuilder,
    (PlantTypesTableData, $$PlantTypesTableTableReferences),
    PlantTypesTableData,
    PrefetchHooks Function(
        {bool plantingTableRefs,
        bool firstTypeRelation,
        bool secondTypeRelation,
        bool storageTableRefs,
        bool scheduledStorageTableRefs})> {
  $$PlantTypesTableTableTableManager(
      _$LocalDatabase db, $PlantTypesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlantTypesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlantTypesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlantTypesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              PlantTypesTableCompanion(
            id: id,
            name: name,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
          }) =>
              PlantTypesTableCompanion.insert(
            id: id,
            name: name,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$PlantTypesTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {plantingTableRefs = false,
              firstTypeRelation = false,
              secondTypeRelation = false,
              storageTableRefs = false,
              scheduledStorageTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (plantingTableRefs) db.plantingTable,
                if (firstTypeRelation) db.operationsTable,
                if (secondTypeRelation) db.operationsTable,
                if (storageTableRefs) db.storageTable,
                if (scheduledStorageTableRefs) db.scheduledStorageTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (plantingTableRefs)
                    await $_getPrefetchedData<PlantTypesTableData,
                            $PlantTypesTableTable, PlantingTableData>(
                        currentTable: table,
                        referencedTable: $$PlantTypesTableTableReferences
                            ._plantingTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PlantTypesTableTableReferences(db, table, p0)
                                .plantingTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.typeId == item.id),
                        typedResults: items),
                  if (firstTypeRelation)
                    await $_getPrefetchedData<PlantTypesTableData,
                            $PlantTypesTableTable, OperationsTableData>(
                        currentTable: table,
                        referencedTable: $$PlantTypesTableTableReferences
                            ._firstTypeRelationTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PlantTypesTableTableReferences(db, table, p0)
                                .firstTypeRelation,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.firstTypeId == item.id),
                        typedResults: items),
                  if (secondTypeRelation)
                    await $_getPrefetchedData<PlantTypesTableData,
                            $PlantTypesTableTable, OperationsTableData>(
                        currentTable: table,
                        referencedTable: $$PlantTypesTableTableReferences
                            ._secondTypeRelationTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PlantTypesTableTableReferences(db, table, p0)
                                .secondTypeRelation,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.secondTypeId == item.id),
                        typedResults: items),
                  if (storageTableRefs)
                    await $_getPrefetchedData<PlantTypesTableData,
                            $PlantTypesTableTable, StorageTableData>(
                        currentTable: table,
                        referencedTable: $$PlantTypesTableTableReferences
                            ._storageTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PlantTypesTableTableReferences(db, table, p0)
                                .storageTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.plantTypeId == item.id),
                        typedResults: items),
                  if (scheduledStorageTableRefs)
                    await $_getPrefetchedData<PlantTypesTableData,
                            $PlantTypesTableTable, ScheduledStorageTableData>(
                        currentTable: table,
                        referencedTable: $$PlantTypesTableTableReferences
                            ._scheduledStorageTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PlantTypesTableTableReferences(db, table, p0)
                                .scheduledStorageTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.typeId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$PlantTypesTableTableProcessedTableManager = ProcessedTableManager<
    _$LocalDatabase,
    $PlantTypesTableTable,
    PlantTypesTableData,
    $$PlantTypesTableTableFilterComposer,
    $$PlantTypesTableTableOrderingComposer,
    $$PlantTypesTableTableAnnotationComposer,
    $$PlantTypesTableTableCreateCompanionBuilder,
    $$PlantTypesTableTableUpdateCompanionBuilder,
    (PlantTypesTableData, $$PlantTypesTableTableReferences),
    PlantTypesTableData,
    PrefetchHooks Function(
        {bool plantingTableRefs,
        bool firstTypeRelation,
        bool secondTypeRelation,
        bool storageTableRefs,
        bool scheduledStorageTableRefs})>;
typedef $$PlantingTableTableCreateCompanionBuilder = PlantingTableCompanion
    Function({
  Value<int> id,
  required int typeId,
  required int quantity,
  required DateTime date,
  Value<double?> initialCost,
});
typedef $$PlantingTableTableUpdateCompanionBuilder = PlantingTableCompanion
    Function({
  Value<int> id,
  Value<int> typeId,
  Value<int> quantity,
  Value<DateTime> date,
  Value<double?> initialCost,
});

final class $$PlantingTableTableReferences extends BaseReferences<
    _$LocalDatabase, $PlantingTableTable, PlantingTableData> {
  $$PlantingTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $PlantTypesTableTable _typeIdTable(_$LocalDatabase db) =>
      db.plantTypesTable.createAlias(
          $_aliasNameGenerator(db.plantingTable.typeId, db.plantTypesTable.id));

  $$PlantTypesTableTableProcessedTableManager get typeId {
    final $_column = $_itemColumn<int>('type_id')!;

    final manager =
        $$PlantTypesTableTableTableManager($_db, $_db.plantTypesTable)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_typeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$PlantingTableTableFilterComposer
    extends Composer<_$LocalDatabase, $PlantingTableTable> {
  $$PlantingTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get initialCost => $composableBuilder(
      column: $table.initialCost, builder: (column) => ColumnFilters(column));

  $$PlantTypesTableTableFilterComposer get typeId {
    final $$PlantTypesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.typeId,
        referencedTable: $db.plantTypesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlantTypesTableTableFilterComposer(
              $db: $db,
              $table: $db.plantTypesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PlantingTableTableOrderingComposer
    extends Composer<_$LocalDatabase, $PlantingTableTable> {
  $$PlantingTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get initialCost => $composableBuilder(
      column: $table.initialCost, builder: (column) => ColumnOrderings(column));

  $$PlantTypesTableTableOrderingComposer get typeId {
    final $$PlantTypesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.typeId,
        referencedTable: $db.plantTypesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlantTypesTableTableOrderingComposer(
              $db: $db,
              $table: $db.plantTypesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PlantingTableTableAnnotationComposer
    extends Composer<_$LocalDatabase, $PlantingTableTable> {
  $$PlantingTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<double> get initialCost => $composableBuilder(
      column: $table.initialCost, builder: (column) => column);

  $$PlantTypesTableTableAnnotationComposer get typeId {
    final $$PlantTypesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.typeId,
        referencedTable: $db.plantTypesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlantTypesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.plantTypesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PlantingTableTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $PlantingTableTable,
    PlantingTableData,
    $$PlantingTableTableFilterComposer,
    $$PlantingTableTableOrderingComposer,
    $$PlantingTableTableAnnotationComposer,
    $$PlantingTableTableCreateCompanionBuilder,
    $$PlantingTableTableUpdateCompanionBuilder,
    (PlantingTableData, $$PlantingTableTableReferences),
    PlantingTableData,
    PrefetchHooks Function({bool typeId})> {
  $$PlantingTableTableTableManager(
      _$LocalDatabase db, $PlantingTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlantingTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlantingTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlantingTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> typeId = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<double?> initialCost = const Value.absent(),
          }) =>
              PlantingTableCompanion(
            id: id,
            typeId: typeId,
            quantity: quantity,
            date: date,
            initialCost: initialCost,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int typeId,
            required int quantity,
            required DateTime date,
            Value<double?> initialCost = const Value.absent(),
          }) =>
              PlantingTableCompanion.insert(
            id: id,
            typeId: typeId,
            quantity: quantity,
            date: date,
            initialCost: initialCost,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$PlantingTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({typeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (typeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.typeId,
                    referencedTable:
                        $$PlantingTableTableReferences._typeIdTable(db),
                    referencedColumn:
                        $$PlantingTableTableReferences._typeIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$PlantingTableTableProcessedTableManager = ProcessedTableManager<
    _$LocalDatabase,
    $PlantingTableTable,
    PlantingTableData,
    $$PlantingTableTableFilterComposer,
    $$PlantingTableTableOrderingComposer,
    $$PlantingTableTableAnnotationComposer,
    $$PlantingTableTableCreateCompanionBuilder,
    $$PlantingTableTableUpdateCompanionBuilder,
    (PlantingTableData, $$PlantingTableTableReferences),
    PlantingTableData,
    PrefetchHooks Function({bool typeId})>;
typedef $$PlantShapesTableTableCreateCompanionBuilder
    = PlantShapesTableCompanion Function({
  Value<int> id,
  required String name,
  required int nurseryPeriod,
});
typedef $$PlantShapesTableTableUpdateCompanionBuilder
    = PlantShapesTableCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<int> nurseryPeriod,
});

final class $$PlantShapesTableTableReferences extends BaseReferences<
    _$LocalDatabase, $PlantShapesTableTable, PlantShapesTableData> {
  $$PlantShapesTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$OperationsTableTable, List<OperationsTableData>>
      _firstShapeRelationTable(_$LocalDatabase db) =>
          MultiTypedResultKey.fromTable(db.operationsTable,
              aliasName: $_aliasNameGenerator(
                  db.plantShapesTable.id, db.operationsTable.firstShapeId));

  $$OperationsTableTableProcessedTableManager get firstShapeRelation {
    final manager = $$OperationsTableTableTableManager(
            $_db, $_db.operationsTable)
        .filter((f) => f.firstShapeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_firstShapeRelationTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$OperationsTableTable, List<OperationsTableData>>
      _secondShapeRelationTable(_$LocalDatabase db) =>
          MultiTypedResultKey.fromTable(db.operationsTable,
              aliasName: $_aliasNameGenerator(
                  db.plantShapesTable.id, db.operationsTable.secondShapeId));

  $$OperationsTableTableProcessedTableManager get secondShapeRelation {
    final manager = $$OperationsTableTableTableManager(
            $_db, $_db.operationsTable)
        .filter((f) => f.secondShapeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_secondShapeRelationTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$StorageTableTable, List<StorageTableData>>
      _storageTableRefsTable(_$LocalDatabase db) =>
          MultiTypedResultKey.fromTable(db.storageTable,
              aliasName: $_aliasNameGenerator(
                  db.plantShapesTable.id, db.storageTable.plantShapeId));

  $$StorageTableTableProcessedTableManager get storageTableRefs {
    final manager = $$StorageTableTableTableManager($_db, $_db.storageTable)
        .filter((f) => f.plantShapeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_storageTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ScheduledStorageTableTable,
      List<ScheduledStorageTableData>> _scheduledStorageTableRefsTable(
          _$LocalDatabase db) =>
      MultiTypedResultKey.fromTable(db.scheduledStorageTable,
          aliasName: $_aliasNameGenerator(
              db.plantShapesTable.id, db.scheduledStorageTable.shapeId));

  $$ScheduledStorageTableTableProcessedTableManager
      get scheduledStorageTableRefs {
    final manager = $$ScheduledStorageTableTableTableManager(
            $_db, $_db.scheduledStorageTable)
        .filter((f) => f.shapeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_scheduledStorageTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$PlantShapesTableTableFilterComposer
    extends Composer<_$LocalDatabase, $PlantShapesTableTable> {
  $$PlantShapesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get nurseryPeriod => $composableBuilder(
      column: $table.nurseryPeriod, builder: (column) => ColumnFilters(column));

  Expression<bool> firstShapeRelation(
      Expression<bool> Function($$OperationsTableTableFilterComposer f) f) {
    final $$OperationsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.operationsTable,
        getReferencedColumn: (t) => t.firstShapeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OperationsTableTableFilterComposer(
              $db: $db,
              $table: $db.operationsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> secondShapeRelation(
      Expression<bool> Function($$OperationsTableTableFilterComposer f) f) {
    final $$OperationsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.operationsTable,
        getReferencedColumn: (t) => t.secondShapeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OperationsTableTableFilterComposer(
              $db: $db,
              $table: $db.operationsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> storageTableRefs(
      Expression<bool> Function($$StorageTableTableFilterComposer f) f) {
    final $$StorageTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.storageTable,
        getReferencedColumn: (t) => t.plantShapeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StorageTableTableFilterComposer(
              $db: $db,
              $table: $db.storageTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> scheduledStorageTableRefs(
      Expression<bool> Function($$ScheduledStorageTableTableFilterComposer f)
          f) {
    final $$ScheduledStorageTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.scheduledStorageTable,
            getReferencedColumn: (t) => t.shapeId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ScheduledStorageTableTableFilterComposer(
                  $db: $db,
                  $table: $db.scheduledStorageTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$PlantShapesTableTableOrderingComposer
    extends Composer<_$LocalDatabase, $PlantShapesTableTable> {
  $$PlantShapesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get nurseryPeriod => $composableBuilder(
      column: $table.nurseryPeriod,
      builder: (column) => ColumnOrderings(column));
}

class $$PlantShapesTableTableAnnotationComposer
    extends Composer<_$LocalDatabase, $PlantShapesTableTable> {
  $$PlantShapesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get nurseryPeriod => $composableBuilder(
      column: $table.nurseryPeriod, builder: (column) => column);

  Expression<T> firstShapeRelation<T extends Object>(
      Expression<T> Function($$OperationsTableTableAnnotationComposer a) f) {
    final $$OperationsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.operationsTable,
        getReferencedColumn: (t) => t.firstShapeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OperationsTableTableAnnotationComposer(
              $db: $db,
              $table: $db.operationsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> secondShapeRelation<T extends Object>(
      Expression<T> Function($$OperationsTableTableAnnotationComposer a) f) {
    final $$OperationsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.operationsTable,
        getReferencedColumn: (t) => t.secondShapeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OperationsTableTableAnnotationComposer(
              $db: $db,
              $table: $db.operationsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> storageTableRefs<T extends Object>(
      Expression<T> Function($$StorageTableTableAnnotationComposer a) f) {
    final $$StorageTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.storageTable,
        getReferencedColumn: (t) => t.plantShapeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StorageTableTableAnnotationComposer(
              $db: $db,
              $table: $db.storageTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> scheduledStorageTableRefs<T extends Object>(
      Expression<T> Function($$ScheduledStorageTableTableAnnotationComposer a)
          f) {
    final $$ScheduledStorageTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.scheduledStorageTable,
            getReferencedColumn: (t) => t.shapeId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ScheduledStorageTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.scheduledStorageTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$PlantShapesTableTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $PlantShapesTableTable,
    PlantShapesTableData,
    $$PlantShapesTableTableFilterComposer,
    $$PlantShapesTableTableOrderingComposer,
    $$PlantShapesTableTableAnnotationComposer,
    $$PlantShapesTableTableCreateCompanionBuilder,
    $$PlantShapesTableTableUpdateCompanionBuilder,
    (PlantShapesTableData, $$PlantShapesTableTableReferences),
    PlantShapesTableData,
    PrefetchHooks Function(
        {bool firstShapeRelation,
        bool secondShapeRelation,
        bool storageTableRefs,
        bool scheduledStorageTableRefs})> {
  $$PlantShapesTableTableTableManager(
      _$LocalDatabase db, $PlantShapesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlantShapesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlantShapesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlantShapesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> nurseryPeriod = const Value.absent(),
          }) =>
              PlantShapesTableCompanion(
            id: id,
            name: name,
            nurseryPeriod: nurseryPeriod,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required int nurseryPeriod,
          }) =>
              PlantShapesTableCompanion.insert(
            id: id,
            name: name,
            nurseryPeriod: nurseryPeriod,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$PlantShapesTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {firstShapeRelation = false,
              secondShapeRelation = false,
              storageTableRefs = false,
              scheduledStorageTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (firstShapeRelation) db.operationsTable,
                if (secondShapeRelation) db.operationsTable,
                if (storageTableRefs) db.storageTable,
                if (scheduledStorageTableRefs) db.scheduledStorageTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (firstShapeRelation)
                    await $_getPrefetchedData<PlantShapesTableData,
                            $PlantShapesTableTable, OperationsTableData>(
                        currentTable: table,
                        referencedTable: $$PlantShapesTableTableReferences
                            ._firstShapeRelationTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PlantShapesTableTableReferences(db, table, p0)
                                .firstShapeRelation,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.firstShapeId == item.id),
                        typedResults: items),
                  if (secondShapeRelation)
                    await $_getPrefetchedData<PlantShapesTableData,
                            $PlantShapesTableTable, OperationsTableData>(
                        currentTable: table,
                        referencedTable: $$PlantShapesTableTableReferences
                            ._secondShapeRelationTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PlantShapesTableTableReferences(db, table, p0)
                                .secondShapeRelation,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.secondShapeId == item.id),
                        typedResults: items),
                  if (storageTableRefs)
                    await $_getPrefetchedData<PlantShapesTableData,
                            $PlantShapesTableTable, StorageTableData>(
                        currentTable: table,
                        referencedTable: $$PlantShapesTableTableReferences
                            ._storageTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PlantShapesTableTableReferences(db, table, p0)
                                .storageTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.plantShapeId == item.id),
                        typedResults: items),
                  if (scheduledStorageTableRefs)
                    await $_getPrefetchedData<PlantShapesTableData,
                            $PlantShapesTableTable, ScheduledStorageTableData>(
                        currentTable: table,
                        referencedTable: $$PlantShapesTableTableReferences
                            ._scheduledStorageTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PlantShapesTableTableReferences(db, table, p0)
                                .scheduledStorageTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.shapeId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$PlantShapesTableTableProcessedTableManager = ProcessedTableManager<
    _$LocalDatabase,
    $PlantShapesTableTable,
    PlantShapesTableData,
    $$PlantShapesTableTableFilterComposer,
    $$PlantShapesTableTableOrderingComposer,
    $$PlantShapesTableTableAnnotationComposer,
    $$PlantShapesTableTableCreateCompanionBuilder,
    $$PlantShapesTableTableUpdateCompanionBuilder,
    (PlantShapesTableData, $$PlantShapesTableTableReferences),
    PlantShapesTableData,
    PrefetchHooks Function(
        {bool firstShapeRelation,
        bool secondShapeRelation,
        bool storageTableRefs,
        bool scheduledStorageTableRefs})>;
typedef $$OperationTypesTableTableCreateCompanionBuilder
    = OperationTypesTableCompanion Function({
  Value<int> id,
  required String name,
  Value<double> successRatio,
});
typedef $$OperationTypesTableTableUpdateCompanionBuilder
    = OperationTypesTableCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<double> successRatio,
});

final class $$OperationTypesTableTableReferences extends BaseReferences<
    _$LocalDatabase, $OperationTypesTableTable, OperationTypesTableData> {
  $$OperationTypesTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$OperationsTableTable, List<OperationsTableData>>
      _operationsTableRefsTable(_$LocalDatabase db) =>
          MultiTypedResultKey.fromTable(db.operationsTable,
              aliasName: $_aliasNameGenerator(db.operationTypesTable.id,
                  db.operationsTable.operationTypeId));

  $$OperationsTableTableProcessedTableManager get operationsTableRefs {
    final manager =
        $$OperationsTableTableTableManager($_db, $_db.operationsTable).filter(
            (f) => f.operationTypeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_operationsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$OperationTypesTableTableFilterComposer
    extends Composer<_$LocalDatabase, $OperationTypesTableTable> {
  $$OperationTypesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get successRatio => $composableBuilder(
      column: $table.successRatio, builder: (column) => ColumnFilters(column));

  Expression<bool> operationsTableRefs(
      Expression<bool> Function($$OperationsTableTableFilterComposer f) f) {
    final $$OperationsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.operationsTable,
        getReferencedColumn: (t) => t.operationTypeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OperationsTableTableFilterComposer(
              $db: $db,
              $table: $db.operationsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$OperationTypesTableTableOrderingComposer
    extends Composer<_$LocalDatabase, $OperationTypesTableTable> {
  $$OperationTypesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get successRatio => $composableBuilder(
      column: $table.successRatio,
      builder: (column) => ColumnOrderings(column));
}

class $$OperationTypesTableTableAnnotationComposer
    extends Composer<_$LocalDatabase, $OperationTypesTableTable> {
  $$OperationTypesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get successRatio => $composableBuilder(
      column: $table.successRatio, builder: (column) => column);

  Expression<T> operationsTableRefs<T extends Object>(
      Expression<T> Function($$OperationsTableTableAnnotationComposer a) f) {
    final $$OperationsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.operationsTable,
        getReferencedColumn: (t) => t.operationTypeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OperationsTableTableAnnotationComposer(
              $db: $db,
              $table: $db.operationsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$OperationTypesTableTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $OperationTypesTableTable,
    OperationTypesTableData,
    $$OperationTypesTableTableFilterComposer,
    $$OperationTypesTableTableOrderingComposer,
    $$OperationTypesTableTableAnnotationComposer,
    $$OperationTypesTableTableCreateCompanionBuilder,
    $$OperationTypesTableTableUpdateCompanionBuilder,
    (OperationTypesTableData, $$OperationTypesTableTableReferences),
    OperationTypesTableData,
    PrefetchHooks Function({bool operationsTableRefs})> {
  $$OperationTypesTableTableTableManager(
      _$LocalDatabase db, $OperationTypesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OperationTypesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OperationTypesTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OperationTypesTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<double> successRatio = const Value.absent(),
          }) =>
              OperationTypesTableCompanion(
            id: id,
            name: name,
            successRatio: successRatio,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<double> successRatio = const Value.absent(),
          }) =>
              OperationTypesTableCompanion.insert(
            id: id,
            name: name,
            successRatio: successRatio,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$OperationTypesTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({operationsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (operationsTableRefs) db.operationsTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (operationsTableRefs)
                    await $_getPrefetchedData<OperationTypesTableData,
                            $OperationTypesTableTable, OperationsTableData>(
                        currentTable: table,
                        referencedTable: $$OperationTypesTableTableReferences
                            ._operationsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$OperationTypesTableTableReferences(db, table, p0)
                                .operationsTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.operationTypeId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$OperationTypesTableTableProcessedTableManager = ProcessedTableManager<
    _$LocalDatabase,
    $OperationTypesTableTable,
    OperationTypesTableData,
    $$OperationTypesTableTableFilterComposer,
    $$OperationTypesTableTableOrderingComposer,
    $$OperationTypesTableTableAnnotationComposer,
    $$OperationTypesTableTableCreateCompanionBuilder,
    $$OperationTypesTableTableUpdateCompanionBuilder,
    (OperationTypesTableData, $$OperationTypesTableTableReferences),
    OperationTypesTableData,
    PrefetchHooks Function({bool operationsTableRefs})>;
typedef $$OperationsTableTableCreateCompanionBuilder = OperationsTableCompanion
    Function({
  Value<int> id,
  required int operationTypeId,
  required DateTime date,
  required int firstTypeId,
  required int firstShapeId,
  required int quantity,
  Value<int?> secondTypeId,
  Value<int?> secondShapeId,
  Value<bool> scheduled,
  Value<int?> reservationId,
  Value<String?> notes,
});
typedef $$OperationsTableTableUpdateCompanionBuilder = OperationsTableCompanion
    Function({
  Value<int> id,
  Value<int> operationTypeId,
  Value<DateTime> date,
  Value<int> firstTypeId,
  Value<int> firstShapeId,
  Value<int> quantity,
  Value<int?> secondTypeId,
  Value<int?> secondShapeId,
  Value<bool> scheduled,
  Value<int?> reservationId,
  Value<String?> notes,
});

final class $$OperationsTableTableReferences extends BaseReferences<
    _$LocalDatabase, $OperationsTableTable, OperationsTableData> {
  $$OperationsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $OperationTypesTableTable _operationTypeIdTable(_$LocalDatabase db) =>
      db.operationTypesTable.createAlias($_aliasNameGenerator(
          db.operationsTable.operationTypeId, db.operationTypesTable.id));

  $$OperationTypesTableTableProcessedTableManager get operationTypeId {
    final $_column = $_itemColumn<int>('operation_type_id')!;

    final manager =
        $$OperationTypesTableTableTableManager($_db, $_db.operationTypesTable)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_operationTypeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $PlantTypesTableTable _firstTypeIdTable(_$LocalDatabase db) =>
      db.plantTypesTable.createAlias($_aliasNameGenerator(
          db.operationsTable.firstTypeId, db.plantTypesTable.id));

  $$PlantTypesTableTableProcessedTableManager get firstTypeId {
    final $_column = $_itemColumn<int>('first_type_id')!;

    final manager =
        $$PlantTypesTableTableTableManager($_db, $_db.plantTypesTable)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_firstTypeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $PlantShapesTableTable _firstShapeIdTable(_$LocalDatabase db) =>
      db.plantShapesTable.createAlias($_aliasNameGenerator(
          db.operationsTable.firstShapeId, db.plantShapesTable.id));

  $$PlantShapesTableTableProcessedTableManager get firstShapeId {
    final $_column = $_itemColumn<int>('first_shape_id')!;

    final manager =
        $$PlantShapesTableTableTableManager($_db, $_db.plantShapesTable)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_firstShapeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $PlantTypesTableTable _secondTypeIdTable(_$LocalDatabase db) =>
      db.plantTypesTable.createAlias($_aliasNameGenerator(
          db.operationsTable.secondTypeId, db.plantTypesTable.id));

  $$PlantTypesTableTableProcessedTableManager? get secondTypeId {
    final $_column = $_itemColumn<int>('second_type_id');
    if ($_column == null) return null;
    final manager =
        $$PlantTypesTableTableTableManager($_db, $_db.plantTypesTable)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_secondTypeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $PlantShapesTableTable _secondShapeIdTable(_$LocalDatabase db) =>
      db.plantShapesTable.createAlias($_aliasNameGenerator(
          db.operationsTable.secondShapeId, db.plantShapesTable.id));

  $$PlantShapesTableTableProcessedTableManager? get secondShapeId {
    final $_column = $_itemColumn<int>('second_shape_id');
    if ($_column == null) return null;
    final manager =
        $$PlantShapesTableTableTableManager($_db, $_db.plantShapesTable)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_secondShapeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$StorageTableTable, List<StorageTableData>>
      _storageTableRefsTable(_$LocalDatabase db) =>
          MultiTypedResultKey.fromTable(db.storageTable,
              aliasName: $_aliasNameGenerator(
                  db.operationsTable.id, db.storageTable.parentOperationId));

  $$StorageTableTableProcessedTableManager get storageTableRefs {
    final manager = $$StorageTableTableTableManager($_db, $_db.storageTable)
        .filter(
            (f) => f.parentOperationId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_storageTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$OperationsTableTableFilterComposer
    extends Composer<_$LocalDatabase, $OperationsTableTable> {
  $$OperationsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get scheduled => $composableBuilder(
      column: $table.scheduled, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get reservationId => $composableBuilder(
      column: $table.reservationId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  $$OperationTypesTableTableFilterComposer get operationTypeId {
    final $$OperationTypesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.operationTypeId,
        referencedTable: $db.operationTypesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OperationTypesTableTableFilterComposer(
              $db: $db,
              $table: $db.operationTypesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PlantTypesTableTableFilterComposer get firstTypeId {
    final $$PlantTypesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.firstTypeId,
        referencedTable: $db.plantTypesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlantTypesTableTableFilterComposer(
              $db: $db,
              $table: $db.plantTypesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PlantShapesTableTableFilterComposer get firstShapeId {
    final $$PlantShapesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.firstShapeId,
        referencedTable: $db.plantShapesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlantShapesTableTableFilterComposer(
              $db: $db,
              $table: $db.plantShapesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PlantTypesTableTableFilterComposer get secondTypeId {
    final $$PlantTypesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.secondTypeId,
        referencedTable: $db.plantTypesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlantTypesTableTableFilterComposer(
              $db: $db,
              $table: $db.plantTypesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PlantShapesTableTableFilterComposer get secondShapeId {
    final $$PlantShapesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.secondShapeId,
        referencedTable: $db.plantShapesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlantShapesTableTableFilterComposer(
              $db: $db,
              $table: $db.plantShapesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> storageTableRefs(
      Expression<bool> Function($$StorageTableTableFilterComposer f) f) {
    final $$StorageTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.storageTable,
        getReferencedColumn: (t) => t.parentOperationId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StorageTableTableFilterComposer(
              $db: $db,
              $table: $db.storageTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$OperationsTableTableOrderingComposer
    extends Composer<_$LocalDatabase, $OperationsTableTable> {
  $$OperationsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get scheduled => $composableBuilder(
      column: $table.scheduled, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get reservationId => $composableBuilder(
      column: $table.reservationId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  $$OperationTypesTableTableOrderingComposer get operationTypeId {
    final $$OperationTypesTableTableOrderingComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.operationTypeId,
            referencedTable: $db.operationTypesTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$OperationTypesTableTableOrderingComposer(
                  $db: $db,
                  $table: $db.operationTypesTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  $$PlantTypesTableTableOrderingComposer get firstTypeId {
    final $$PlantTypesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.firstTypeId,
        referencedTable: $db.plantTypesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlantTypesTableTableOrderingComposer(
              $db: $db,
              $table: $db.plantTypesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PlantShapesTableTableOrderingComposer get firstShapeId {
    final $$PlantShapesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.firstShapeId,
        referencedTable: $db.plantShapesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlantShapesTableTableOrderingComposer(
              $db: $db,
              $table: $db.plantShapesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PlantTypesTableTableOrderingComposer get secondTypeId {
    final $$PlantTypesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.secondTypeId,
        referencedTable: $db.plantTypesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlantTypesTableTableOrderingComposer(
              $db: $db,
              $table: $db.plantTypesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PlantShapesTableTableOrderingComposer get secondShapeId {
    final $$PlantShapesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.secondShapeId,
        referencedTable: $db.plantShapesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlantShapesTableTableOrderingComposer(
              $db: $db,
              $table: $db.plantShapesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$OperationsTableTableAnnotationComposer
    extends Composer<_$LocalDatabase, $OperationsTableTable> {
  $$OperationsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<bool> get scheduled =>
      $composableBuilder(column: $table.scheduled, builder: (column) => column);

  GeneratedColumn<int> get reservationId => $composableBuilder(
      column: $table.reservationId, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$OperationTypesTableTableAnnotationComposer get operationTypeId {
    final $$OperationTypesTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.operationTypeId,
            referencedTable: $db.operationTypesTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$OperationTypesTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.operationTypesTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  $$PlantTypesTableTableAnnotationComposer get firstTypeId {
    final $$PlantTypesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.firstTypeId,
        referencedTable: $db.plantTypesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlantTypesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.plantTypesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PlantShapesTableTableAnnotationComposer get firstShapeId {
    final $$PlantShapesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.firstShapeId,
        referencedTable: $db.plantShapesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlantShapesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.plantShapesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PlantTypesTableTableAnnotationComposer get secondTypeId {
    final $$PlantTypesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.secondTypeId,
        referencedTable: $db.plantTypesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlantTypesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.plantTypesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PlantShapesTableTableAnnotationComposer get secondShapeId {
    final $$PlantShapesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.secondShapeId,
        referencedTable: $db.plantShapesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlantShapesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.plantShapesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> storageTableRefs<T extends Object>(
      Expression<T> Function($$StorageTableTableAnnotationComposer a) f) {
    final $$StorageTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.storageTable,
        getReferencedColumn: (t) => t.parentOperationId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StorageTableTableAnnotationComposer(
              $db: $db,
              $table: $db.storageTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$OperationsTableTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $OperationsTableTable,
    OperationsTableData,
    $$OperationsTableTableFilterComposer,
    $$OperationsTableTableOrderingComposer,
    $$OperationsTableTableAnnotationComposer,
    $$OperationsTableTableCreateCompanionBuilder,
    $$OperationsTableTableUpdateCompanionBuilder,
    (OperationsTableData, $$OperationsTableTableReferences),
    OperationsTableData,
    PrefetchHooks Function(
        {bool operationTypeId,
        bool firstTypeId,
        bool firstShapeId,
        bool secondTypeId,
        bool secondShapeId,
        bool storageTableRefs})> {
  $$OperationsTableTableTableManager(
      _$LocalDatabase db, $OperationsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OperationsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OperationsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OperationsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> operationTypeId = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<int> firstTypeId = const Value.absent(),
            Value<int> firstShapeId = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<int?> secondTypeId = const Value.absent(),
            Value<int?> secondShapeId = const Value.absent(),
            Value<bool> scheduled = const Value.absent(),
            Value<int?> reservationId = const Value.absent(),
            Value<String?> notes = const Value.absent(),
          }) =>
              OperationsTableCompanion(
            id: id,
            operationTypeId: operationTypeId,
            date: date,
            firstTypeId: firstTypeId,
            firstShapeId: firstShapeId,
            quantity: quantity,
            secondTypeId: secondTypeId,
            secondShapeId: secondShapeId,
            scheduled: scheduled,
            reservationId: reservationId,
            notes: notes,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int operationTypeId,
            required DateTime date,
            required int firstTypeId,
            required int firstShapeId,
            required int quantity,
            Value<int?> secondTypeId = const Value.absent(),
            Value<int?> secondShapeId = const Value.absent(),
            Value<bool> scheduled = const Value.absent(),
            Value<int?> reservationId = const Value.absent(),
            Value<String?> notes = const Value.absent(),
          }) =>
              OperationsTableCompanion.insert(
            id: id,
            operationTypeId: operationTypeId,
            date: date,
            firstTypeId: firstTypeId,
            firstShapeId: firstShapeId,
            quantity: quantity,
            secondTypeId: secondTypeId,
            secondShapeId: secondShapeId,
            scheduled: scheduled,
            reservationId: reservationId,
            notes: notes,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$OperationsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {operationTypeId = false,
              firstTypeId = false,
              firstShapeId = false,
              secondTypeId = false,
              secondShapeId = false,
              storageTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (storageTableRefs) db.storageTable],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (operationTypeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.operationTypeId,
                    referencedTable: $$OperationsTableTableReferences
                        ._operationTypeIdTable(db),
                    referencedColumn: $$OperationsTableTableReferences
                        ._operationTypeIdTable(db)
                        .id,
                  ) as T;
                }
                if (firstTypeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.firstTypeId,
                    referencedTable:
                        $$OperationsTableTableReferences._firstTypeIdTable(db),
                    referencedColumn: $$OperationsTableTableReferences
                        ._firstTypeIdTable(db)
                        .id,
                  ) as T;
                }
                if (firstShapeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.firstShapeId,
                    referencedTable:
                        $$OperationsTableTableReferences._firstShapeIdTable(db),
                    referencedColumn: $$OperationsTableTableReferences
                        ._firstShapeIdTable(db)
                        .id,
                  ) as T;
                }
                if (secondTypeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.secondTypeId,
                    referencedTable:
                        $$OperationsTableTableReferences._secondTypeIdTable(db),
                    referencedColumn: $$OperationsTableTableReferences
                        ._secondTypeIdTable(db)
                        .id,
                  ) as T;
                }
                if (secondShapeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.secondShapeId,
                    referencedTable: $$OperationsTableTableReferences
                        ._secondShapeIdTable(db),
                    referencedColumn: $$OperationsTableTableReferences
                        ._secondShapeIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (storageTableRefs)
                    await $_getPrefetchedData<OperationsTableData,
                            $OperationsTableTable, StorageTableData>(
                        currentTable: table,
                        referencedTable: $$OperationsTableTableReferences
                            ._storageTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$OperationsTableTableReferences(db, table, p0)
                                .storageTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.parentOperationId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$OperationsTableTableProcessedTableManager = ProcessedTableManager<
    _$LocalDatabase,
    $OperationsTableTable,
    OperationsTableData,
    $$OperationsTableTableFilterComposer,
    $$OperationsTableTableOrderingComposer,
    $$OperationsTableTableAnnotationComposer,
    $$OperationsTableTableCreateCompanionBuilder,
    $$OperationsTableTableUpdateCompanionBuilder,
    (OperationsTableData, $$OperationsTableTableReferences),
    OperationsTableData,
    PrefetchHooks Function(
        {bool operationTypeId,
        bool firstTypeId,
        bool firstShapeId,
        bool secondTypeId,
        bool secondShapeId,
        bool storageTableRefs})>;
typedef $$StorageTableTableCreateCompanionBuilder = StorageTableCompanion
    Function({
  Value<int> id,
  required int plantTypeId,
  required int plantShapeId,
  required int quantity,
  Value<int?> parentOperationId,
  Value<String?> notes,
});
typedef $$StorageTableTableUpdateCompanionBuilder = StorageTableCompanion
    Function({
  Value<int> id,
  Value<int> plantTypeId,
  Value<int> plantShapeId,
  Value<int> quantity,
  Value<int?> parentOperationId,
  Value<String?> notes,
});

final class $$StorageTableTableReferences extends BaseReferences<
    _$LocalDatabase, $StorageTableTable, StorageTableData> {
  $$StorageTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PlantTypesTableTable _plantTypeIdTable(_$LocalDatabase db) =>
      db.plantTypesTable.createAlias($_aliasNameGenerator(
          db.storageTable.plantTypeId, db.plantTypesTable.id));

  $$PlantTypesTableTableProcessedTableManager get plantTypeId {
    final $_column = $_itemColumn<int>('plant_type_id')!;

    final manager =
        $$PlantTypesTableTableTableManager($_db, $_db.plantTypesTable)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_plantTypeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $PlantShapesTableTable _plantShapeIdTable(_$LocalDatabase db) =>
      db.plantShapesTable.createAlias($_aliasNameGenerator(
          db.storageTable.plantShapeId, db.plantShapesTable.id));

  $$PlantShapesTableTableProcessedTableManager get plantShapeId {
    final $_column = $_itemColumn<int>('plant_shape_id')!;

    final manager =
        $$PlantShapesTableTableTableManager($_db, $_db.plantShapesTable)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_plantShapeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $OperationsTableTable _parentOperationIdTable(_$LocalDatabase db) =>
      db.operationsTable.createAlias($_aliasNameGenerator(
          db.storageTable.parentOperationId, db.operationsTable.id));

  $$OperationsTableTableProcessedTableManager? get parentOperationId {
    final $_column = $_itemColumn<int>('parent_operation_id');
    if ($_column == null) return null;
    final manager =
        $$OperationsTableTableTableManager($_db, $_db.operationsTable)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_parentOperationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$StorageTableTableFilterComposer
    extends Composer<_$LocalDatabase, $StorageTableTable> {
  $$StorageTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  $$PlantTypesTableTableFilterComposer get plantTypeId {
    final $$PlantTypesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.plantTypeId,
        referencedTable: $db.plantTypesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlantTypesTableTableFilterComposer(
              $db: $db,
              $table: $db.plantTypesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PlantShapesTableTableFilterComposer get plantShapeId {
    final $$PlantShapesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.plantShapeId,
        referencedTable: $db.plantShapesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlantShapesTableTableFilterComposer(
              $db: $db,
              $table: $db.plantShapesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$OperationsTableTableFilterComposer get parentOperationId {
    final $$OperationsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parentOperationId,
        referencedTable: $db.operationsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OperationsTableTableFilterComposer(
              $db: $db,
              $table: $db.operationsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$StorageTableTableOrderingComposer
    extends Composer<_$LocalDatabase, $StorageTableTable> {
  $$StorageTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  $$PlantTypesTableTableOrderingComposer get plantTypeId {
    final $$PlantTypesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.plantTypeId,
        referencedTable: $db.plantTypesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlantTypesTableTableOrderingComposer(
              $db: $db,
              $table: $db.plantTypesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PlantShapesTableTableOrderingComposer get plantShapeId {
    final $$PlantShapesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.plantShapeId,
        referencedTable: $db.plantShapesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlantShapesTableTableOrderingComposer(
              $db: $db,
              $table: $db.plantShapesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$OperationsTableTableOrderingComposer get parentOperationId {
    final $$OperationsTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parentOperationId,
        referencedTable: $db.operationsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OperationsTableTableOrderingComposer(
              $db: $db,
              $table: $db.operationsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$StorageTableTableAnnotationComposer
    extends Composer<_$LocalDatabase, $StorageTableTable> {
  $$StorageTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$PlantTypesTableTableAnnotationComposer get plantTypeId {
    final $$PlantTypesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.plantTypeId,
        referencedTable: $db.plantTypesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlantTypesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.plantTypesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PlantShapesTableTableAnnotationComposer get plantShapeId {
    final $$PlantShapesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.plantShapeId,
        referencedTable: $db.plantShapesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlantShapesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.plantShapesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$OperationsTableTableAnnotationComposer get parentOperationId {
    final $$OperationsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parentOperationId,
        referencedTable: $db.operationsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OperationsTableTableAnnotationComposer(
              $db: $db,
              $table: $db.operationsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$StorageTableTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $StorageTableTable,
    StorageTableData,
    $$StorageTableTableFilterComposer,
    $$StorageTableTableOrderingComposer,
    $$StorageTableTableAnnotationComposer,
    $$StorageTableTableCreateCompanionBuilder,
    $$StorageTableTableUpdateCompanionBuilder,
    (StorageTableData, $$StorageTableTableReferences),
    StorageTableData,
    PrefetchHooks Function(
        {bool plantTypeId, bool plantShapeId, bool parentOperationId})> {
  $$StorageTableTableTableManager(_$LocalDatabase db, $StorageTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StorageTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StorageTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StorageTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> plantTypeId = const Value.absent(),
            Value<int> plantShapeId = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<int?> parentOperationId = const Value.absent(),
            Value<String?> notes = const Value.absent(),
          }) =>
              StorageTableCompanion(
            id: id,
            plantTypeId: plantTypeId,
            plantShapeId: plantShapeId,
            quantity: quantity,
            parentOperationId: parentOperationId,
            notes: notes,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int plantTypeId,
            required int plantShapeId,
            required int quantity,
            Value<int?> parentOperationId = const Value.absent(),
            Value<String?> notes = const Value.absent(),
          }) =>
              StorageTableCompanion.insert(
            id: id,
            plantTypeId: plantTypeId,
            plantShapeId: plantShapeId,
            quantity: quantity,
            parentOperationId: parentOperationId,
            notes: notes,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$StorageTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {plantTypeId = false,
              plantShapeId = false,
              parentOperationId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (plantTypeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.plantTypeId,
                    referencedTable:
                        $$StorageTableTableReferences._plantTypeIdTable(db),
                    referencedColumn:
                        $$StorageTableTableReferences._plantTypeIdTable(db).id,
                  ) as T;
                }
                if (plantShapeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.plantShapeId,
                    referencedTable:
                        $$StorageTableTableReferences._plantShapeIdTable(db),
                    referencedColumn:
                        $$StorageTableTableReferences._plantShapeIdTable(db).id,
                  ) as T;
                }
                if (parentOperationId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.parentOperationId,
                    referencedTable: $$StorageTableTableReferences
                        ._parentOperationIdTable(db),
                    referencedColumn: $$StorageTableTableReferences
                        ._parentOperationIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$StorageTableTableProcessedTableManager = ProcessedTableManager<
    _$LocalDatabase,
    $StorageTableTable,
    StorageTableData,
    $$StorageTableTableFilterComposer,
    $$StorageTableTableOrderingComposer,
    $$StorageTableTableAnnotationComposer,
    $$StorageTableTableCreateCompanionBuilder,
    $$StorageTableTableUpdateCompanionBuilder,
    (StorageTableData, $$StorageTableTableReferences),
    StorageTableData,
    PrefetchHooks Function(
        {bool plantTypeId, bool plantShapeId, bool parentOperationId})>;
typedef $$ScheduledStorageTableTableCreateCompanionBuilder
    = ScheduledStorageTableCompanion Function({
  Value<int> id,
  required int typeId,
  required int shapeId,
  required int quantity,
  required int parentOperationId,
  Value<String?> notes,
});
typedef $$ScheduledStorageTableTableUpdateCompanionBuilder
    = ScheduledStorageTableCompanion Function({
  Value<int> id,
  Value<int> typeId,
  Value<int> shapeId,
  Value<int> quantity,
  Value<int> parentOperationId,
  Value<String?> notes,
});

final class $$ScheduledStorageTableTableReferences extends BaseReferences<
    _$LocalDatabase, $ScheduledStorageTableTable, ScheduledStorageTableData> {
  $$ScheduledStorageTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $PlantTypesTableTable _typeIdTable(_$LocalDatabase db) =>
      db.plantTypesTable.createAlias($_aliasNameGenerator(
          db.scheduledStorageTable.typeId, db.plantTypesTable.id));

  $$PlantTypesTableTableProcessedTableManager get typeId {
    final $_column = $_itemColumn<int>('type_id')!;

    final manager =
        $$PlantTypesTableTableTableManager($_db, $_db.plantTypesTable)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_typeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $PlantShapesTableTable _shapeIdTable(_$LocalDatabase db) =>
      db.plantShapesTable.createAlias($_aliasNameGenerator(
          db.scheduledStorageTable.shapeId, db.plantShapesTable.id));

  $$PlantShapesTableTableProcessedTableManager get shapeId {
    final $_column = $_itemColumn<int>('shape_id')!;

    final manager =
        $$PlantShapesTableTableTableManager($_db, $_db.plantShapesTable)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_shapeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ScheduledStorageTableTableFilterComposer
    extends Composer<_$LocalDatabase, $ScheduledStorageTableTable> {
  $$ScheduledStorageTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get parentOperationId => $composableBuilder(
      column: $table.parentOperationId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  $$PlantTypesTableTableFilterComposer get typeId {
    final $$PlantTypesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.typeId,
        referencedTable: $db.plantTypesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlantTypesTableTableFilterComposer(
              $db: $db,
              $table: $db.plantTypesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PlantShapesTableTableFilterComposer get shapeId {
    final $$PlantShapesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.shapeId,
        referencedTable: $db.plantShapesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlantShapesTableTableFilterComposer(
              $db: $db,
              $table: $db.plantShapesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ScheduledStorageTableTableOrderingComposer
    extends Composer<_$LocalDatabase, $ScheduledStorageTableTable> {
  $$ScheduledStorageTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get parentOperationId => $composableBuilder(
      column: $table.parentOperationId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  $$PlantTypesTableTableOrderingComposer get typeId {
    final $$PlantTypesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.typeId,
        referencedTable: $db.plantTypesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlantTypesTableTableOrderingComposer(
              $db: $db,
              $table: $db.plantTypesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PlantShapesTableTableOrderingComposer get shapeId {
    final $$PlantShapesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.shapeId,
        referencedTable: $db.plantShapesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlantShapesTableTableOrderingComposer(
              $db: $db,
              $table: $db.plantShapesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ScheduledStorageTableTableAnnotationComposer
    extends Composer<_$LocalDatabase, $ScheduledStorageTableTable> {
  $$ScheduledStorageTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<int> get parentOperationId => $composableBuilder(
      column: $table.parentOperationId, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$PlantTypesTableTableAnnotationComposer get typeId {
    final $$PlantTypesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.typeId,
        referencedTable: $db.plantTypesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlantTypesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.plantTypesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PlantShapesTableTableAnnotationComposer get shapeId {
    final $$PlantShapesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.shapeId,
        referencedTable: $db.plantShapesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlantShapesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.plantShapesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ScheduledStorageTableTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $ScheduledStorageTableTable,
    ScheduledStorageTableData,
    $$ScheduledStorageTableTableFilterComposer,
    $$ScheduledStorageTableTableOrderingComposer,
    $$ScheduledStorageTableTableAnnotationComposer,
    $$ScheduledStorageTableTableCreateCompanionBuilder,
    $$ScheduledStorageTableTableUpdateCompanionBuilder,
    (ScheduledStorageTableData, $$ScheduledStorageTableTableReferences),
    ScheduledStorageTableData,
    PrefetchHooks Function({bool typeId, bool shapeId})> {
  $$ScheduledStorageTableTableTableManager(
      _$LocalDatabase db, $ScheduledStorageTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ScheduledStorageTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$ScheduledStorageTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ScheduledStorageTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> typeId = const Value.absent(),
            Value<int> shapeId = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<int> parentOperationId = const Value.absent(),
            Value<String?> notes = const Value.absent(),
          }) =>
              ScheduledStorageTableCompanion(
            id: id,
            typeId: typeId,
            shapeId: shapeId,
            quantity: quantity,
            parentOperationId: parentOperationId,
            notes: notes,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int typeId,
            required int shapeId,
            required int quantity,
            required int parentOperationId,
            Value<String?> notes = const Value.absent(),
          }) =>
              ScheduledStorageTableCompanion.insert(
            id: id,
            typeId: typeId,
            shapeId: shapeId,
            quantity: quantity,
            parentOperationId: parentOperationId,
            notes: notes,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ScheduledStorageTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({typeId = false, shapeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (typeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.typeId,
                    referencedTable:
                        $$ScheduledStorageTableTableReferences._typeIdTable(db),
                    referencedColumn: $$ScheduledStorageTableTableReferences
                        ._typeIdTable(db)
                        .id,
                  ) as T;
                }
                if (shapeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.shapeId,
                    referencedTable: $$ScheduledStorageTableTableReferences
                        ._shapeIdTable(db),
                    referencedColumn: $$ScheduledStorageTableTableReferences
                        ._shapeIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ScheduledStorageTableTableProcessedTableManager
    = ProcessedTableManager<
        _$LocalDatabase,
        $ScheduledStorageTableTable,
        ScheduledStorageTableData,
        $$ScheduledStorageTableTableFilterComposer,
        $$ScheduledStorageTableTableOrderingComposer,
        $$ScheduledStorageTableTableAnnotationComposer,
        $$ScheduledStorageTableTableCreateCompanionBuilder,
        $$ScheduledStorageTableTableUpdateCompanionBuilder,
        (ScheduledStorageTableData, $$ScheduledStorageTableTableReferences),
        ScheduledStorageTableData,
        PrefetchHooks Function({bool typeId, bool shapeId})>;

class $LocalDatabaseManager {
  final _$LocalDatabase _db;
  $LocalDatabaseManager(this._db);
  $$SetupExpenseTableTableTableManager get setupExpenseTable =>
      $$SetupExpenseTableTableTableManager(_db, _db.setupExpenseTable);
  $$PlantTypesTableTableTableManager get plantTypesTable =>
      $$PlantTypesTableTableTableManager(_db, _db.plantTypesTable);
  $$PlantingTableTableTableManager get plantingTable =>
      $$PlantingTableTableTableManager(_db, _db.plantingTable);
  $$PlantShapesTableTableTableManager get plantShapesTable =>
      $$PlantShapesTableTableTableManager(_db, _db.plantShapesTable);
  $$OperationTypesTableTableTableManager get operationTypesTable =>
      $$OperationTypesTableTableTableManager(_db, _db.operationTypesTable);
  $$OperationsTableTableTableManager get operationsTable =>
      $$OperationsTableTableTableManager(_db, _db.operationsTable);
  $$StorageTableTableTableManager get storageTable =>
      $$StorageTableTableTableManager(_db, _db.storageTable);
  $$ScheduledStorageTableTableTableManager get scheduledStorageTable =>
      $$ScheduledStorageTableTableTableManager(_db, _db.scheduledStorageTable);
}
