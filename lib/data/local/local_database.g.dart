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
  static const VerificationMeta _costMeta = const VerificationMeta('cost');
  @override
  late final GeneratedColumn<double> cost = GeneratedColumn<double>(
      'cost', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
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
        cost,
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
    if (data.containsKey('cost')) {
      context.handle(
          _costMeta, cost.isAcceptableOrUnknown(data['cost']!, _costMeta));
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
      cost: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}cost'])!,
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
  final double cost;
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
      required this.cost,
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
    map['cost'] = Variable<double>(cost);
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
      cost: Value(cost),
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
      cost: serializer.fromJson<double>(json['cost']),
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
      'cost': serializer.toJson<double>(cost),
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
          double? cost,
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
        cost: cost ?? this.cost,
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
      cost: data.cost.present ? data.cost.value : this.cost,
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
          ..write('cost: $cost, ')
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
      cost,
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
          other.cost == this.cost &&
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
  final Value<double> cost;
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
    this.cost = const Value.absent(),
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
    this.cost = const Value.absent(),
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
    Expression<double>? cost,
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
      if (cost != null) 'cost': cost,
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
      Value<double>? cost,
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
      cost: cost ?? this.cost,
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
    if (cost.present) {
      map['cost'] = Variable<double>(cost.value);
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
          ..write('cost: $cost, ')
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
  static const VerificationMeta _isScheduledMeta =
      const VerificationMeta('isScheduled');
  @override
  late final GeneratedColumn<bool> isScheduled = GeneratedColumn<bool>(
      'is_scheduled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_scheduled" IN (0, 1))'),
      defaultValue: Constant(false));
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        plantTypeId,
        plantShapeId,
        quantity,
        parentOperationId,
        isScheduled,
        notes
      ];
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
    if (data.containsKey('is_scheduled')) {
      context.handle(
          _isScheduledMeta,
          isScheduled.isAcceptableOrUnknown(
              data['is_scheduled']!, _isScheduledMeta));
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
      isScheduled: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_scheduled'])!,
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
  final bool isScheduled;
  final String? notes;
  const StorageTableData(
      {required this.id,
      required this.plantTypeId,
      required this.plantShapeId,
      required this.quantity,
      this.parentOperationId,
      required this.isScheduled,
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
    map['is_scheduled'] = Variable<bool>(isScheduled);
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
      isScheduled: Value(isScheduled),
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
      isScheduled: serializer.fromJson<bool>(json['isScheduled']),
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
      'isScheduled': serializer.toJson<bool>(isScheduled),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  StorageTableData copyWith(
          {int? id,
          int? plantTypeId,
          int? plantShapeId,
          int? quantity,
          Value<int?> parentOperationId = const Value.absent(),
          bool? isScheduled,
          Value<String?> notes = const Value.absent()}) =>
      StorageTableData(
        id: id ?? this.id,
        plantTypeId: plantTypeId ?? this.plantTypeId,
        plantShapeId: plantShapeId ?? this.plantShapeId,
        quantity: quantity ?? this.quantity,
        parentOperationId: parentOperationId.present
            ? parentOperationId.value
            : this.parentOperationId,
        isScheduled: isScheduled ?? this.isScheduled,
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
      isScheduled:
          data.isScheduled.present ? data.isScheduled.value : this.isScheduled,
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
          ..write('isScheduled: $isScheduled, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, plantTypeId, plantShapeId, quantity,
      parentOperationId, isScheduled, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StorageTableData &&
          other.id == this.id &&
          other.plantTypeId == this.plantTypeId &&
          other.plantShapeId == this.plantShapeId &&
          other.quantity == this.quantity &&
          other.parentOperationId == this.parentOperationId &&
          other.isScheduled == this.isScheduled &&
          other.notes == this.notes);
}

class StorageTableCompanion extends UpdateCompanion<StorageTableData> {
  final Value<int> id;
  final Value<int> plantTypeId;
  final Value<int> plantShapeId;
  final Value<int> quantity;
  final Value<int?> parentOperationId;
  final Value<bool> isScheduled;
  final Value<String?> notes;
  const StorageTableCompanion({
    this.id = const Value.absent(),
    this.plantTypeId = const Value.absent(),
    this.plantShapeId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.parentOperationId = const Value.absent(),
    this.isScheduled = const Value.absent(),
    this.notes = const Value.absent(),
  });
  StorageTableCompanion.insert({
    this.id = const Value.absent(),
    required int plantTypeId,
    required int plantShapeId,
    required int quantity,
    this.parentOperationId = const Value.absent(),
    this.isScheduled = const Value.absent(),
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
    Expression<bool>? isScheduled,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (plantTypeId != null) 'plant_type_id': plantTypeId,
      if (plantShapeId != null) 'plant_shape_id': plantShapeId,
      if (quantity != null) 'quantity': quantity,
      if (parentOperationId != null) 'parent_operation_id': parentOperationId,
      if (isScheduled != null) 'is_scheduled': isScheduled,
      if (notes != null) 'notes': notes,
    });
  }

  StorageTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? plantTypeId,
      Value<int>? plantShapeId,
      Value<int>? quantity,
      Value<int?>? parentOperationId,
      Value<bool>? isScheduled,
      Value<String?>? notes}) {
    return StorageTableCompanion(
      id: id ?? this.id,
      plantTypeId: plantTypeId ?? this.plantTypeId,
      plantShapeId: plantShapeId ?? this.plantShapeId,
      quantity: quantity ?? this.quantity,
      parentOperationId: parentOperationId ?? this.parentOperationId,
      isScheduled: isScheduled ?? this.isScheduled,
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
    if (isScheduled.present) {
      map['is_scheduled'] = Variable<bool>(isScheduled.value);
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
          ..write('isScheduled: $isScheduled, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class $ReservationsTableTable extends ReservationsTable
    with TableInfo<$ReservationsTableTable, ReservationsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReservationsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _fullNameMeta =
      const VerificationMeta('fullName');
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
      'full_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _reservationDateMeta =
      const VerificationMeta('reservationDate');
  @override
  late final GeneratedColumn<DateTime> reservationDate =
      GeneratedColumn<DateTime>('reservation_date', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deliveryDateMeta =
      const VerificationMeta('deliveryDate');
  @override
  late final GeneratedColumn<DateTime> deliveryDate = GeneratedColumn<DateTime>(
      'delivery_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
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
  static const VerificationMeta _depositMeta =
      const VerificationMeta('deposit');
  @override
  late final GeneratedColumn<double> deposit = GeneratedColumn<double>(
      'deposit', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: (Constant(0)));
  static const VerificationMeta _isFullyPaidMeta =
      const VerificationMeta('isFullyPaid');
  @override
  late final GeneratedColumn<bool> isFullyPaid = GeneratedColumn<bool>(
      'is_fully_paid', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_fully_paid" IN (0, 1))'),
      defaultValue: Constant(false));
  static const VerificationMeta _isDeliveredMeta =
      const VerificationMeta('isDelivered');
  @override
  late final GeneratedColumn<bool> isDelivered = GeneratedColumn<bool>(
      'is_delivered', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_delivered" IN (0, 1))'),
      defaultValue: Constant(false));
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        fullName,
        phone,
        reservationDate,
        deliveryDate,
        plantTypeId,
        plantShapeId,
        quantity,
        deposit,
        isFullyPaid,
        isDelivered,
        notes
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reservations_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<ReservationsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('full_name')) {
      context.handle(_fullNameMeta,
          fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta));
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('reservation_date')) {
      context.handle(
          _reservationDateMeta,
          reservationDate.isAcceptableOrUnknown(
              data['reservation_date']!, _reservationDateMeta));
    } else if (isInserting) {
      context.missing(_reservationDateMeta);
    }
    if (data.containsKey('delivery_date')) {
      context.handle(
          _deliveryDateMeta,
          deliveryDate.isAcceptableOrUnknown(
              data['delivery_date']!, _deliveryDateMeta));
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
    if (data.containsKey('deposit')) {
      context.handle(_depositMeta,
          deposit.isAcceptableOrUnknown(data['deposit']!, _depositMeta));
    }
    if (data.containsKey('is_fully_paid')) {
      context.handle(
          _isFullyPaidMeta,
          isFullyPaid.isAcceptableOrUnknown(
              data['is_fully_paid']!, _isFullyPaidMeta));
    }
    if (data.containsKey('is_delivered')) {
      context.handle(
          _isDeliveredMeta,
          isDelivered.isAcceptableOrUnknown(
              data['is_delivered']!, _isDeliveredMeta));
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
  ReservationsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReservationsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      fullName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}full_name'])!,
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone'])!,
      reservationDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}reservation_date'])!,
      deliveryDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}delivery_date']),
      plantTypeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}plant_type_id'])!,
      plantShapeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}plant_shape_id'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      deposit: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}deposit'])!,
      isFullyPaid: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_fully_paid'])!,
      isDelivered: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_delivered'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
    );
  }

  @override
  $ReservationsTableTable createAlias(String alias) {
    return $ReservationsTableTable(attachedDatabase, alias);
  }
}

class ReservationsTableData extends DataClass
    implements Insertable<ReservationsTableData> {
  final int id;
  final String fullName;
  final String phone;
  final DateTime reservationDate;
  final DateTime? deliveryDate;
  final int plantTypeId;
  final int plantShapeId;
  final int quantity;
  final double deposit;
  final bool isFullyPaid;
  final bool isDelivered;
  final String? notes;
  const ReservationsTableData(
      {required this.id,
      required this.fullName,
      required this.phone,
      required this.reservationDate,
      this.deliveryDate,
      required this.plantTypeId,
      required this.plantShapeId,
      required this.quantity,
      required this.deposit,
      required this.isFullyPaid,
      required this.isDelivered,
      this.notes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['full_name'] = Variable<String>(fullName);
    map['phone'] = Variable<String>(phone);
    map['reservation_date'] = Variable<DateTime>(reservationDate);
    if (!nullToAbsent || deliveryDate != null) {
      map['delivery_date'] = Variable<DateTime>(deliveryDate);
    }
    map['plant_type_id'] = Variable<int>(plantTypeId);
    map['plant_shape_id'] = Variable<int>(plantShapeId);
    map['quantity'] = Variable<int>(quantity);
    map['deposit'] = Variable<double>(deposit);
    map['is_fully_paid'] = Variable<bool>(isFullyPaid);
    map['is_delivered'] = Variable<bool>(isDelivered);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  ReservationsTableCompanion toCompanion(bool nullToAbsent) {
    return ReservationsTableCompanion(
      id: Value(id),
      fullName: Value(fullName),
      phone: Value(phone),
      reservationDate: Value(reservationDate),
      deliveryDate: deliveryDate == null && nullToAbsent
          ? const Value.absent()
          : Value(deliveryDate),
      plantTypeId: Value(plantTypeId),
      plantShapeId: Value(plantShapeId),
      quantity: Value(quantity),
      deposit: Value(deposit),
      isFullyPaid: Value(isFullyPaid),
      isDelivered: Value(isDelivered),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory ReservationsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReservationsTableData(
      id: serializer.fromJson<int>(json['id']),
      fullName: serializer.fromJson<String>(json['fullName']),
      phone: serializer.fromJson<String>(json['phone']),
      reservationDate: serializer.fromJson<DateTime>(json['reservationDate']),
      deliveryDate: serializer.fromJson<DateTime?>(json['deliveryDate']),
      plantTypeId: serializer.fromJson<int>(json['plantTypeId']),
      plantShapeId: serializer.fromJson<int>(json['plantShapeId']),
      quantity: serializer.fromJson<int>(json['quantity']),
      deposit: serializer.fromJson<double>(json['deposit']),
      isFullyPaid: serializer.fromJson<bool>(json['isFullyPaid']),
      isDelivered: serializer.fromJson<bool>(json['isDelivered']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'fullName': serializer.toJson<String>(fullName),
      'phone': serializer.toJson<String>(phone),
      'reservationDate': serializer.toJson<DateTime>(reservationDate),
      'deliveryDate': serializer.toJson<DateTime?>(deliveryDate),
      'plantTypeId': serializer.toJson<int>(plantTypeId),
      'plantShapeId': serializer.toJson<int>(plantShapeId),
      'quantity': serializer.toJson<int>(quantity),
      'deposit': serializer.toJson<double>(deposit),
      'isFullyPaid': serializer.toJson<bool>(isFullyPaid),
      'isDelivered': serializer.toJson<bool>(isDelivered),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  ReservationsTableData copyWith(
          {int? id,
          String? fullName,
          String? phone,
          DateTime? reservationDate,
          Value<DateTime?> deliveryDate = const Value.absent(),
          int? plantTypeId,
          int? plantShapeId,
          int? quantity,
          double? deposit,
          bool? isFullyPaid,
          bool? isDelivered,
          Value<String?> notes = const Value.absent()}) =>
      ReservationsTableData(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        phone: phone ?? this.phone,
        reservationDate: reservationDate ?? this.reservationDate,
        deliveryDate:
            deliveryDate.present ? deliveryDate.value : this.deliveryDate,
        plantTypeId: plantTypeId ?? this.plantTypeId,
        plantShapeId: plantShapeId ?? this.plantShapeId,
        quantity: quantity ?? this.quantity,
        deposit: deposit ?? this.deposit,
        isFullyPaid: isFullyPaid ?? this.isFullyPaid,
        isDelivered: isDelivered ?? this.isDelivered,
        notes: notes.present ? notes.value : this.notes,
      );
  ReservationsTableData copyWithCompanion(ReservationsTableCompanion data) {
    return ReservationsTableData(
      id: data.id.present ? data.id.value : this.id,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      phone: data.phone.present ? data.phone.value : this.phone,
      reservationDate: data.reservationDate.present
          ? data.reservationDate.value
          : this.reservationDate,
      deliveryDate: data.deliveryDate.present
          ? data.deliveryDate.value
          : this.deliveryDate,
      plantTypeId:
          data.plantTypeId.present ? data.plantTypeId.value : this.plantTypeId,
      plantShapeId: data.plantShapeId.present
          ? data.plantShapeId.value
          : this.plantShapeId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      deposit: data.deposit.present ? data.deposit.value : this.deposit,
      isFullyPaid:
          data.isFullyPaid.present ? data.isFullyPaid.value : this.isFullyPaid,
      isDelivered:
          data.isDelivered.present ? data.isDelivered.value : this.isDelivered,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReservationsTableData(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('phone: $phone, ')
          ..write('reservationDate: $reservationDate, ')
          ..write('deliveryDate: $deliveryDate, ')
          ..write('plantTypeId: $plantTypeId, ')
          ..write('plantShapeId: $plantShapeId, ')
          ..write('quantity: $quantity, ')
          ..write('deposit: $deposit, ')
          ..write('isFullyPaid: $isFullyPaid, ')
          ..write('isDelivered: $isDelivered, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      fullName,
      phone,
      reservationDate,
      deliveryDate,
      plantTypeId,
      plantShapeId,
      quantity,
      deposit,
      isFullyPaid,
      isDelivered,
      notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReservationsTableData &&
          other.id == this.id &&
          other.fullName == this.fullName &&
          other.phone == this.phone &&
          other.reservationDate == this.reservationDate &&
          other.deliveryDate == this.deliveryDate &&
          other.plantTypeId == this.plantTypeId &&
          other.plantShapeId == this.plantShapeId &&
          other.quantity == this.quantity &&
          other.deposit == this.deposit &&
          other.isFullyPaid == this.isFullyPaid &&
          other.isDelivered == this.isDelivered &&
          other.notes == this.notes);
}

class ReservationsTableCompanion
    extends UpdateCompanion<ReservationsTableData> {
  final Value<int> id;
  final Value<String> fullName;
  final Value<String> phone;
  final Value<DateTime> reservationDate;
  final Value<DateTime?> deliveryDate;
  final Value<int> plantTypeId;
  final Value<int> plantShapeId;
  final Value<int> quantity;
  final Value<double> deposit;
  final Value<bool> isFullyPaid;
  final Value<bool> isDelivered;
  final Value<String?> notes;
  const ReservationsTableCompanion({
    this.id = const Value.absent(),
    this.fullName = const Value.absent(),
    this.phone = const Value.absent(),
    this.reservationDate = const Value.absent(),
    this.deliveryDate = const Value.absent(),
    this.plantTypeId = const Value.absent(),
    this.plantShapeId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.deposit = const Value.absent(),
    this.isFullyPaid = const Value.absent(),
    this.isDelivered = const Value.absent(),
    this.notes = const Value.absent(),
  });
  ReservationsTableCompanion.insert({
    this.id = const Value.absent(),
    required String fullName,
    required String phone,
    required DateTime reservationDate,
    this.deliveryDate = const Value.absent(),
    required int plantTypeId,
    required int plantShapeId,
    required int quantity,
    this.deposit = const Value.absent(),
    this.isFullyPaid = const Value.absent(),
    this.isDelivered = const Value.absent(),
    this.notes = const Value.absent(),
  })  : fullName = Value(fullName),
        phone = Value(phone),
        reservationDate = Value(reservationDate),
        plantTypeId = Value(plantTypeId),
        plantShapeId = Value(plantShapeId),
        quantity = Value(quantity);
  static Insertable<ReservationsTableData> custom({
    Expression<int>? id,
    Expression<String>? fullName,
    Expression<String>? phone,
    Expression<DateTime>? reservationDate,
    Expression<DateTime>? deliveryDate,
    Expression<int>? plantTypeId,
    Expression<int>? plantShapeId,
    Expression<int>? quantity,
    Expression<double>? deposit,
    Expression<bool>? isFullyPaid,
    Expression<bool>? isDelivered,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fullName != null) 'full_name': fullName,
      if (phone != null) 'phone': phone,
      if (reservationDate != null) 'reservation_date': reservationDate,
      if (deliveryDate != null) 'delivery_date': deliveryDate,
      if (plantTypeId != null) 'plant_type_id': plantTypeId,
      if (plantShapeId != null) 'plant_shape_id': plantShapeId,
      if (quantity != null) 'quantity': quantity,
      if (deposit != null) 'deposit': deposit,
      if (isFullyPaid != null) 'is_fully_paid': isFullyPaid,
      if (isDelivered != null) 'is_delivered': isDelivered,
      if (notes != null) 'notes': notes,
    });
  }

  ReservationsTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? fullName,
      Value<String>? phone,
      Value<DateTime>? reservationDate,
      Value<DateTime?>? deliveryDate,
      Value<int>? plantTypeId,
      Value<int>? plantShapeId,
      Value<int>? quantity,
      Value<double>? deposit,
      Value<bool>? isFullyPaid,
      Value<bool>? isDelivered,
      Value<String?>? notes}) {
    return ReservationsTableCompanion(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      reservationDate: reservationDate ?? this.reservationDate,
      deliveryDate: deliveryDate ?? this.deliveryDate,
      plantTypeId: plantTypeId ?? this.plantTypeId,
      plantShapeId: plantShapeId ?? this.plantShapeId,
      quantity: quantity ?? this.quantity,
      deposit: deposit ?? this.deposit,
      isFullyPaid: isFullyPaid ?? this.isFullyPaid,
      isDelivered: isDelivered ?? this.isDelivered,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (reservationDate.present) {
      map['reservation_date'] = Variable<DateTime>(reservationDate.value);
    }
    if (deliveryDate.present) {
      map['delivery_date'] = Variable<DateTime>(deliveryDate.value);
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
    if (deposit.present) {
      map['deposit'] = Variable<double>(deposit.value);
    }
    if (isFullyPaid.present) {
      map['is_fully_paid'] = Variable<bool>(isFullyPaid.value);
    }
    if (isDelivered.present) {
      map['is_delivered'] = Variable<bool>(isDelivered.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReservationsTableCompanion(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('phone: $phone, ')
          ..write('reservationDate: $reservationDate, ')
          ..write('deliveryDate: $deliveryDate, ')
          ..write('plantTypeId: $plantTypeId, ')
          ..write('plantShapeId: $plantShapeId, ')
          ..write('quantity: $quantity, ')
          ..write('deposit: $deposit, ')
          ..write('isFullyPaid: $isFullyPaid, ')
          ..write('isDelivered: $isDelivered, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class $PricesTableTable extends PricesTable
    with TableInfo<$PricesTableTable, PricesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PricesTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, plantTypeId, plantShapeId, price];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'prices_table';
  @override
  VerificationContext validateIntegrity(Insertable<PricesTableData> instance,
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
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PricesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PricesTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      plantTypeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}plant_type_id'])!,
      plantShapeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}plant_shape_id'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
    );
  }

  @override
  $PricesTableTable createAlias(String alias) {
    return $PricesTableTable(attachedDatabase, alias);
  }
}

class PricesTableData extends DataClass implements Insertable<PricesTableData> {
  final int id;
  final int plantTypeId;
  final int plantShapeId;
  final double price;
  const PricesTableData(
      {required this.id,
      required this.plantTypeId,
      required this.plantShapeId,
      required this.price});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['plant_type_id'] = Variable<int>(plantTypeId);
    map['plant_shape_id'] = Variable<int>(plantShapeId);
    map['price'] = Variable<double>(price);
    return map;
  }

  PricesTableCompanion toCompanion(bool nullToAbsent) {
    return PricesTableCompanion(
      id: Value(id),
      plantTypeId: Value(plantTypeId),
      plantShapeId: Value(plantShapeId),
      price: Value(price),
    );
  }

  factory PricesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PricesTableData(
      id: serializer.fromJson<int>(json['id']),
      plantTypeId: serializer.fromJson<int>(json['plantTypeId']),
      plantShapeId: serializer.fromJson<int>(json['plantShapeId']),
      price: serializer.fromJson<double>(json['price']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'plantTypeId': serializer.toJson<int>(plantTypeId),
      'plantShapeId': serializer.toJson<int>(plantShapeId),
      'price': serializer.toJson<double>(price),
    };
  }

  PricesTableData copyWith(
          {int? id, int? plantTypeId, int? plantShapeId, double? price}) =>
      PricesTableData(
        id: id ?? this.id,
        plantTypeId: plantTypeId ?? this.plantTypeId,
        plantShapeId: plantShapeId ?? this.plantShapeId,
        price: price ?? this.price,
      );
  PricesTableData copyWithCompanion(PricesTableCompanion data) {
    return PricesTableData(
      id: data.id.present ? data.id.value : this.id,
      plantTypeId:
          data.plantTypeId.present ? data.plantTypeId.value : this.plantTypeId,
      plantShapeId: data.plantShapeId.present
          ? data.plantShapeId.value
          : this.plantShapeId,
      price: data.price.present ? data.price.value : this.price,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PricesTableData(')
          ..write('id: $id, ')
          ..write('plantTypeId: $plantTypeId, ')
          ..write('plantShapeId: $plantShapeId, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, plantTypeId, plantShapeId, price);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PricesTableData &&
          other.id == this.id &&
          other.plantTypeId == this.plantTypeId &&
          other.plantShapeId == this.plantShapeId &&
          other.price == this.price);
}

class PricesTableCompanion extends UpdateCompanion<PricesTableData> {
  final Value<int> id;
  final Value<int> plantTypeId;
  final Value<int> plantShapeId;
  final Value<double> price;
  const PricesTableCompanion({
    this.id = const Value.absent(),
    this.plantTypeId = const Value.absent(),
    this.plantShapeId = const Value.absent(),
    this.price = const Value.absent(),
  });
  PricesTableCompanion.insert({
    this.id = const Value.absent(),
    required int plantTypeId,
    required int plantShapeId,
    required double price,
  })  : plantTypeId = Value(plantTypeId),
        plantShapeId = Value(plantShapeId),
        price = Value(price);
  static Insertable<PricesTableData> custom({
    Expression<int>? id,
    Expression<int>? plantTypeId,
    Expression<int>? plantShapeId,
    Expression<double>? price,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (plantTypeId != null) 'plant_type_id': plantTypeId,
      if (plantShapeId != null) 'plant_shape_id': plantShapeId,
      if (price != null) 'price': price,
    });
  }

  PricesTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? plantTypeId,
      Value<int>? plantShapeId,
      Value<double>? price}) {
    return PricesTableCompanion(
      id: id ?? this.id,
      plantTypeId: plantTypeId ?? this.plantTypeId,
      plantShapeId: plantShapeId ?? this.plantShapeId,
      price: price ?? this.price,
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
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PricesTableCompanion(')
          ..write('id: $id, ')
          ..write('plantTypeId: $plantTypeId, ')
          ..write('plantShapeId: $plantShapeId, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }
}

class $ChancesTableTable extends ChancesTable
    with TableInfo<$ChancesTableTable, ChancesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChancesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _successRateMeta =
      const VerificationMeta('successRate');
  @override
  late final GeneratedColumn<double> successRate = GeneratedColumn<double>(
      'success_rate', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _shapeIdMeta =
      const VerificationMeta('shapeId');
  @override
  late final GeneratedColumn<int> shapeId = GeneratedColumn<int>(
      'shape_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES plant_shapes_table (id)'));
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
  static const VerificationMeta _maturityDateMeta =
      const VerificationMeta('maturityDate');
  @override
  late final GeneratedColumn<DateTime> maturityDate = GeneratedColumn<DateTime>(
      'maturity_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, successRate, shapeId, typeId, quantity, maturityDate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'chances_table';
  @override
  VerificationContext validateIntegrity(Insertable<ChancesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('success_rate')) {
      context.handle(
          _successRateMeta,
          successRate.isAcceptableOrUnknown(
              data['success_rate']!, _successRateMeta));
    } else if (isInserting) {
      context.missing(_successRateMeta);
    }
    if (data.containsKey('shape_id')) {
      context.handle(_shapeIdMeta,
          shapeId.isAcceptableOrUnknown(data['shape_id']!, _shapeIdMeta));
    } else if (isInserting) {
      context.missing(_shapeIdMeta);
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
    if (data.containsKey('maturity_date')) {
      context.handle(
          _maturityDateMeta,
          maturityDate.isAcceptableOrUnknown(
              data['maturity_date']!, _maturityDateMeta));
    } else if (isInserting) {
      context.missing(_maturityDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChancesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChancesTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      successRate: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}success_rate'])!,
      shapeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}shape_id'])!,
      typeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type_id'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      maturityDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}maturity_date'])!,
    );
  }

  @override
  $ChancesTableTable createAlias(String alias) {
    return $ChancesTableTable(attachedDatabase, alias);
  }
}

class ChancesTableData extends DataClass
    implements Insertable<ChancesTableData> {
  final int id;
  final double successRate;
  final int shapeId;
  final int typeId;
  final int quantity;
  final DateTime maturityDate;
  const ChancesTableData(
      {required this.id,
      required this.successRate,
      required this.shapeId,
      required this.typeId,
      required this.quantity,
      required this.maturityDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['success_rate'] = Variable<double>(successRate);
    map['shape_id'] = Variable<int>(shapeId);
    map['type_id'] = Variable<int>(typeId);
    map['quantity'] = Variable<int>(quantity);
    map['maturity_date'] = Variable<DateTime>(maturityDate);
    return map;
  }

  ChancesTableCompanion toCompanion(bool nullToAbsent) {
    return ChancesTableCompanion(
      id: Value(id),
      successRate: Value(successRate),
      shapeId: Value(shapeId),
      typeId: Value(typeId),
      quantity: Value(quantity),
      maturityDate: Value(maturityDate),
    );
  }

  factory ChancesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChancesTableData(
      id: serializer.fromJson<int>(json['id']),
      successRate: serializer.fromJson<double>(json['successRate']),
      shapeId: serializer.fromJson<int>(json['shapeId']),
      typeId: serializer.fromJson<int>(json['typeId']),
      quantity: serializer.fromJson<int>(json['quantity']),
      maturityDate: serializer.fromJson<DateTime>(json['maturityDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'successRate': serializer.toJson<double>(successRate),
      'shapeId': serializer.toJson<int>(shapeId),
      'typeId': serializer.toJson<int>(typeId),
      'quantity': serializer.toJson<int>(quantity),
      'maturityDate': serializer.toJson<DateTime>(maturityDate),
    };
  }

  ChancesTableData copyWith(
          {int? id,
          double? successRate,
          int? shapeId,
          int? typeId,
          int? quantity,
          DateTime? maturityDate}) =>
      ChancesTableData(
        id: id ?? this.id,
        successRate: successRate ?? this.successRate,
        shapeId: shapeId ?? this.shapeId,
        typeId: typeId ?? this.typeId,
        quantity: quantity ?? this.quantity,
        maturityDate: maturityDate ?? this.maturityDate,
      );
  ChancesTableData copyWithCompanion(ChancesTableCompanion data) {
    return ChancesTableData(
      id: data.id.present ? data.id.value : this.id,
      successRate:
          data.successRate.present ? data.successRate.value : this.successRate,
      shapeId: data.shapeId.present ? data.shapeId.value : this.shapeId,
      typeId: data.typeId.present ? data.typeId.value : this.typeId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      maturityDate: data.maturityDate.present
          ? data.maturityDate.value
          : this.maturityDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChancesTableData(')
          ..write('id: $id, ')
          ..write('successRate: $successRate, ')
          ..write('shapeId: $shapeId, ')
          ..write('typeId: $typeId, ')
          ..write('quantity: $quantity, ')
          ..write('maturityDate: $maturityDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, successRate, shapeId, typeId, quantity, maturityDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChancesTableData &&
          other.id == this.id &&
          other.successRate == this.successRate &&
          other.shapeId == this.shapeId &&
          other.typeId == this.typeId &&
          other.quantity == this.quantity &&
          other.maturityDate == this.maturityDate);
}

class ChancesTableCompanion extends UpdateCompanion<ChancesTableData> {
  final Value<int> id;
  final Value<double> successRate;
  final Value<int> shapeId;
  final Value<int> typeId;
  final Value<int> quantity;
  final Value<DateTime> maturityDate;
  const ChancesTableCompanion({
    this.id = const Value.absent(),
    this.successRate = const Value.absent(),
    this.shapeId = const Value.absent(),
    this.typeId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.maturityDate = const Value.absent(),
  });
  ChancesTableCompanion.insert({
    this.id = const Value.absent(),
    required double successRate,
    required int shapeId,
    required int typeId,
    required int quantity,
    required DateTime maturityDate,
  })  : successRate = Value(successRate),
        shapeId = Value(shapeId),
        typeId = Value(typeId),
        quantity = Value(quantity),
        maturityDate = Value(maturityDate);
  static Insertable<ChancesTableData> custom({
    Expression<int>? id,
    Expression<double>? successRate,
    Expression<int>? shapeId,
    Expression<int>? typeId,
    Expression<int>? quantity,
    Expression<DateTime>? maturityDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (successRate != null) 'success_rate': successRate,
      if (shapeId != null) 'shape_id': shapeId,
      if (typeId != null) 'type_id': typeId,
      if (quantity != null) 'quantity': quantity,
      if (maturityDate != null) 'maturity_date': maturityDate,
    });
  }

  ChancesTableCompanion copyWith(
      {Value<int>? id,
      Value<double>? successRate,
      Value<int>? shapeId,
      Value<int>? typeId,
      Value<int>? quantity,
      Value<DateTime>? maturityDate}) {
    return ChancesTableCompanion(
      id: id ?? this.id,
      successRate: successRate ?? this.successRate,
      shapeId: shapeId ?? this.shapeId,
      typeId: typeId ?? this.typeId,
      quantity: quantity ?? this.quantity,
      maturityDate: maturityDate ?? this.maturityDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (successRate.present) {
      map['success_rate'] = Variable<double>(successRate.value);
    }
    if (shapeId.present) {
      map['shape_id'] = Variable<int>(shapeId.value);
    }
    if (typeId.present) {
      map['type_id'] = Variable<int>(typeId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (maturityDate.present) {
      map['maturity_date'] = Variable<DateTime>(maturityDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChancesTableCompanion(')
          ..write('id: $id, ')
          ..write('successRate: $successRate, ')
          ..write('shapeId: $shapeId, ')
          ..write('typeId: $typeId, ')
          ..write('quantity: $quantity, ')
          ..write('maturityDate: $maturityDate')
          ..write(')'))
        .toString();
  }
}

class $ParentChildChancesTableTable extends ParentChildChancesTable
    with TableInfo<$ParentChildChancesTableTable, ParentChildChancesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ParentChildChancesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _parentIdMeta =
      const VerificationMeta('parentId');
  @override
  late final GeneratedColumn<int> parentId = GeneratedColumn<int>(
      'parent_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES chances_table (id)'));
  static const VerificationMeta _childIdMeta =
      const VerificationMeta('childId');
  @override
  late final GeneratedColumn<int> childId = GeneratedColumn<int>(
      'child_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES chances_table (id)'));
  @override
  List<GeneratedColumn> get $columns => [parentId, childId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'parent_child_chances_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<ParentChildChancesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('parent_id')) {
      context.handle(_parentIdMeta,
          parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta));
    } else if (isInserting) {
      context.missing(_parentIdMeta);
    }
    if (data.containsKey('child_id')) {
      context.handle(_childIdMeta,
          childId.isAcceptableOrUnknown(data['child_id']!, _childIdMeta));
    } else if (isInserting) {
      context.missing(_childIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {parentId, childId};
  @override
  ParentChildChancesTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ParentChildChancesTableData(
      parentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}parent_id'])!,
      childId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}child_id'])!,
    );
  }

  @override
  $ParentChildChancesTableTable createAlias(String alias) {
    return $ParentChildChancesTableTable(attachedDatabase, alias);
  }
}

class ParentChildChancesTableData extends DataClass
    implements Insertable<ParentChildChancesTableData> {
  final int parentId;
  final int childId;
  const ParentChildChancesTableData(
      {required this.parentId, required this.childId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['parent_id'] = Variable<int>(parentId);
    map['child_id'] = Variable<int>(childId);
    return map;
  }

  ParentChildChancesTableCompanion toCompanion(bool nullToAbsent) {
    return ParentChildChancesTableCompanion(
      parentId: Value(parentId),
      childId: Value(childId),
    );
  }

  factory ParentChildChancesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ParentChildChancesTableData(
      parentId: serializer.fromJson<int>(json['parentId']),
      childId: serializer.fromJson<int>(json['childId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'parentId': serializer.toJson<int>(parentId),
      'childId': serializer.toJson<int>(childId),
    };
  }

  ParentChildChancesTableData copyWith({int? parentId, int? childId}) =>
      ParentChildChancesTableData(
        parentId: parentId ?? this.parentId,
        childId: childId ?? this.childId,
      );
  ParentChildChancesTableData copyWithCompanion(
      ParentChildChancesTableCompanion data) {
    return ParentChildChancesTableData(
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      childId: data.childId.present ? data.childId.value : this.childId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ParentChildChancesTableData(')
          ..write('parentId: $parentId, ')
          ..write('childId: $childId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(parentId, childId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ParentChildChancesTableData &&
          other.parentId == this.parentId &&
          other.childId == this.childId);
}

class ParentChildChancesTableCompanion
    extends UpdateCompanion<ParentChildChancesTableData> {
  final Value<int> parentId;
  final Value<int> childId;
  final Value<int> rowid;
  const ParentChildChancesTableCompanion({
    this.parentId = const Value.absent(),
    this.childId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ParentChildChancesTableCompanion.insert({
    required int parentId,
    required int childId,
    this.rowid = const Value.absent(),
  })  : parentId = Value(parentId),
        childId = Value(childId);
  static Insertable<ParentChildChancesTableData> custom({
    Expression<int>? parentId,
    Expression<int>? childId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (parentId != null) 'parent_id': parentId,
      if (childId != null) 'child_id': childId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ParentChildChancesTableCompanion copyWith(
      {Value<int>? parentId, Value<int>? childId, Value<int>? rowid}) {
    return ParentChildChancesTableCompanion(
      parentId: parentId ?? this.parentId,
      childId: childId ?? this.childId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (parentId.present) {
      map['parent_id'] = Variable<int>(parentId.value);
    }
    if (childId.present) {
      map['child_id'] = Variable<int>(childId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ParentChildChancesTableCompanion(')
          ..write('parentId: $parentId, ')
          ..write('childId: $childId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ReservationDetailsTableTable extends ReservationDetailsTable
    with TableInfo<$ReservationDetailsTableTable, ReservationDetailsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReservationDetailsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _reservationIdMeta =
      const VerificationMeta('reservationId');
  @override
  late final GeneratedColumn<int> reservationId = GeneratedColumn<int>(
      'reservation_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES reservations_table (id)'));
  static const VerificationMeta _shapeIdMeta =
      const VerificationMeta('shapeId');
  @override
  late final GeneratedColumn<int> shapeId = GeneratedColumn<int>(
      'shape_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES plant_shapes_table (id)'));
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
  @override
  late final GeneratedColumnWithTypeConverter<ReservationStatus, int> status =
      GeneratedColumn<int>('status', aliasedName, false,
              type: DriftSqlType.int,
              requiredDuringInsert: false,
              defaultValue: const Constant(0))
          .withConverter<ReservationStatus>(
              $ReservationDetailsTableTable.$converterstatus);
  @override
  List<GeneratedColumn> get $columns =>
      [id, reservationId, shapeId, typeId, quantity, status];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reservation_details_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<ReservationDetailsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('reservation_id')) {
      context.handle(
          _reservationIdMeta,
          reservationId.isAcceptableOrUnknown(
              data['reservation_id']!, _reservationIdMeta));
    } else if (isInserting) {
      context.missing(_reservationIdMeta);
    }
    if (data.containsKey('shape_id')) {
      context.handle(_shapeIdMeta,
          shapeId.isAcceptableOrUnknown(data['shape_id']!, _shapeIdMeta));
    } else if (isInserting) {
      context.missing(_shapeIdMeta);
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReservationDetailsTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReservationDetailsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      reservationId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}reservation_id'])!,
      shapeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}shape_id'])!,
      typeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type_id'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      status: $ReservationDetailsTableTable.$converterstatus.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.int, data['${effectivePrefix}status'])!),
    );
  }

  @override
  $ReservationDetailsTableTable createAlias(String alias) {
    return $ReservationDetailsTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ReservationStatus, int, int> $converterstatus =
      const EnumIndexConverter<ReservationStatus>(ReservationStatus.values);
}

class ReservationDetailsTableData extends DataClass
    implements Insertable<ReservationDetailsTableData> {
  final int id;
  final int reservationId;
  final int shapeId;
  final int typeId;
  final int quantity;
  final ReservationStatus status;
  const ReservationDetailsTableData(
      {required this.id,
      required this.reservationId,
      required this.shapeId,
      required this.typeId,
      required this.quantity,
      required this.status});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['reservation_id'] = Variable<int>(reservationId);
    map['shape_id'] = Variable<int>(shapeId);
    map['type_id'] = Variable<int>(typeId);
    map['quantity'] = Variable<int>(quantity);
    {
      map['status'] = Variable<int>(
          $ReservationDetailsTableTable.$converterstatus.toSql(status));
    }
    return map;
  }

  ReservationDetailsTableCompanion toCompanion(bool nullToAbsent) {
    return ReservationDetailsTableCompanion(
      id: Value(id),
      reservationId: Value(reservationId),
      shapeId: Value(shapeId),
      typeId: Value(typeId),
      quantity: Value(quantity),
      status: Value(status),
    );
  }

  factory ReservationDetailsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReservationDetailsTableData(
      id: serializer.fromJson<int>(json['id']),
      reservationId: serializer.fromJson<int>(json['reservationId']),
      shapeId: serializer.fromJson<int>(json['shapeId']),
      typeId: serializer.fromJson<int>(json['typeId']),
      quantity: serializer.fromJson<int>(json['quantity']),
      status: $ReservationDetailsTableTable.$converterstatus
          .fromJson(serializer.fromJson<int>(json['status'])),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'reservationId': serializer.toJson<int>(reservationId),
      'shapeId': serializer.toJson<int>(shapeId),
      'typeId': serializer.toJson<int>(typeId),
      'quantity': serializer.toJson<int>(quantity),
      'status': serializer.toJson<int>(
          $ReservationDetailsTableTable.$converterstatus.toJson(status)),
    };
  }

  ReservationDetailsTableData copyWith(
          {int? id,
          int? reservationId,
          int? shapeId,
          int? typeId,
          int? quantity,
          ReservationStatus? status}) =>
      ReservationDetailsTableData(
        id: id ?? this.id,
        reservationId: reservationId ?? this.reservationId,
        shapeId: shapeId ?? this.shapeId,
        typeId: typeId ?? this.typeId,
        quantity: quantity ?? this.quantity,
        status: status ?? this.status,
      );
  ReservationDetailsTableData copyWithCompanion(
      ReservationDetailsTableCompanion data) {
    return ReservationDetailsTableData(
      id: data.id.present ? data.id.value : this.id,
      reservationId: data.reservationId.present
          ? data.reservationId.value
          : this.reservationId,
      shapeId: data.shapeId.present ? data.shapeId.value : this.shapeId,
      typeId: data.typeId.present ? data.typeId.value : this.typeId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReservationDetailsTableData(')
          ..write('id: $id, ')
          ..write('reservationId: $reservationId, ')
          ..write('shapeId: $shapeId, ')
          ..write('typeId: $typeId, ')
          ..write('quantity: $quantity, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, reservationId, shapeId, typeId, quantity, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReservationDetailsTableData &&
          other.id == this.id &&
          other.reservationId == this.reservationId &&
          other.shapeId == this.shapeId &&
          other.typeId == this.typeId &&
          other.quantity == this.quantity &&
          other.status == this.status);
}

class ReservationDetailsTableCompanion
    extends UpdateCompanion<ReservationDetailsTableData> {
  final Value<int> id;
  final Value<int> reservationId;
  final Value<int> shapeId;
  final Value<int> typeId;
  final Value<int> quantity;
  final Value<ReservationStatus> status;
  const ReservationDetailsTableCompanion({
    this.id = const Value.absent(),
    this.reservationId = const Value.absent(),
    this.shapeId = const Value.absent(),
    this.typeId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.status = const Value.absent(),
  });
  ReservationDetailsTableCompanion.insert({
    this.id = const Value.absent(),
    required int reservationId,
    required int shapeId,
    required int typeId,
    required int quantity,
    this.status = const Value.absent(),
  })  : reservationId = Value(reservationId),
        shapeId = Value(shapeId),
        typeId = Value(typeId),
        quantity = Value(quantity);
  static Insertable<ReservationDetailsTableData> custom({
    Expression<int>? id,
    Expression<int>? reservationId,
    Expression<int>? shapeId,
    Expression<int>? typeId,
    Expression<int>? quantity,
    Expression<int>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (reservationId != null) 'reservation_id': reservationId,
      if (shapeId != null) 'shape_id': shapeId,
      if (typeId != null) 'type_id': typeId,
      if (quantity != null) 'quantity': quantity,
      if (status != null) 'status': status,
    });
  }

  ReservationDetailsTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? reservationId,
      Value<int>? shapeId,
      Value<int>? typeId,
      Value<int>? quantity,
      Value<ReservationStatus>? status}) {
    return ReservationDetailsTableCompanion(
      id: id ?? this.id,
      reservationId: reservationId ?? this.reservationId,
      shapeId: shapeId ?? this.shapeId,
      typeId: typeId ?? this.typeId,
      quantity: quantity ?? this.quantity,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (reservationId.present) {
      map['reservation_id'] = Variable<int>(reservationId.value);
    }
    if (shapeId.present) {
      map['shape_id'] = Variable<int>(shapeId.value);
    }
    if (typeId.present) {
      map['type_id'] = Variable<int>(typeId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(
          $ReservationDetailsTableTable.$converterstatus.toSql(status.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReservationDetailsTableCompanion(')
          ..write('id: $id, ')
          ..write('reservationId: $reservationId, ')
          ..write('shapeId: $shapeId, ')
          ..write('typeId: $typeId, ')
          ..write('quantity: $quantity, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $StorageReservationTableTable extends StorageReservationTable
    with TableInfo<$StorageReservationTableTable, StorageReservationTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StorageReservationTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _storageIdMeta =
      const VerificationMeta('storageId');
  @override
  late final GeneratedColumn<int> storageId = GeneratedColumn<int>(
      'storage_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES storage_table (id)'));
  static const VerificationMeta _reservationIdMeta =
      const VerificationMeta('reservationId');
  @override
  late final GeneratedColumn<int> reservationId = GeneratedColumn<int>(
      'reservation_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES reservations_table (id)'));
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [storageId, reservationId, quantity];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'storage_reservation_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<StorageReservationTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('storage_id')) {
      context.handle(_storageIdMeta,
          storageId.isAcceptableOrUnknown(data['storage_id']!, _storageIdMeta));
    } else if (isInserting) {
      context.missing(_storageIdMeta);
    }
    if (data.containsKey('reservation_id')) {
      context.handle(
          _reservationIdMeta,
          reservationId.isAcceptableOrUnknown(
              data['reservation_id']!, _reservationIdMeta));
    } else if (isInserting) {
      context.missing(_reservationIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {storageId, reservationId};
  @override
  StorageReservationTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StorageReservationTableData(
      storageId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}storage_id'])!,
      reservationId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}reservation_id'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
    );
  }

  @override
  $StorageReservationTableTable createAlias(String alias) {
    return $StorageReservationTableTable(attachedDatabase, alias);
  }
}

class StorageReservationTableData extends DataClass
    implements Insertable<StorageReservationTableData> {
  final int storageId;
  final int reservationId;
  final int quantity;
  const StorageReservationTableData(
      {required this.storageId,
      required this.reservationId,
      required this.quantity});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['storage_id'] = Variable<int>(storageId);
    map['reservation_id'] = Variable<int>(reservationId);
    map['quantity'] = Variable<int>(quantity);
    return map;
  }

  StorageReservationTableCompanion toCompanion(bool nullToAbsent) {
    return StorageReservationTableCompanion(
      storageId: Value(storageId),
      reservationId: Value(reservationId),
      quantity: Value(quantity),
    );
  }

  factory StorageReservationTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StorageReservationTableData(
      storageId: serializer.fromJson<int>(json['storageId']),
      reservationId: serializer.fromJson<int>(json['reservationId']),
      quantity: serializer.fromJson<int>(json['quantity']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'storageId': serializer.toJson<int>(storageId),
      'reservationId': serializer.toJson<int>(reservationId),
      'quantity': serializer.toJson<int>(quantity),
    };
  }

  StorageReservationTableData copyWith(
          {int? storageId, int? reservationId, int? quantity}) =>
      StorageReservationTableData(
        storageId: storageId ?? this.storageId,
        reservationId: reservationId ?? this.reservationId,
        quantity: quantity ?? this.quantity,
      );
  StorageReservationTableData copyWithCompanion(
      StorageReservationTableCompanion data) {
    return StorageReservationTableData(
      storageId: data.storageId.present ? data.storageId.value : this.storageId,
      reservationId: data.reservationId.present
          ? data.reservationId.value
          : this.reservationId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StorageReservationTableData(')
          ..write('storageId: $storageId, ')
          ..write('reservationId: $reservationId, ')
          ..write('quantity: $quantity')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(storageId, reservationId, quantity);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StorageReservationTableData &&
          other.storageId == this.storageId &&
          other.reservationId == this.reservationId &&
          other.quantity == this.quantity);
}

class StorageReservationTableCompanion
    extends UpdateCompanion<StorageReservationTableData> {
  final Value<int> storageId;
  final Value<int> reservationId;
  final Value<int> quantity;
  final Value<int> rowid;
  const StorageReservationTableCompanion({
    this.storageId = const Value.absent(),
    this.reservationId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StorageReservationTableCompanion.insert({
    required int storageId,
    required int reservationId,
    required int quantity,
    this.rowid = const Value.absent(),
  })  : storageId = Value(storageId),
        reservationId = Value(reservationId),
        quantity = Value(quantity);
  static Insertable<StorageReservationTableData> custom({
    Expression<int>? storageId,
    Expression<int>? reservationId,
    Expression<int>? quantity,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (storageId != null) 'storage_id': storageId,
      if (reservationId != null) 'reservation_id': reservationId,
      if (quantity != null) 'quantity': quantity,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StorageReservationTableCompanion copyWith(
      {Value<int>? storageId,
      Value<int>? reservationId,
      Value<int>? quantity,
      Value<int>? rowid}) {
    return StorageReservationTableCompanion(
      storageId: storageId ?? this.storageId,
      reservationId: reservationId ?? this.reservationId,
      quantity: quantity ?? this.quantity,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (storageId.present) {
      map['storage_id'] = Variable<int>(storageId.value);
    }
    if (reservationId.present) {
      map['reservation_id'] = Variable<int>(reservationId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StorageReservationTableCompanion(')
          ..write('storageId: $storageId, ')
          ..write('reservationId: $reservationId, ')
          ..write('quantity: $quantity, ')
          ..write('rowid: $rowid')
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
  late final $PlantShapesTableTable plantShapesTable =
      $PlantShapesTableTable(this);
  late final $OperationTypesTableTable operationTypesTable =
      $OperationTypesTableTable(this);
  late final $OperationsTableTable operationsTable =
      $OperationsTableTable(this);
  late final $StorageTableTable storageTable = $StorageTableTable(this);
  late final $ReservationsTableTable reservationsTable =
      $ReservationsTableTable(this);
  late final $PricesTableTable pricesTable = $PricesTableTable(this);
  late final $ChancesTableTable chancesTable = $ChancesTableTable(this);
  late final $ParentChildChancesTableTable parentChildChancesTable =
      $ParentChildChancesTableTable(this);
  late final $ReservationDetailsTableTable reservationDetailsTable =
      $ReservationDetailsTableTable(this);
  late final $StorageReservationTableTable storageReservationTable =
      $StorageReservationTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        setupExpenseTable,
        plantTypesTable,
        plantShapesTable,
        operationTypesTable,
        operationsTable,
        storageTable,
        reservationsTable,
        pricesTable,
        chancesTable,
        parentChildChancesTable,
        reservationDetailsTable,
        storageReservationTable
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

  static MultiTypedResultKey<$ReservationsTableTable,
      List<ReservationsTableData>> _reservationsTableRefsTable(
          _$LocalDatabase db) =>
      MultiTypedResultKey.fromTable(db.reservationsTable,
          aliasName: $_aliasNameGenerator(
              db.plantTypesTable.id, db.reservationsTable.plantTypeId));

  $$ReservationsTableTableProcessedTableManager get reservationsTableRefs {
    final manager = $$ReservationsTableTableTableManager(
            $_db, $_db.reservationsTable)
        .filter((f) => f.plantTypeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_reservationsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$PricesTableTable, List<PricesTableData>>
      _pricesTableRefsTable(_$LocalDatabase db) =>
          MultiTypedResultKey.fromTable(db.pricesTable,
              aliasName: $_aliasNameGenerator(
                  db.plantTypesTable.id, db.pricesTable.plantTypeId));

  $$PricesTableTableProcessedTableManager get pricesTableRefs {
    final manager = $$PricesTableTableTableManager($_db, $_db.pricesTable)
        .filter((f) => f.plantTypeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_pricesTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ChancesTableTable, List<ChancesTableData>>
      _chancesTableRefsTable(_$LocalDatabase db) =>
          MultiTypedResultKey.fromTable(db.chancesTable,
              aliasName: $_aliasNameGenerator(
                  db.plantTypesTable.id, db.chancesTable.typeId));

  $$ChancesTableTableProcessedTableManager get chancesTableRefs {
    final manager = $$ChancesTableTableTableManager($_db, $_db.chancesTable)
        .filter((f) => f.typeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_chancesTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ReservationDetailsTableTable,
      List<ReservationDetailsTableData>> _reservationDetailsTableRefsTable(
          _$LocalDatabase db) =>
      MultiTypedResultKey.fromTable(db.reservationDetailsTable,
          aliasName: $_aliasNameGenerator(
              db.plantTypesTable.id, db.reservationDetailsTable.typeId));

  $$ReservationDetailsTableTableProcessedTableManager
      get reservationDetailsTableRefs {
    final manager = $$ReservationDetailsTableTableTableManager(
            $_db, $_db.reservationDetailsTable)
        .filter((f) => f.typeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_reservationDetailsTableRefsTable($_db));
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

  Expression<bool> reservationsTableRefs(
      Expression<bool> Function($$ReservationsTableTableFilterComposer f) f) {
    final $$ReservationsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.reservationsTable,
        getReferencedColumn: (t) => t.plantTypeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ReservationsTableTableFilterComposer(
              $db: $db,
              $table: $db.reservationsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> pricesTableRefs(
      Expression<bool> Function($$PricesTableTableFilterComposer f) f) {
    final $$PricesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.pricesTable,
        getReferencedColumn: (t) => t.plantTypeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PricesTableTableFilterComposer(
              $db: $db,
              $table: $db.pricesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> chancesTableRefs(
      Expression<bool> Function($$ChancesTableTableFilterComposer f) f) {
    final $$ChancesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.chancesTable,
        getReferencedColumn: (t) => t.typeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ChancesTableTableFilterComposer(
              $db: $db,
              $table: $db.chancesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> reservationDetailsTableRefs(
      Expression<bool> Function($$ReservationDetailsTableTableFilterComposer f)
          f) {
    final $$ReservationDetailsTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.reservationDetailsTable,
            getReferencedColumn: (t) => t.typeId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ReservationDetailsTableTableFilterComposer(
                  $db: $db,
                  $table: $db.reservationDetailsTable,
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

  Expression<T> reservationsTableRefs<T extends Object>(
      Expression<T> Function($$ReservationsTableTableAnnotationComposer a) f) {
    final $$ReservationsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.reservationsTable,
            getReferencedColumn: (t) => t.plantTypeId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ReservationsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.reservationsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> pricesTableRefs<T extends Object>(
      Expression<T> Function($$PricesTableTableAnnotationComposer a) f) {
    final $$PricesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.pricesTable,
        getReferencedColumn: (t) => t.plantTypeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PricesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.pricesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> chancesTableRefs<T extends Object>(
      Expression<T> Function($$ChancesTableTableAnnotationComposer a) f) {
    final $$ChancesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.chancesTable,
        getReferencedColumn: (t) => t.typeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ChancesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.chancesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> reservationDetailsTableRefs<T extends Object>(
      Expression<T> Function($$ReservationDetailsTableTableAnnotationComposer a)
          f) {
    final $$ReservationDetailsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.reservationDetailsTable,
            getReferencedColumn: (t) => t.typeId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ReservationDetailsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.reservationDetailsTable,
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
        {bool firstTypeRelation,
        bool secondTypeRelation,
        bool storageTableRefs,
        bool reservationsTableRefs,
        bool pricesTableRefs,
        bool chancesTableRefs,
        bool reservationDetailsTableRefs})> {
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
              {firstTypeRelation = false,
              secondTypeRelation = false,
              storageTableRefs = false,
              reservationsTableRefs = false,
              pricesTableRefs = false,
              chancesTableRefs = false,
              reservationDetailsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (firstTypeRelation) db.operationsTable,
                if (secondTypeRelation) db.operationsTable,
                if (storageTableRefs) db.storageTable,
                if (reservationsTableRefs) db.reservationsTable,
                if (pricesTableRefs) db.pricesTable,
                if (chancesTableRefs) db.chancesTable,
                if (reservationDetailsTableRefs) db.reservationDetailsTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
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
                  if (reservationsTableRefs)
                    await $_getPrefetchedData<PlantTypesTableData,
                            $PlantTypesTableTable, ReservationsTableData>(
                        currentTable: table,
                        referencedTable: $$PlantTypesTableTableReferences
                            ._reservationsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PlantTypesTableTableReferences(db, table, p0)
                                .reservationsTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.plantTypeId == item.id),
                        typedResults: items),
                  if (pricesTableRefs)
                    await $_getPrefetchedData<PlantTypesTableData,
                            $PlantTypesTableTable, PricesTableData>(
                        currentTable: table,
                        referencedTable: $$PlantTypesTableTableReferences
                            ._pricesTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PlantTypesTableTableReferences(db, table, p0)
                                .pricesTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.plantTypeId == item.id),
                        typedResults: items),
                  if (chancesTableRefs)
                    await $_getPrefetchedData<PlantTypesTableData,
                            $PlantTypesTableTable, ChancesTableData>(
                        currentTable: table,
                        referencedTable: $$PlantTypesTableTableReferences
                            ._chancesTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PlantTypesTableTableReferences(db, table, p0)
                                .chancesTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.typeId == item.id),
                        typedResults: items),
                  if (reservationDetailsTableRefs)
                    await $_getPrefetchedData<PlantTypesTableData,
                            $PlantTypesTableTable, ReservationDetailsTableData>(
                        currentTable: table,
                        referencedTable: $$PlantTypesTableTableReferences
                            ._reservationDetailsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PlantTypesTableTableReferences(db, table, p0)
                                .reservationDetailsTableRefs,
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
        {bool firstTypeRelation,
        bool secondTypeRelation,
        bool storageTableRefs,
        bool reservationsTableRefs,
        bool pricesTableRefs,
        bool chancesTableRefs,
        bool reservationDetailsTableRefs})>;
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

  static MultiTypedResultKey<$ReservationsTableTable,
      List<ReservationsTableData>> _reservationsTableRefsTable(
          _$LocalDatabase db) =>
      MultiTypedResultKey.fromTable(db.reservationsTable,
          aliasName: $_aliasNameGenerator(
              db.plantShapesTable.id, db.reservationsTable.plantShapeId));

  $$ReservationsTableTableProcessedTableManager get reservationsTableRefs {
    final manager = $$ReservationsTableTableTableManager(
            $_db, $_db.reservationsTable)
        .filter((f) => f.plantShapeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_reservationsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$PricesTableTable, List<PricesTableData>>
      _pricesTableRefsTable(_$LocalDatabase db) =>
          MultiTypedResultKey.fromTable(db.pricesTable,
              aliasName: $_aliasNameGenerator(
                  db.plantShapesTable.id, db.pricesTable.plantShapeId));

  $$PricesTableTableProcessedTableManager get pricesTableRefs {
    final manager = $$PricesTableTableTableManager($_db, $_db.pricesTable)
        .filter((f) => f.plantShapeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_pricesTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ChancesTableTable, List<ChancesTableData>>
      _chancesTableRefsTable(_$LocalDatabase db) =>
          MultiTypedResultKey.fromTable(db.chancesTable,
              aliasName: $_aliasNameGenerator(
                  db.plantShapesTable.id, db.chancesTable.shapeId));

  $$ChancesTableTableProcessedTableManager get chancesTableRefs {
    final manager = $$ChancesTableTableTableManager($_db, $_db.chancesTable)
        .filter((f) => f.shapeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_chancesTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ReservationDetailsTableTable,
      List<ReservationDetailsTableData>> _reservationDetailsTableRefsTable(
          _$LocalDatabase db) =>
      MultiTypedResultKey.fromTable(db.reservationDetailsTable,
          aliasName: $_aliasNameGenerator(
              db.plantShapesTable.id, db.reservationDetailsTable.shapeId));

  $$ReservationDetailsTableTableProcessedTableManager
      get reservationDetailsTableRefs {
    final manager = $$ReservationDetailsTableTableTableManager(
            $_db, $_db.reservationDetailsTable)
        .filter((f) => f.shapeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_reservationDetailsTableRefsTable($_db));
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

  Expression<bool> reservationsTableRefs(
      Expression<bool> Function($$ReservationsTableTableFilterComposer f) f) {
    final $$ReservationsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.reservationsTable,
        getReferencedColumn: (t) => t.plantShapeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ReservationsTableTableFilterComposer(
              $db: $db,
              $table: $db.reservationsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> pricesTableRefs(
      Expression<bool> Function($$PricesTableTableFilterComposer f) f) {
    final $$PricesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.pricesTable,
        getReferencedColumn: (t) => t.plantShapeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PricesTableTableFilterComposer(
              $db: $db,
              $table: $db.pricesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> chancesTableRefs(
      Expression<bool> Function($$ChancesTableTableFilterComposer f) f) {
    final $$ChancesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.chancesTable,
        getReferencedColumn: (t) => t.shapeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ChancesTableTableFilterComposer(
              $db: $db,
              $table: $db.chancesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> reservationDetailsTableRefs(
      Expression<bool> Function($$ReservationDetailsTableTableFilterComposer f)
          f) {
    final $$ReservationDetailsTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.reservationDetailsTable,
            getReferencedColumn: (t) => t.shapeId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ReservationDetailsTableTableFilterComposer(
                  $db: $db,
                  $table: $db.reservationDetailsTable,
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

  Expression<T> reservationsTableRefs<T extends Object>(
      Expression<T> Function($$ReservationsTableTableAnnotationComposer a) f) {
    final $$ReservationsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.reservationsTable,
            getReferencedColumn: (t) => t.plantShapeId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ReservationsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.reservationsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> pricesTableRefs<T extends Object>(
      Expression<T> Function($$PricesTableTableAnnotationComposer a) f) {
    final $$PricesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.pricesTable,
        getReferencedColumn: (t) => t.plantShapeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PricesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.pricesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> chancesTableRefs<T extends Object>(
      Expression<T> Function($$ChancesTableTableAnnotationComposer a) f) {
    final $$ChancesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.chancesTable,
        getReferencedColumn: (t) => t.shapeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ChancesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.chancesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> reservationDetailsTableRefs<T extends Object>(
      Expression<T> Function($$ReservationDetailsTableTableAnnotationComposer a)
          f) {
    final $$ReservationDetailsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.reservationDetailsTable,
            getReferencedColumn: (t) => t.shapeId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ReservationDetailsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.reservationDetailsTable,
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
        bool reservationsTableRefs,
        bool pricesTableRefs,
        bool chancesTableRefs,
        bool reservationDetailsTableRefs})> {
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
              reservationsTableRefs = false,
              pricesTableRefs = false,
              chancesTableRefs = false,
              reservationDetailsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (firstShapeRelation) db.operationsTable,
                if (secondShapeRelation) db.operationsTable,
                if (storageTableRefs) db.storageTable,
                if (reservationsTableRefs) db.reservationsTable,
                if (pricesTableRefs) db.pricesTable,
                if (chancesTableRefs) db.chancesTable,
                if (reservationDetailsTableRefs) db.reservationDetailsTable
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
                  if (reservationsTableRefs)
                    await $_getPrefetchedData<PlantShapesTableData,
                            $PlantShapesTableTable, ReservationsTableData>(
                        currentTable: table,
                        referencedTable: $$PlantShapesTableTableReferences
                            ._reservationsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PlantShapesTableTableReferences(db, table, p0)
                                .reservationsTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.plantShapeId == item.id),
                        typedResults: items),
                  if (pricesTableRefs)
                    await $_getPrefetchedData<PlantShapesTableData,
                            $PlantShapesTableTable, PricesTableData>(
                        currentTable: table,
                        referencedTable: $$PlantShapesTableTableReferences
                            ._pricesTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PlantShapesTableTableReferences(db, table, p0)
                                .pricesTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.plantShapeId == item.id),
                        typedResults: items),
                  if (chancesTableRefs)
                    await $_getPrefetchedData<PlantShapesTableData,
                            $PlantShapesTableTable, ChancesTableData>(
                        currentTable: table,
                        referencedTable: $$PlantShapesTableTableReferences
                            ._chancesTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PlantShapesTableTableReferences(db, table, p0)
                                .chancesTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.shapeId == item.id),
                        typedResults: items),
                  if (reservationDetailsTableRefs)
                    await $_getPrefetchedData<
                            PlantShapesTableData,
                            $PlantShapesTableTable,
                            ReservationDetailsTableData>(
                        currentTable: table,
                        referencedTable: $$PlantShapesTableTableReferences
                            ._reservationDetailsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PlantShapesTableTableReferences(db, table, p0)
                                .reservationDetailsTableRefs,
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
        bool reservationsTableRefs,
        bool pricesTableRefs,
        bool chancesTableRefs,
        bool reservationDetailsTableRefs})>;
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
  Value<double> cost,
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
  Value<double> cost,
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

  ColumnFilters<double> get cost => $composableBuilder(
      column: $table.cost, builder: (column) => ColumnFilters(column));

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

  ColumnOrderings<double> get cost => $composableBuilder(
      column: $table.cost, builder: (column) => ColumnOrderings(column));

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

  GeneratedColumn<double> get cost =>
      $composableBuilder(column: $table.cost, builder: (column) => column);

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
            Value<double> cost = const Value.absent(),
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
            cost: cost,
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
            Value<double> cost = const Value.absent(),
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
            cost: cost,
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
  Value<bool> isScheduled,
  Value<String?> notes,
});
typedef $$StorageTableTableUpdateCompanionBuilder = StorageTableCompanion
    Function({
  Value<int> id,
  Value<int> plantTypeId,
  Value<int> plantShapeId,
  Value<int> quantity,
  Value<int?> parentOperationId,
  Value<bool> isScheduled,
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

  static MultiTypedResultKey<$StorageReservationTableTable,
      List<StorageReservationTableData>> _storageReservationTableRefsTable(
          _$LocalDatabase db) =>
      MultiTypedResultKey.fromTable(db.storageReservationTable,
          aliasName: $_aliasNameGenerator(
              db.storageTable.id, db.storageReservationTable.storageId));

  $$StorageReservationTableTableProcessedTableManager
      get storageReservationTableRefs {
    final manager = $$StorageReservationTableTableTableManager(
            $_db, $_db.storageReservationTable)
        .filter((f) => f.storageId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_storageReservationTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
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

  ColumnFilters<bool> get isScheduled => $composableBuilder(
      column: $table.isScheduled, builder: (column) => ColumnFilters(column));

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

  Expression<bool> storageReservationTableRefs(
      Expression<bool> Function($$StorageReservationTableTableFilterComposer f)
          f) {
    final $$StorageReservationTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.storageReservationTable,
            getReferencedColumn: (t) => t.storageId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$StorageReservationTableTableFilterComposer(
                  $db: $db,
                  $table: $db.storageReservationTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
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

  ColumnOrderings<bool> get isScheduled => $composableBuilder(
      column: $table.isScheduled, builder: (column) => ColumnOrderings(column));

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

  GeneratedColumn<bool> get isScheduled => $composableBuilder(
      column: $table.isScheduled, builder: (column) => column);

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

  Expression<T> storageReservationTableRefs<T extends Object>(
      Expression<T> Function($$StorageReservationTableTableAnnotationComposer a)
          f) {
    final $$StorageReservationTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.storageReservationTable,
            getReferencedColumn: (t) => t.storageId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$StorageReservationTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.storageReservationTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
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
        {bool plantTypeId,
        bool plantShapeId,
        bool parentOperationId,
        bool storageReservationTableRefs})> {
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
            Value<bool> isScheduled = const Value.absent(),
            Value<String?> notes = const Value.absent(),
          }) =>
              StorageTableCompanion(
            id: id,
            plantTypeId: plantTypeId,
            plantShapeId: plantShapeId,
            quantity: quantity,
            parentOperationId: parentOperationId,
            isScheduled: isScheduled,
            notes: notes,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int plantTypeId,
            required int plantShapeId,
            required int quantity,
            Value<int?> parentOperationId = const Value.absent(),
            Value<bool> isScheduled = const Value.absent(),
            Value<String?> notes = const Value.absent(),
          }) =>
              StorageTableCompanion.insert(
            id: id,
            plantTypeId: plantTypeId,
            plantShapeId: plantShapeId,
            quantity: quantity,
            parentOperationId: parentOperationId,
            isScheduled: isScheduled,
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
              parentOperationId = false,
              storageReservationTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (storageReservationTableRefs) db.storageReservationTable
              ],
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
                return [
                  if (storageReservationTableRefs)
                    await $_getPrefetchedData<StorageTableData,
                            $StorageTableTable, StorageReservationTableData>(
                        currentTable: table,
                        referencedTable: $$StorageTableTableReferences
                            ._storageReservationTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$StorageTableTableReferences(db, table, p0)
                                .storageReservationTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.storageId == item.id),
                        typedResults: items)
                ];
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
        {bool plantTypeId,
        bool plantShapeId,
        bool parentOperationId,
        bool storageReservationTableRefs})>;
typedef $$ReservationsTableTableCreateCompanionBuilder
    = ReservationsTableCompanion Function({
  Value<int> id,
  required String fullName,
  required String phone,
  required DateTime reservationDate,
  Value<DateTime?> deliveryDate,
  required int plantTypeId,
  required int plantShapeId,
  required int quantity,
  Value<double> deposit,
  Value<bool> isFullyPaid,
  Value<bool> isDelivered,
  Value<String?> notes,
});
typedef $$ReservationsTableTableUpdateCompanionBuilder
    = ReservationsTableCompanion Function({
  Value<int> id,
  Value<String> fullName,
  Value<String> phone,
  Value<DateTime> reservationDate,
  Value<DateTime?> deliveryDate,
  Value<int> plantTypeId,
  Value<int> plantShapeId,
  Value<int> quantity,
  Value<double> deposit,
  Value<bool> isFullyPaid,
  Value<bool> isDelivered,
  Value<String?> notes,
});

final class $$ReservationsTableTableReferences extends BaseReferences<
    _$LocalDatabase, $ReservationsTableTable, ReservationsTableData> {
  $$ReservationsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $PlantTypesTableTable _plantTypeIdTable(_$LocalDatabase db) =>
      db.plantTypesTable.createAlias($_aliasNameGenerator(
          db.reservationsTable.plantTypeId, db.plantTypesTable.id));

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
          db.reservationsTable.plantShapeId, db.plantShapesTable.id));

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

  static MultiTypedResultKey<$ReservationDetailsTableTable,
      List<ReservationDetailsTableData>> _reservationDetailsTableRefsTable(
          _$LocalDatabase db) =>
      MultiTypedResultKey.fromTable(db.reservationDetailsTable,
          aliasName: $_aliasNameGenerator(db.reservationsTable.id,
              db.reservationDetailsTable.reservationId));

  $$ReservationDetailsTableTableProcessedTableManager
      get reservationDetailsTableRefs {
    final manager = $$ReservationDetailsTableTableTableManager(
            $_db, $_db.reservationDetailsTable)
        .filter((f) => f.reservationId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_reservationDetailsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$StorageReservationTableTable,
      List<StorageReservationTableData>> _storageReservationTableRefsTable(
          _$LocalDatabase db) =>
      MultiTypedResultKey.fromTable(db.storageReservationTable,
          aliasName: $_aliasNameGenerator(db.reservationsTable.id,
              db.storageReservationTable.reservationId));

  $$StorageReservationTableTableProcessedTableManager
      get storageReservationTableRefs {
    final manager = $$StorageReservationTableTableTableManager(
            $_db, $_db.storageReservationTable)
        .filter((f) => f.reservationId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_storageReservationTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ReservationsTableTableFilterComposer
    extends Composer<_$LocalDatabase, $ReservationsTableTable> {
  $$ReservationsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get reservationDate => $composableBuilder(
      column: $table.reservationDate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deliveryDate => $composableBuilder(
      column: $table.deliveryDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get deposit => $composableBuilder(
      column: $table.deposit, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isFullyPaid => $composableBuilder(
      column: $table.isFullyPaid, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDelivered => $composableBuilder(
      column: $table.isDelivered, builder: (column) => ColumnFilters(column));

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

  Expression<bool> reservationDetailsTableRefs(
      Expression<bool> Function($$ReservationDetailsTableTableFilterComposer f)
          f) {
    final $$ReservationDetailsTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.reservationDetailsTable,
            getReferencedColumn: (t) => t.reservationId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ReservationDetailsTableTableFilterComposer(
                  $db: $db,
                  $table: $db.reservationDetailsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<bool> storageReservationTableRefs(
      Expression<bool> Function($$StorageReservationTableTableFilterComposer f)
          f) {
    final $$StorageReservationTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.storageReservationTable,
            getReferencedColumn: (t) => t.reservationId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$StorageReservationTableTableFilterComposer(
                  $db: $db,
                  $table: $db.storageReservationTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$ReservationsTableTableOrderingComposer
    extends Composer<_$LocalDatabase, $ReservationsTableTable> {
  $$ReservationsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get reservationDate => $composableBuilder(
      column: $table.reservationDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deliveryDate => $composableBuilder(
      column: $table.deliveryDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get deposit => $composableBuilder(
      column: $table.deposit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isFullyPaid => $composableBuilder(
      column: $table.isFullyPaid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDelivered => $composableBuilder(
      column: $table.isDelivered, builder: (column) => ColumnOrderings(column));

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
}

class $$ReservationsTableTableAnnotationComposer
    extends Composer<_$LocalDatabase, $ReservationsTableTable> {
  $$ReservationsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<DateTime> get reservationDate => $composableBuilder(
      column: $table.reservationDate, builder: (column) => column);

  GeneratedColumn<DateTime> get deliveryDate => $composableBuilder(
      column: $table.deliveryDate, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<double> get deposit =>
      $composableBuilder(column: $table.deposit, builder: (column) => column);

  GeneratedColumn<bool> get isFullyPaid => $composableBuilder(
      column: $table.isFullyPaid, builder: (column) => column);

  GeneratedColumn<bool> get isDelivered => $composableBuilder(
      column: $table.isDelivered, builder: (column) => column);

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

  Expression<T> reservationDetailsTableRefs<T extends Object>(
      Expression<T> Function($$ReservationDetailsTableTableAnnotationComposer a)
          f) {
    final $$ReservationDetailsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.reservationDetailsTable,
            getReferencedColumn: (t) => t.reservationId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ReservationDetailsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.reservationDetailsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> storageReservationTableRefs<T extends Object>(
      Expression<T> Function($$StorageReservationTableTableAnnotationComposer a)
          f) {
    final $$StorageReservationTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.storageReservationTable,
            getReferencedColumn: (t) => t.reservationId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$StorageReservationTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.storageReservationTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$ReservationsTableTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $ReservationsTableTable,
    ReservationsTableData,
    $$ReservationsTableTableFilterComposer,
    $$ReservationsTableTableOrderingComposer,
    $$ReservationsTableTableAnnotationComposer,
    $$ReservationsTableTableCreateCompanionBuilder,
    $$ReservationsTableTableUpdateCompanionBuilder,
    (ReservationsTableData, $$ReservationsTableTableReferences),
    ReservationsTableData,
    PrefetchHooks Function(
        {bool plantTypeId,
        bool plantShapeId,
        bool reservationDetailsTableRefs,
        bool storageReservationTableRefs})> {
  $$ReservationsTableTableTableManager(
      _$LocalDatabase db, $ReservationsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReservationsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReservationsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReservationsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> fullName = const Value.absent(),
            Value<String> phone = const Value.absent(),
            Value<DateTime> reservationDate = const Value.absent(),
            Value<DateTime?> deliveryDate = const Value.absent(),
            Value<int> plantTypeId = const Value.absent(),
            Value<int> plantShapeId = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<double> deposit = const Value.absent(),
            Value<bool> isFullyPaid = const Value.absent(),
            Value<bool> isDelivered = const Value.absent(),
            Value<String?> notes = const Value.absent(),
          }) =>
              ReservationsTableCompanion(
            id: id,
            fullName: fullName,
            phone: phone,
            reservationDate: reservationDate,
            deliveryDate: deliveryDate,
            plantTypeId: plantTypeId,
            plantShapeId: plantShapeId,
            quantity: quantity,
            deposit: deposit,
            isFullyPaid: isFullyPaid,
            isDelivered: isDelivered,
            notes: notes,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String fullName,
            required String phone,
            required DateTime reservationDate,
            Value<DateTime?> deliveryDate = const Value.absent(),
            required int plantTypeId,
            required int plantShapeId,
            required int quantity,
            Value<double> deposit = const Value.absent(),
            Value<bool> isFullyPaid = const Value.absent(),
            Value<bool> isDelivered = const Value.absent(),
            Value<String?> notes = const Value.absent(),
          }) =>
              ReservationsTableCompanion.insert(
            id: id,
            fullName: fullName,
            phone: phone,
            reservationDate: reservationDate,
            deliveryDate: deliveryDate,
            plantTypeId: plantTypeId,
            plantShapeId: plantShapeId,
            quantity: quantity,
            deposit: deposit,
            isFullyPaid: isFullyPaid,
            isDelivered: isDelivered,
            notes: notes,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ReservationsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {plantTypeId = false,
              plantShapeId = false,
              reservationDetailsTableRefs = false,
              storageReservationTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (reservationDetailsTableRefs) db.reservationDetailsTable,
                if (storageReservationTableRefs) db.storageReservationTable
              ],
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
                    referencedTable: $$ReservationsTableTableReferences
                        ._plantTypeIdTable(db),
                    referencedColumn: $$ReservationsTableTableReferences
                        ._plantTypeIdTable(db)
                        .id,
                  ) as T;
                }
                if (plantShapeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.plantShapeId,
                    referencedTable: $$ReservationsTableTableReferences
                        ._plantShapeIdTable(db),
                    referencedColumn: $$ReservationsTableTableReferences
                        ._plantShapeIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (reservationDetailsTableRefs)
                    await $_getPrefetchedData<
                            ReservationsTableData,
                            $ReservationsTableTable,
                            ReservationDetailsTableData>(
                        currentTable: table,
                        referencedTable: $$ReservationsTableTableReferences
                            ._reservationDetailsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ReservationsTableTableReferences(db, table, p0)
                                .reservationDetailsTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.reservationId == item.id),
                        typedResults: items),
                  if (storageReservationTableRefs)
                    await $_getPrefetchedData<
                            ReservationsTableData,
                            $ReservationsTableTable,
                            StorageReservationTableData>(
                        currentTable: table,
                        referencedTable: $$ReservationsTableTableReferences
                            ._storageReservationTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ReservationsTableTableReferences(db, table, p0)
                                .storageReservationTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.reservationId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ReservationsTableTableProcessedTableManager = ProcessedTableManager<
    _$LocalDatabase,
    $ReservationsTableTable,
    ReservationsTableData,
    $$ReservationsTableTableFilterComposer,
    $$ReservationsTableTableOrderingComposer,
    $$ReservationsTableTableAnnotationComposer,
    $$ReservationsTableTableCreateCompanionBuilder,
    $$ReservationsTableTableUpdateCompanionBuilder,
    (ReservationsTableData, $$ReservationsTableTableReferences),
    ReservationsTableData,
    PrefetchHooks Function(
        {bool plantTypeId,
        bool plantShapeId,
        bool reservationDetailsTableRefs,
        bool storageReservationTableRefs})>;
typedef $$PricesTableTableCreateCompanionBuilder = PricesTableCompanion
    Function({
  Value<int> id,
  required int plantTypeId,
  required int plantShapeId,
  required double price,
});
typedef $$PricesTableTableUpdateCompanionBuilder = PricesTableCompanion
    Function({
  Value<int> id,
  Value<int> plantTypeId,
  Value<int> plantShapeId,
  Value<double> price,
});

final class $$PricesTableTableReferences extends BaseReferences<_$LocalDatabase,
    $PricesTableTable, PricesTableData> {
  $$PricesTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PlantTypesTableTable _plantTypeIdTable(_$LocalDatabase db) =>
      db.plantTypesTable.createAlias($_aliasNameGenerator(
          db.pricesTable.plantTypeId, db.plantTypesTable.id));

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
          db.pricesTable.plantShapeId, db.plantShapesTable.id));

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
}

class $$PricesTableTableFilterComposer
    extends Composer<_$LocalDatabase, $PricesTableTable> {
  $$PricesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnFilters(column));

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
}

class $$PricesTableTableOrderingComposer
    extends Composer<_$LocalDatabase, $PricesTableTable> {
  $$PricesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnOrderings(column));

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
}

class $$PricesTableTableAnnotationComposer
    extends Composer<_$LocalDatabase, $PricesTableTable> {
  $$PricesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

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
}

class $$PricesTableTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $PricesTableTable,
    PricesTableData,
    $$PricesTableTableFilterComposer,
    $$PricesTableTableOrderingComposer,
    $$PricesTableTableAnnotationComposer,
    $$PricesTableTableCreateCompanionBuilder,
    $$PricesTableTableUpdateCompanionBuilder,
    (PricesTableData, $$PricesTableTableReferences),
    PricesTableData,
    PrefetchHooks Function({bool plantTypeId, bool plantShapeId})> {
  $$PricesTableTableTableManager(_$LocalDatabase db, $PricesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PricesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PricesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PricesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> plantTypeId = const Value.absent(),
            Value<int> plantShapeId = const Value.absent(),
            Value<double> price = const Value.absent(),
          }) =>
              PricesTableCompanion(
            id: id,
            plantTypeId: plantTypeId,
            plantShapeId: plantShapeId,
            price: price,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int plantTypeId,
            required int plantShapeId,
            required double price,
          }) =>
              PricesTableCompanion.insert(
            id: id,
            plantTypeId: plantTypeId,
            plantShapeId: plantShapeId,
            price: price,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$PricesTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({plantTypeId = false, plantShapeId = false}) {
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
                        $$PricesTableTableReferences._plantTypeIdTable(db),
                    referencedColumn:
                        $$PricesTableTableReferences._plantTypeIdTable(db).id,
                  ) as T;
                }
                if (plantShapeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.plantShapeId,
                    referencedTable:
                        $$PricesTableTableReferences._plantShapeIdTable(db),
                    referencedColumn:
                        $$PricesTableTableReferences._plantShapeIdTable(db).id,
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

typedef $$PricesTableTableProcessedTableManager = ProcessedTableManager<
    _$LocalDatabase,
    $PricesTableTable,
    PricesTableData,
    $$PricesTableTableFilterComposer,
    $$PricesTableTableOrderingComposer,
    $$PricesTableTableAnnotationComposer,
    $$PricesTableTableCreateCompanionBuilder,
    $$PricesTableTableUpdateCompanionBuilder,
    (PricesTableData, $$PricesTableTableReferences),
    PricesTableData,
    PrefetchHooks Function({bool plantTypeId, bool plantShapeId})>;
typedef $$ChancesTableTableCreateCompanionBuilder = ChancesTableCompanion
    Function({
  Value<int> id,
  required double successRate,
  required int shapeId,
  required int typeId,
  required int quantity,
  required DateTime maturityDate,
});
typedef $$ChancesTableTableUpdateCompanionBuilder = ChancesTableCompanion
    Function({
  Value<int> id,
  Value<double> successRate,
  Value<int> shapeId,
  Value<int> typeId,
  Value<int> quantity,
  Value<DateTime> maturityDate,
});

final class $$ChancesTableTableReferences extends BaseReferences<
    _$LocalDatabase, $ChancesTableTable, ChancesTableData> {
  $$ChancesTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PlantShapesTableTable _shapeIdTable(_$LocalDatabase db) =>
      db.plantShapesTable.createAlias($_aliasNameGenerator(
          db.chancesTable.shapeId, db.plantShapesTable.id));

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

  static $PlantTypesTableTable _typeIdTable(_$LocalDatabase db) =>
      db.plantTypesTable.createAlias(
          $_aliasNameGenerator(db.chancesTable.typeId, db.plantTypesTable.id));

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

  static MultiTypedResultKey<$ParentChildChancesTableTable,
      List<ParentChildChancesTableData>> _parentChanceTable(
          _$LocalDatabase db) =>
      MultiTypedResultKey.fromTable(db.parentChildChancesTable,
          aliasName: $_aliasNameGenerator(
              db.chancesTable.id, db.parentChildChancesTable.parentId));

  $$ParentChildChancesTableTableProcessedTableManager get parentChance {
    final manager = $$ParentChildChancesTableTableTableManager(
            $_db, $_db.parentChildChancesTable)
        .filter((f) => f.parentId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_parentChanceTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ParentChildChancesTableTable,
      List<ParentChildChancesTableData>> _childChanceTable(
          _$LocalDatabase db) =>
      MultiTypedResultKey.fromTable(db.parentChildChancesTable,
          aliasName: $_aliasNameGenerator(
              db.chancesTable.id, db.parentChildChancesTable.childId));

  $$ParentChildChancesTableTableProcessedTableManager get childChance {
    final manager = $$ParentChildChancesTableTableTableManager(
            $_db, $_db.parentChildChancesTable)
        .filter((f) => f.childId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_childChanceTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ChancesTableTableFilterComposer
    extends Composer<_$LocalDatabase, $ChancesTableTable> {
  $$ChancesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get successRate => $composableBuilder(
      column: $table.successRate, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get maturityDate => $composableBuilder(
      column: $table.maturityDate, builder: (column) => ColumnFilters(column));

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

  Expression<bool> parentChance(
      Expression<bool> Function($$ParentChildChancesTableTableFilterComposer f)
          f) {
    final $$ParentChildChancesTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.parentChildChancesTable,
            getReferencedColumn: (t) => t.parentId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ParentChildChancesTableTableFilterComposer(
                  $db: $db,
                  $table: $db.parentChildChancesTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<bool> childChance(
      Expression<bool> Function($$ParentChildChancesTableTableFilterComposer f)
          f) {
    final $$ParentChildChancesTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.parentChildChancesTable,
            getReferencedColumn: (t) => t.childId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ParentChildChancesTableTableFilterComposer(
                  $db: $db,
                  $table: $db.parentChildChancesTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$ChancesTableTableOrderingComposer
    extends Composer<_$LocalDatabase, $ChancesTableTable> {
  $$ChancesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get successRate => $composableBuilder(
      column: $table.successRate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get maturityDate => $composableBuilder(
      column: $table.maturityDate,
      builder: (column) => ColumnOrderings(column));

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

class $$ChancesTableTableAnnotationComposer
    extends Composer<_$LocalDatabase, $ChancesTableTable> {
  $$ChancesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get successRate => $composableBuilder(
      column: $table.successRate, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<DateTime> get maturityDate => $composableBuilder(
      column: $table.maturityDate, builder: (column) => column);

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

  Expression<T> parentChance<T extends Object>(
      Expression<T> Function($$ParentChildChancesTableTableAnnotationComposer a)
          f) {
    final $$ParentChildChancesTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.parentChildChancesTable,
            getReferencedColumn: (t) => t.parentId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ParentChildChancesTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.parentChildChancesTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> childChance<T extends Object>(
      Expression<T> Function($$ParentChildChancesTableTableAnnotationComposer a)
          f) {
    final $$ParentChildChancesTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.parentChildChancesTable,
            getReferencedColumn: (t) => t.childId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ParentChildChancesTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.parentChildChancesTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$ChancesTableTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $ChancesTableTable,
    ChancesTableData,
    $$ChancesTableTableFilterComposer,
    $$ChancesTableTableOrderingComposer,
    $$ChancesTableTableAnnotationComposer,
    $$ChancesTableTableCreateCompanionBuilder,
    $$ChancesTableTableUpdateCompanionBuilder,
    (ChancesTableData, $$ChancesTableTableReferences),
    ChancesTableData,
    PrefetchHooks Function(
        {bool shapeId, bool typeId, bool parentChance, bool childChance})> {
  $$ChancesTableTableTableManager(_$LocalDatabase db, $ChancesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChancesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChancesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChancesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<double> successRate = const Value.absent(),
            Value<int> shapeId = const Value.absent(),
            Value<int> typeId = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<DateTime> maturityDate = const Value.absent(),
          }) =>
              ChancesTableCompanion(
            id: id,
            successRate: successRate,
            shapeId: shapeId,
            typeId: typeId,
            quantity: quantity,
            maturityDate: maturityDate,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required double successRate,
            required int shapeId,
            required int typeId,
            required int quantity,
            required DateTime maturityDate,
          }) =>
              ChancesTableCompanion.insert(
            id: id,
            successRate: successRate,
            shapeId: shapeId,
            typeId: typeId,
            quantity: quantity,
            maturityDate: maturityDate,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ChancesTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {shapeId = false,
              typeId = false,
              parentChance = false,
              childChance = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (parentChance) db.parentChildChancesTable,
                if (childChance) db.parentChildChancesTable
              ],
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
                if (shapeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.shapeId,
                    referencedTable:
                        $$ChancesTableTableReferences._shapeIdTable(db),
                    referencedColumn:
                        $$ChancesTableTableReferences._shapeIdTable(db).id,
                  ) as T;
                }
                if (typeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.typeId,
                    referencedTable:
                        $$ChancesTableTableReferences._typeIdTable(db),
                    referencedColumn:
                        $$ChancesTableTableReferences._typeIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (parentChance)
                    await $_getPrefetchedData<ChancesTableData,
                            $ChancesTableTable, ParentChildChancesTableData>(
                        currentTable: table,
                        referencedTable: $$ChancesTableTableReferences
                            ._parentChanceTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ChancesTableTableReferences(db, table, p0)
                                .parentChance,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.parentId == item.id),
                        typedResults: items),
                  if (childChance)
                    await $_getPrefetchedData<ChancesTableData,
                            $ChancesTableTable, ParentChildChancesTableData>(
                        currentTable: table,
                        referencedTable:
                            $$ChancesTableTableReferences._childChanceTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ChancesTableTableReferences(db, table, p0)
                                .childChance,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.childId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ChancesTableTableProcessedTableManager = ProcessedTableManager<
    _$LocalDatabase,
    $ChancesTableTable,
    ChancesTableData,
    $$ChancesTableTableFilterComposer,
    $$ChancesTableTableOrderingComposer,
    $$ChancesTableTableAnnotationComposer,
    $$ChancesTableTableCreateCompanionBuilder,
    $$ChancesTableTableUpdateCompanionBuilder,
    (ChancesTableData, $$ChancesTableTableReferences),
    ChancesTableData,
    PrefetchHooks Function(
        {bool shapeId, bool typeId, bool parentChance, bool childChance})>;
typedef $$ParentChildChancesTableTableCreateCompanionBuilder
    = ParentChildChancesTableCompanion Function({
  required int parentId,
  required int childId,
  Value<int> rowid,
});
typedef $$ParentChildChancesTableTableUpdateCompanionBuilder
    = ParentChildChancesTableCompanion Function({
  Value<int> parentId,
  Value<int> childId,
  Value<int> rowid,
});

final class $$ParentChildChancesTableTableReferences extends BaseReferences<
    _$LocalDatabase,
    $ParentChildChancesTableTable,
    ParentChildChancesTableData> {
  $$ParentChildChancesTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $ChancesTableTable _parentIdTable(_$LocalDatabase db) =>
      db.chancesTable.createAlias($_aliasNameGenerator(
          db.parentChildChancesTable.parentId, db.chancesTable.id));

  $$ChancesTableTableProcessedTableManager get parentId {
    final $_column = $_itemColumn<int>('parent_id')!;

    final manager = $$ChancesTableTableTableManager($_db, $_db.chancesTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_parentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $ChancesTableTable _childIdTable(_$LocalDatabase db) =>
      db.chancesTable.createAlias($_aliasNameGenerator(
          db.parentChildChancesTable.childId, db.chancesTable.id));

  $$ChancesTableTableProcessedTableManager get childId {
    final $_column = $_itemColumn<int>('child_id')!;

    final manager = $$ChancesTableTableTableManager($_db, $_db.chancesTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_childIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ParentChildChancesTableTableFilterComposer
    extends Composer<_$LocalDatabase, $ParentChildChancesTableTable> {
  $$ParentChildChancesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ChancesTableTableFilterComposer get parentId {
    final $$ChancesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parentId,
        referencedTable: $db.chancesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ChancesTableTableFilterComposer(
              $db: $db,
              $table: $db.chancesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ChancesTableTableFilterComposer get childId {
    final $$ChancesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.childId,
        referencedTable: $db.chancesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ChancesTableTableFilterComposer(
              $db: $db,
              $table: $db.chancesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ParentChildChancesTableTableOrderingComposer
    extends Composer<_$LocalDatabase, $ParentChildChancesTableTable> {
  $$ParentChildChancesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ChancesTableTableOrderingComposer get parentId {
    final $$ChancesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parentId,
        referencedTable: $db.chancesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ChancesTableTableOrderingComposer(
              $db: $db,
              $table: $db.chancesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ChancesTableTableOrderingComposer get childId {
    final $$ChancesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.childId,
        referencedTable: $db.chancesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ChancesTableTableOrderingComposer(
              $db: $db,
              $table: $db.chancesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ParentChildChancesTableTableAnnotationComposer
    extends Composer<_$LocalDatabase, $ParentChildChancesTableTable> {
  $$ParentChildChancesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ChancesTableTableAnnotationComposer get parentId {
    final $$ChancesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parentId,
        referencedTable: $db.chancesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ChancesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.chancesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ChancesTableTableAnnotationComposer get childId {
    final $$ChancesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.childId,
        referencedTable: $db.chancesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ChancesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.chancesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ParentChildChancesTableTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $ParentChildChancesTableTable,
    ParentChildChancesTableData,
    $$ParentChildChancesTableTableFilterComposer,
    $$ParentChildChancesTableTableOrderingComposer,
    $$ParentChildChancesTableTableAnnotationComposer,
    $$ParentChildChancesTableTableCreateCompanionBuilder,
    $$ParentChildChancesTableTableUpdateCompanionBuilder,
    (ParentChildChancesTableData, $$ParentChildChancesTableTableReferences),
    ParentChildChancesTableData,
    PrefetchHooks Function({bool parentId, bool childId})> {
  $$ParentChildChancesTableTableTableManager(
      _$LocalDatabase db, $ParentChildChancesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ParentChildChancesTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$ParentChildChancesTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ParentChildChancesTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> parentId = const Value.absent(),
            Value<int> childId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ParentChildChancesTableCompanion(
            parentId: parentId,
            childId: childId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int parentId,
            required int childId,
            Value<int> rowid = const Value.absent(),
          }) =>
              ParentChildChancesTableCompanion.insert(
            parentId: parentId,
            childId: childId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ParentChildChancesTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({parentId = false, childId = false}) {
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
                if (parentId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.parentId,
                    referencedTable: $$ParentChildChancesTableTableReferences
                        ._parentIdTable(db),
                    referencedColumn: $$ParentChildChancesTableTableReferences
                        ._parentIdTable(db)
                        .id,
                  ) as T;
                }
                if (childId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.childId,
                    referencedTable: $$ParentChildChancesTableTableReferences
                        ._childIdTable(db),
                    referencedColumn: $$ParentChildChancesTableTableReferences
                        ._childIdTable(db)
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

typedef $$ParentChildChancesTableTableProcessedTableManager
    = ProcessedTableManager<
        _$LocalDatabase,
        $ParentChildChancesTableTable,
        ParentChildChancesTableData,
        $$ParentChildChancesTableTableFilterComposer,
        $$ParentChildChancesTableTableOrderingComposer,
        $$ParentChildChancesTableTableAnnotationComposer,
        $$ParentChildChancesTableTableCreateCompanionBuilder,
        $$ParentChildChancesTableTableUpdateCompanionBuilder,
        (ParentChildChancesTableData, $$ParentChildChancesTableTableReferences),
        ParentChildChancesTableData,
        PrefetchHooks Function({bool parentId, bool childId})>;
typedef $$ReservationDetailsTableTableCreateCompanionBuilder
    = ReservationDetailsTableCompanion Function({
  Value<int> id,
  required int reservationId,
  required int shapeId,
  required int typeId,
  required int quantity,
  Value<ReservationStatus> status,
});
typedef $$ReservationDetailsTableTableUpdateCompanionBuilder
    = ReservationDetailsTableCompanion Function({
  Value<int> id,
  Value<int> reservationId,
  Value<int> shapeId,
  Value<int> typeId,
  Value<int> quantity,
  Value<ReservationStatus> status,
});

final class $$ReservationDetailsTableTableReferences extends BaseReferences<
    _$LocalDatabase,
    $ReservationDetailsTableTable,
    ReservationDetailsTableData> {
  $$ReservationDetailsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $ReservationsTableTable _reservationIdTable(_$LocalDatabase db) =>
      db.reservationsTable.createAlias($_aliasNameGenerator(
          db.reservationDetailsTable.reservationId, db.reservationsTable.id));

  $$ReservationsTableTableProcessedTableManager get reservationId {
    final $_column = $_itemColumn<int>('reservation_id')!;

    final manager =
        $$ReservationsTableTableTableManager($_db, $_db.reservationsTable)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_reservationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $PlantShapesTableTable _shapeIdTable(_$LocalDatabase db) =>
      db.plantShapesTable.createAlias($_aliasNameGenerator(
          db.reservationDetailsTable.shapeId, db.plantShapesTable.id));

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

  static $PlantTypesTableTable _typeIdTable(_$LocalDatabase db) =>
      db.plantTypesTable.createAlias($_aliasNameGenerator(
          db.reservationDetailsTable.typeId, db.plantTypesTable.id));

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

class $$ReservationDetailsTableTableFilterComposer
    extends Composer<_$LocalDatabase, $ReservationDetailsTableTable> {
  $$ReservationDetailsTableTableFilterComposer({
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

  ColumnWithTypeConverterFilters<ReservationStatus, ReservationStatus, int>
      get status => $composableBuilder(
          column: $table.status,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  $$ReservationsTableTableFilterComposer get reservationId {
    final $$ReservationsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.reservationId,
        referencedTable: $db.reservationsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ReservationsTableTableFilterComposer(
              $db: $db,
              $table: $db.reservationsTable,
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

class $$ReservationDetailsTableTableOrderingComposer
    extends Composer<_$LocalDatabase, $ReservationDetailsTableTable> {
  $$ReservationDetailsTableTableOrderingComposer({
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

  ColumnOrderings<int> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  $$ReservationsTableTableOrderingComposer get reservationId {
    final $$ReservationsTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.reservationId,
        referencedTable: $db.reservationsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ReservationsTableTableOrderingComposer(
              $db: $db,
              $table: $db.reservationsTable,
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

class $$ReservationDetailsTableTableAnnotationComposer
    extends Composer<_$LocalDatabase, $ReservationDetailsTableTable> {
  $$ReservationDetailsTableTableAnnotationComposer({
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

  GeneratedColumnWithTypeConverter<ReservationStatus, int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  $$ReservationsTableTableAnnotationComposer get reservationId {
    final $$ReservationsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.reservationId,
            referencedTable: $db.reservationsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ReservationsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.reservationsTable,
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

class $$ReservationDetailsTableTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $ReservationDetailsTableTable,
    ReservationDetailsTableData,
    $$ReservationDetailsTableTableFilterComposer,
    $$ReservationDetailsTableTableOrderingComposer,
    $$ReservationDetailsTableTableAnnotationComposer,
    $$ReservationDetailsTableTableCreateCompanionBuilder,
    $$ReservationDetailsTableTableUpdateCompanionBuilder,
    (ReservationDetailsTableData, $$ReservationDetailsTableTableReferences),
    ReservationDetailsTableData,
    PrefetchHooks Function({bool reservationId, bool shapeId, bool typeId})> {
  $$ReservationDetailsTableTableTableManager(
      _$LocalDatabase db, $ReservationDetailsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReservationDetailsTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$ReservationDetailsTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReservationDetailsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> reservationId = const Value.absent(),
            Value<int> shapeId = const Value.absent(),
            Value<int> typeId = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<ReservationStatus> status = const Value.absent(),
          }) =>
              ReservationDetailsTableCompanion(
            id: id,
            reservationId: reservationId,
            shapeId: shapeId,
            typeId: typeId,
            quantity: quantity,
            status: status,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int reservationId,
            required int shapeId,
            required int typeId,
            required int quantity,
            Value<ReservationStatus> status = const Value.absent(),
          }) =>
              ReservationDetailsTableCompanion.insert(
            id: id,
            reservationId: reservationId,
            shapeId: shapeId,
            typeId: typeId,
            quantity: quantity,
            status: status,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ReservationDetailsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {reservationId = false, shapeId = false, typeId = false}) {
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
                if (reservationId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.reservationId,
                    referencedTable: $$ReservationDetailsTableTableReferences
                        ._reservationIdTable(db),
                    referencedColumn: $$ReservationDetailsTableTableReferences
                        ._reservationIdTable(db)
                        .id,
                  ) as T;
                }
                if (shapeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.shapeId,
                    referencedTable: $$ReservationDetailsTableTableReferences
                        ._shapeIdTable(db),
                    referencedColumn: $$ReservationDetailsTableTableReferences
                        ._shapeIdTable(db)
                        .id,
                  ) as T;
                }
                if (typeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.typeId,
                    referencedTable: $$ReservationDetailsTableTableReferences
                        ._typeIdTable(db),
                    referencedColumn: $$ReservationDetailsTableTableReferences
                        ._typeIdTable(db)
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

typedef $$ReservationDetailsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$LocalDatabase,
        $ReservationDetailsTableTable,
        ReservationDetailsTableData,
        $$ReservationDetailsTableTableFilterComposer,
        $$ReservationDetailsTableTableOrderingComposer,
        $$ReservationDetailsTableTableAnnotationComposer,
        $$ReservationDetailsTableTableCreateCompanionBuilder,
        $$ReservationDetailsTableTableUpdateCompanionBuilder,
        (ReservationDetailsTableData, $$ReservationDetailsTableTableReferences),
        ReservationDetailsTableData,
        PrefetchHooks Function(
            {bool reservationId, bool shapeId, bool typeId})>;
typedef $$StorageReservationTableTableCreateCompanionBuilder
    = StorageReservationTableCompanion Function({
  required int storageId,
  required int reservationId,
  required int quantity,
  Value<int> rowid,
});
typedef $$StorageReservationTableTableUpdateCompanionBuilder
    = StorageReservationTableCompanion Function({
  Value<int> storageId,
  Value<int> reservationId,
  Value<int> quantity,
  Value<int> rowid,
});

final class $$StorageReservationTableTableReferences extends BaseReferences<
    _$LocalDatabase,
    $StorageReservationTableTable,
    StorageReservationTableData> {
  $$StorageReservationTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $StorageTableTable _storageIdTable(_$LocalDatabase db) =>
      db.storageTable.createAlias($_aliasNameGenerator(
          db.storageReservationTable.storageId, db.storageTable.id));

  $$StorageTableTableProcessedTableManager get storageId {
    final $_column = $_itemColumn<int>('storage_id')!;

    final manager = $$StorageTableTableTableManager($_db, $_db.storageTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_storageIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $ReservationsTableTable _reservationIdTable(_$LocalDatabase db) =>
      db.reservationsTable.createAlias($_aliasNameGenerator(
          db.storageReservationTable.reservationId, db.reservationsTable.id));

  $$ReservationsTableTableProcessedTableManager get reservationId {
    final $_column = $_itemColumn<int>('reservation_id')!;

    final manager =
        $$ReservationsTableTableTableManager($_db, $_db.reservationsTable)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_reservationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$StorageReservationTableTableFilterComposer
    extends Composer<_$LocalDatabase, $StorageReservationTableTable> {
  $$StorageReservationTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  $$StorageTableTableFilterComposer get storageId {
    final $$StorageTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.storageId,
        referencedTable: $db.storageTable,
        getReferencedColumn: (t) => t.id,
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
    return composer;
  }

  $$ReservationsTableTableFilterComposer get reservationId {
    final $$ReservationsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.reservationId,
        referencedTable: $db.reservationsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ReservationsTableTableFilterComposer(
              $db: $db,
              $table: $db.reservationsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$StorageReservationTableTableOrderingComposer
    extends Composer<_$LocalDatabase, $StorageReservationTableTable> {
  $$StorageReservationTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  $$StorageTableTableOrderingComposer get storageId {
    final $$StorageTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.storageId,
        referencedTable: $db.storageTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StorageTableTableOrderingComposer(
              $db: $db,
              $table: $db.storageTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ReservationsTableTableOrderingComposer get reservationId {
    final $$ReservationsTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.reservationId,
        referencedTable: $db.reservationsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ReservationsTableTableOrderingComposer(
              $db: $db,
              $table: $db.reservationsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$StorageReservationTableTableAnnotationComposer
    extends Composer<_$LocalDatabase, $StorageReservationTableTable> {
  $$StorageReservationTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  $$StorageTableTableAnnotationComposer get storageId {
    final $$StorageTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.storageId,
        referencedTable: $db.storageTable,
        getReferencedColumn: (t) => t.id,
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
    return composer;
  }

  $$ReservationsTableTableAnnotationComposer get reservationId {
    final $$ReservationsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.reservationId,
            referencedTable: $db.reservationsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ReservationsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.reservationsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$StorageReservationTableTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $StorageReservationTableTable,
    StorageReservationTableData,
    $$StorageReservationTableTableFilterComposer,
    $$StorageReservationTableTableOrderingComposer,
    $$StorageReservationTableTableAnnotationComposer,
    $$StorageReservationTableTableCreateCompanionBuilder,
    $$StorageReservationTableTableUpdateCompanionBuilder,
    (StorageReservationTableData, $$StorageReservationTableTableReferences),
    StorageReservationTableData,
    PrefetchHooks Function({bool storageId, bool reservationId})> {
  $$StorageReservationTableTableTableManager(
      _$LocalDatabase db, $StorageReservationTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StorageReservationTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$StorageReservationTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StorageReservationTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> storageId = const Value.absent(),
            Value<int> reservationId = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              StorageReservationTableCompanion(
            storageId: storageId,
            reservationId: reservationId,
            quantity: quantity,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int storageId,
            required int reservationId,
            required int quantity,
            Value<int> rowid = const Value.absent(),
          }) =>
              StorageReservationTableCompanion.insert(
            storageId: storageId,
            reservationId: reservationId,
            quantity: quantity,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$StorageReservationTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({storageId = false, reservationId = false}) {
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
                if (storageId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.storageId,
                    referencedTable: $$StorageReservationTableTableReferences
                        ._storageIdTable(db),
                    referencedColumn: $$StorageReservationTableTableReferences
                        ._storageIdTable(db)
                        .id,
                  ) as T;
                }
                if (reservationId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.reservationId,
                    referencedTable: $$StorageReservationTableTableReferences
                        ._reservationIdTable(db),
                    referencedColumn: $$StorageReservationTableTableReferences
                        ._reservationIdTable(db)
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

typedef $$StorageReservationTableTableProcessedTableManager
    = ProcessedTableManager<
        _$LocalDatabase,
        $StorageReservationTableTable,
        StorageReservationTableData,
        $$StorageReservationTableTableFilterComposer,
        $$StorageReservationTableTableOrderingComposer,
        $$StorageReservationTableTableAnnotationComposer,
        $$StorageReservationTableTableCreateCompanionBuilder,
        $$StorageReservationTableTableUpdateCompanionBuilder,
        (StorageReservationTableData, $$StorageReservationTableTableReferences),
        StorageReservationTableData,
        PrefetchHooks Function({bool storageId, bool reservationId})>;

class $LocalDatabaseManager {
  final _$LocalDatabase _db;
  $LocalDatabaseManager(this._db);
  $$SetupExpenseTableTableTableManager get setupExpenseTable =>
      $$SetupExpenseTableTableTableManager(_db, _db.setupExpenseTable);
  $$PlantTypesTableTableTableManager get plantTypesTable =>
      $$PlantTypesTableTableTableManager(_db, _db.plantTypesTable);
  $$PlantShapesTableTableTableManager get plantShapesTable =>
      $$PlantShapesTableTableTableManager(_db, _db.plantShapesTable);
  $$OperationTypesTableTableTableManager get operationTypesTable =>
      $$OperationTypesTableTableTableManager(_db, _db.operationTypesTable);
  $$OperationsTableTableTableManager get operationsTable =>
      $$OperationsTableTableTableManager(_db, _db.operationsTable);
  $$StorageTableTableTableManager get storageTable =>
      $$StorageTableTableTableManager(_db, _db.storageTable);
  $$ReservationsTableTableTableManager get reservationsTable =>
      $$ReservationsTableTableTableManager(_db, _db.reservationsTable);
  $$PricesTableTableTableManager get pricesTable =>
      $$PricesTableTableTableManager(_db, _db.pricesTable);
  $$ChancesTableTableTableManager get chancesTable =>
      $$ChancesTableTableTableManager(_db, _db.chancesTable);
  $$ParentChildChancesTableTableTableManager get parentChildChancesTable =>
      $$ParentChildChancesTableTableTableManager(
          _db, _db.parentChildChancesTable);
  $$ReservationDetailsTableTableTableManager get reservationDetailsTable =>
      $$ReservationDetailsTableTableTableManager(
          _db, _db.reservationDetailsTable);
  $$StorageReservationTableTableTableManager get storageReservationTable =>
      $$StorageReservationTableTableTableManager(
          _db, _db.storageReservationTable);
}
