// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'historical_point.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HistoricalPoint _$HistoricalPointFromJson(Map<String, dynamic> json) {
  return _HistoricalPoint.fromJson(json);
}

/// @nodoc
class _$HistoricalPointTearOff {
  const _$HistoricalPointTearOff();

  _HistoricalPoint call(int point,
      {int? max, List<History> histories = const <History>[]}) {
    return _HistoricalPoint(
      point,
      max: max,
      histories: histories,
    );
  }

  HistoricalPoint fromJson(Map<String, Object?> json) {
    return HistoricalPoint.fromJson(json);
  }
}

/// @nodoc
const $HistoricalPoint = _$HistoricalPointTearOff();

/// @nodoc
mixin _$HistoricalPoint {
  int get point => throw _privateConstructorUsedError;
  int? get max => throw _privateConstructorUsedError;
  List<History> get histories => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoricalPointCopyWith<HistoricalPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoricalPointCopyWith<$Res> {
  factory $HistoricalPointCopyWith(
          HistoricalPoint value, $Res Function(HistoricalPoint) then) =
      _$HistoricalPointCopyWithImpl<$Res>;
  $Res call({int point, int? max, List<History> histories});
}

/// @nodoc
class _$HistoricalPointCopyWithImpl<$Res>
    implements $HistoricalPointCopyWith<$Res> {
  _$HistoricalPointCopyWithImpl(this._value, this._then);

  final HistoricalPoint _value;
  // ignore: unused_field
  final $Res Function(HistoricalPoint) _then;

  @override
  $Res call({
    Object? point = freezed,
    Object? max = freezed,
    Object? histories = freezed,
  }) {
    return _then(_value.copyWith(
      point: point == freezed
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      max: max == freezed
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int?,
      histories: histories == freezed
          ? _value.histories
          : histories // ignore: cast_nullable_to_non_nullable
              as List<History>,
    ));
  }
}

/// @nodoc
abstract class _$HistoricalPointCopyWith<$Res>
    implements $HistoricalPointCopyWith<$Res> {
  factory _$HistoricalPointCopyWith(
          _HistoricalPoint value, $Res Function(_HistoricalPoint) then) =
      __$HistoricalPointCopyWithImpl<$Res>;
  @override
  $Res call({int point, int? max, List<History> histories});
}

/// @nodoc
class __$HistoricalPointCopyWithImpl<$Res>
    extends _$HistoricalPointCopyWithImpl<$Res>
    implements _$HistoricalPointCopyWith<$Res> {
  __$HistoricalPointCopyWithImpl(
      _HistoricalPoint _value, $Res Function(_HistoricalPoint) _then)
      : super(_value, (v) => _then(v as _HistoricalPoint));

  @override
  _HistoricalPoint get _value => super._value as _HistoricalPoint;

  @override
  $Res call({
    Object? point = freezed,
    Object? max = freezed,
    Object? histories = freezed,
  }) {
    return _then(_HistoricalPoint(
      point == freezed
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      max: max == freezed
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int?,
      histories: histories == freezed
          ? _value.histories
          : histories // ignore: cast_nullable_to_non_nullable
              as List<History>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HistoricalPoint extends _HistoricalPoint {
  _$_HistoricalPoint(this.point, {this.max, this.histories = const <History>[]})
      : super._();

  factory _$_HistoricalPoint.fromJson(Map<String, dynamic> json) =>
      _$$_HistoricalPointFromJson(json);

  @override
  final int point;
  @override
  final int? max;
  @JsonKey(defaultValue: const <History>[])
  @override
  final List<History> histories;

  @override
  String toString() {
    return 'HistoricalPoint(point: $point, max: $max, histories: $histories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HistoricalPoint &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.max, max) || other.max == max) &&
            const DeepCollectionEquality().equals(other.histories, histories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, point, max, const DeepCollectionEquality().hash(histories));

  @JsonKey(ignore: true)
  @override
  _$HistoricalPointCopyWith<_HistoricalPoint> get copyWith =>
      __$HistoricalPointCopyWithImpl<_HistoricalPoint>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HistoricalPointToJson(this);
  }
}

abstract class _HistoricalPoint extends HistoricalPoint {
  factory _HistoricalPoint(int point, {int? max, List<History> histories}) =
      _$_HistoricalPoint;
  _HistoricalPoint._() : super._();

  factory _HistoricalPoint.fromJson(Map<String, dynamic> json) =
      _$_HistoricalPoint.fromJson;

  @override
  int get point;
  @override
  int? get max;
  @override
  List<History> get histories;
  @override
  @JsonKey(ignore: true)
  _$HistoricalPointCopyWith<_HistoricalPoint> get copyWith =>
      throw _privateConstructorUsedError;
}
