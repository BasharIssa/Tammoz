// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'planting_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlantingDto {
  int get id;
  String get type;
  int get quantity;
  DateTime get date;
  double? get initialCost;

  /// Create a copy of PlantingDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlantingDtoCopyWith<PlantingDto> get copyWith =>
      _$PlantingDtoCopyWithImpl<PlantingDto>(this as PlantingDto, _$identity);

  /// Serializes this PlantingDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlantingDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.initialCost, initialCost) ||
                other.initialCost == initialCost));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, type, quantity, date, initialCost);

  @override
  String toString() {
    return 'PlantingDto(id: $id, type: $type, quantity: $quantity, date: $date, initialCost: $initialCost)';
  }
}

/// @nodoc
abstract mixin class $PlantingDtoCopyWith<$Res> {
  factory $PlantingDtoCopyWith(
          PlantingDto value, $Res Function(PlantingDto) _then) =
      _$PlantingDtoCopyWithImpl;
  @useResult
  $Res call(
      {int id, String type, int quantity, DateTime date, double? initialCost});
}

/// @nodoc
class _$PlantingDtoCopyWithImpl<$Res> implements $PlantingDtoCopyWith<$Res> {
  _$PlantingDtoCopyWithImpl(this._self, this._then);

  final PlantingDto _self;
  final $Res Function(PlantingDto) _then;

  /// Create a copy of PlantingDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? quantity = null,
    Object? date = null,
    Object? initialCost = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      initialCost: freezed == initialCost
          ? _self.initialCost
          : initialCost // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _PlantingDto implements PlantingDto {
  _PlantingDto(
      {required this.id,
      required this.type,
      required this.quantity,
      required this.date,
      this.initialCost});
  factory _PlantingDto.fromJson(Map<String, dynamic> json) =>
      _$PlantingDtoFromJson(json);

  @override
  final int id;
  @override
  final String type;
  @override
  final int quantity;
  @override
  final DateTime date;
  @override
  final double? initialCost;

  /// Create a copy of PlantingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlantingDtoCopyWith<_PlantingDto> get copyWith =>
      __$PlantingDtoCopyWithImpl<_PlantingDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PlantingDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlantingDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.initialCost, initialCost) ||
                other.initialCost == initialCost));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, type, quantity, date, initialCost);

  @override
  String toString() {
    return 'PlantingDto(id: $id, type: $type, quantity: $quantity, date: $date, initialCost: $initialCost)';
  }
}

/// @nodoc
abstract mixin class _$PlantingDtoCopyWith<$Res>
    implements $PlantingDtoCopyWith<$Res> {
  factory _$PlantingDtoCopyWith(
          _PlantingDto value, $Res Function(_PlantingDto) _then) =
      __$PlantingDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id, String type, int quantity, DateTime date, double? initialCost});
}

/// @nodoc
class __$PlantingDtoCopyWithImpl<$Res> implements _$PlantingDtoCopyWith<$Res> {
  __$PlantingDtoCopyWithImpl(this._self, this._then);

  final _PlantingDto _self;
  final $Res Function(_PlantingDto) _then;

  /// Create a copy of PlantingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? quantity = null,
    Object? date = null,
    Object? initialCost = freezed,
  }) {
    return _then(_PlantingDto(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      initialCost: freezed == initialCost
          ? _self.initialCost
          : initialCost // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

// dart format on
