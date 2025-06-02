// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExpenseDto {
  String get globalId;
  String get syncStatus;
  String get categoryType;
  String get expenseType;
  String? get materialName;
  double get cost;
  DateTime get date;
  DateTime get updatedAt;

  /// Create a copy of ExpenseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExpenseDtoCopyWith<ExpenseDto> get copyWith =>
      _$ExpenseDtoCopyWithImpl<ExpenseDto>(this as ExpenseDto, _$identity);

  /// Serializes this ExpenseDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExpenseDto &&
            (identical(other.globalId, globalId) ||
                other.globalId == globalId) &&
            (identical(other.syncStatus, syncStatus) ||
                other.syncStatus == syncStatus) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.expenseType, expenseType) ||
                other.expenseType == expenseType) &&
            (identical(other.materialName, materialName) ||
                other.materialName == materialName) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, globalId, syncStatus,
      categoryType, expenseType, materialName, cost, date, updatedAt);

  @override
  String toString() {
    return 'ExpenseDto(globalId: $globalId, syncStatus: $syncStatus, categoryType: $categoryType, expenseType: $expenseType, materialName: $materialName, cost: $cost, date: $date, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $ExpenseDtoCopyWith<$Res> {
  factory $ExpenseDtoCopyWith(
          ExpenseDto value, $Res Function(ExpenseDto) _then) =
      _$ExpenseDtoCopyWithImpl;
  @useResult
  $Res call(
      {String globalId,
      String syncStatus,
      String categoryType,
      String expenseType,
      String? materialName,
      double cost,
      DateTime date,
      DateTime updatedAt});
}

/// @nodoc
class _$ExpenseDtoCopyWithImpl<$Res> implements $ExpenseDtoCopyWith<$Res> {
  _$ExpenseDtoCopyWithImpl(this._self, this._then);

  final ExpenseDto _self;
  final $Res Function(ExpenseDto) _then;

  /// Create a copy of ExpenseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? globalId = null,
    Object? syncStatus = null,
    Object? categoryType = null,
    Object? expenseType = null,
    Object? materialName = freezed,
    Object? cost = null,
    Object? date = null,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      globalId: null == globalId
          ? _self.globalId
          : globalId // ignore: cast_nullable_to_non_nullable
              as String,
      syncStatus: null == syncStatus
          ? _self.syncStatus
          : syncStatus // ignore: cast_nullable_to_non_nullable
              as String,
      categoryType: null == categoryType
          ? _self.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as String,
      expenseType: null == expenseType
          ? _self.expenseType
          : expenseType // ignore: cast_nullable_to_non_nullable
              as String,
      materialName: freezed == materialName
          ? _self.materialName
          : materialName // ignore: cast_nullable_to_non_nullable
              as String?,
      cost: null == cost
          ? _self.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ExpenseDto implements ExpenseDto {
  _ExpenseDto(
      {required this.globalId,
      required this.syncStatus,
      required this.categoryType,
      required this.expenseType,
      required this.materialName,
      required this.cost,
      required this.date,
      required this.updatedAt});
  factory _ExpenseDto.fromJson(Map<String, dynamic> json) =>
      _$ExpenseDtoFromJson(json);

  @override
  final String globalId;
  @override
  final String syncStatus;
  @override
  final String categoryType;
  @override
  final String expenseType;
  @override
  final String? materialName;
  @override
  final double cost;
  @override
  final DateTime date;
  @override
  final DateTime updatedAt;

  /// Create a copy of ExpenseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ExpenseDtoCopyWith<_ExpenseDto> get copyWith =>
      __$ExpenseDtoCopyWithImpl<_ExpenseDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ExpenseDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExpenseDto &&
            (identical(other.globalId, globalId) ||
                other.globalId == globalId) &&
            (identical(other.syncStatus, syncStatus) ||
                other.syncStatus == syncStatus) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.expenseType, expenseType) ||
                other.expenseType == expenseType) &&
            (identical(other.materialName, materialName) ||
                other.materialName == materialName) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, globalId, syncStatus,
      categoryType, expenseType, materialName, cost, date, updatedAt);

  @override
  String toString() {
    return 'ExpenseDto(globalId: $globalId, syncStatus: $syncStatus, categoryType: $categoryType, expenseType: $expenseType, materialName: $materialName, cost: $cost, date: $date, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$ExpenseDtoCopyWith<$Res>
    implements $ExpenseDtoCopyWith<$Res> {
  factory _$ExpenseDtoCopyWith(
          _ExpenseDto value, $Res Function(_ExpenseDto) _then) =
      __$ExpenseDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String globalId,
      String syncStatus,
      String categoryType,
      String expenseType,
      String? materialName,
      double cost,
      DateTime date,
      DateTime updatedAt});
}

/// @nodoc
class __$ExpenseDtoCopyWithImpl<$Res> implements _$ExpenseDtoCopyWith<$Res> {
  __$ExpenseDtoCopyWithImpl(this._self, this._then);

  final _ExpenseDto _self;
  final $Res Function(_ExpenseDto) _then;

  /// Create a copy of ExpenseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? globalId = null,
    Object? syncStatus = null,
    Object? categoryType = null,
    Object? expenseType = null,
    Object? materialName = freezed,
    Object? cost = null,
    Object? date = null,
    Object? updatedAt = null,
  }) {
    return _then(_ExpenseDto(
      globalId: null == globalId
          ? _self.globalId
          : globalId // ignore: cast_nullable_to_non_nullable
              as String,
      syncStatus: null == syncStatus
          ? _self.syncStatus
          : syncStatus // ignore: cast_nullable_to_non_nullable
              as String,
      categoryType: null == categoryType
          ? _self.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as String,
      expenseType: null == expenseType
          ? _self.expenseType
          : expenseType // ignore: cast_nullable_to_non_nullable
              as String,
      materialName: freezed == materialName
          ? _self.materialName
          : materialName // ignore: cast_nullable_to_non_nullable
              as String?,
      cost: null == cost
          ? _self.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
