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

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(e);
  $LocalDatabaseManager get managers => $LocalDatabaseManager(this);
  late final $SetupExpenseTableTable setupExpenseTable =
      $SetupExpenseTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [setupExpenseTable];
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

class $LocalDatabaseManager {
  final _$LocalDatabase _db;
  $LocalDatabaseManager(this._db);
  $$SetupExpenseTableTableTableManager get setupExpenseTable =>
      $$SetupExpenseTableTableTableManager(_db, _db.setupExpenseTable);
}
