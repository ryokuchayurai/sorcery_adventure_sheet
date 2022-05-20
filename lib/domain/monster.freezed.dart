// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'monster.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Monster _$MonsterFromJson(Map<String, dynamic> json) {
  return _Monster.fromJson(json);
}

/// @nodoc
class _$MonsterTearOff {
  const _$MonsterTearOff();

  _Monster call(int skill, HistoricalPoint stamina,
      {String? name, String? memo, bool isFriend = false, String? group}) {
    return _Monster(
      skill,
      stamina,
      name: name,
      memo: memo,
      isFriend: isFriend,
      group: group,
    );
  }

  Monster fromJson(Map<String, Object?> json) {
    return Monster.fromJson(json);
  }
}

/// @nodoc
const $Monster = _$MonsterTearOff();

/// @nodoc
mixin _$Monster {
  int get skill => throw _privateConstructorUsedError;
  HistoricalPoint get stamina => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get memo => throw _privateConstructorUsedError;
  bool get isFriend => throw _privateConstructorUsedError;
  String? get group => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MonsterCopyWith<Monster> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonsterCopyWith<$Res> {
  factory $MonsterCopyWith(Monster value, $Res Function(Monster) then) =
      _$MonsterCopyWithImpl<$Res>;
  $Res call(
      {int skill,
      HistoricalPoint stamina,
      String? name,
      String? memo,
      bool isFriend,
      String? group});

  $HistoricalPointCopyWith<$Res> get stamina;
}

/// @nodoc
class _$MonsterCopyWithImpl<$Res> implements $MonsterCopyWith<$Res> {
  _$MonsterCopyWithImpl(this._value, this._then);

  final Monster _value;
  // ignore: unused_field
  final $Res Function(Monster) _then;

  @override
  $Res call({
    Object? skill = freezed,
    Object? stamina = freezed,
    Object? name = freezed,
    Object? memo = freezed,
    Object? isFriend = freezed,
    Object? group = freezed,
  }) {
    return _then(_value.copyWith(
      skill: skill == freezed
          ? _value.skill
          : skill // ignore: cast_nullable_to_non_nullable
              as int,
      stamina: stamina == freezed
          ? _value.stamina
          : stamina // ignore: cast_nullable_to_non_nullable
              as HistoricalPoint,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      memo: memo == freezed
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String?,
      isFriend: isFriend == freezed
          ? _value.isFriend
          : isFriend // ignore: cast_nullable_to_non_nullable
              as bool,
      group: group == freezed
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $HistoricalPointCopyWith<$Res> get stamina {
    return $HistoricalPointCopyWith<$Res>(_value.stamina, (value) {
      return _then(_value.copyWith(stamina: value));
    });
  }
}

/// @nodoc
abstract class _$MonsterCopyWith<$Res> implements $MonsterCopyWith<$Res> {
  factory _$MonsterCopyWith(_Monster value, $Res Function(_Monster) then) =
      __$MonsterCopyWithImpl<$Res>;
  @override
  $Res call(
      {int skill,
      HistoricalPoint stamina,
      String? name,
      String? memo,
      bool isFriend,
      String? group});

  @override
  $HistoricalPointCopyWith<$Res> get stamina;
}

/// @nodoc
class __$MonsterCopyWithImpl<$Res> extends _$MonsterCopyWithImpl<$Res>
    implements _$MonsterCopyWith<$Res> {
  __$MonsterCopyWithImpl(_Monster _value, $Res Function(_Monster) _then)
      : super(_value, (v) => _then(v as _Monster));

  @override
  _Monster get _value => super._value as _Monster;

  @override
  $Res call({
    Object? skill = freezed,
    Object? stamina = freezed,
    Object? name = freezed,
    Object? memo = freezed,
    Object? isFriend = freezed,
    Object? group = freezed,
  }) {
    return _then(_Monster(
      skill == freezed
          ? _value.skill
          : skill // ignore: cast_nullable_to_non_nullable
              as int,
      stamina == freezed
          ? _value.stamina
          : stamina // ignore: cast_nullable_to_non_nullable
              as HistoricalPoint,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      memo: memo == freezed
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String?,
      isFriend: isFriend == freezed
          ? _value.isFriend
          : isFriend // ignore: cast_nullable_to_non_nullable
              as bool,
      group: group == freezed
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Monster implements _Monster {
  _$_Monster(this.skill, this.stamina,
      {this.name, this.memo, this.isFriend = false, this.group});

  factory _$_Monster.fromJson(Map<String, dynamic> json) =>
      _$$_MonsterFromJson(json);

  @override
  final int skill;
  @override
  final HistoricalPoint stamina;
  @override
  final String? name;
  @override
  final String? memo;
  @JsonKey(defaultValue: false)
  @override
  final bool isFriend;
  @override
  final String? group;

  @override
  String toString() {
    return 'Monster(skill: $skill, stamina: $stamina, name: $name, memo: $memo, isFriend: $isFriend, group: $group)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Monster &&
            (identical(other.skill, skill) || other.skill == skill) &&
            (identical(other.stamina, stamina) || other.stamina == stamina) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.isFriend, isFriend) ||
                other.isFriend == isFriend) &&
            (identical(other.group, group) || other.group == group));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, skill, stamina, name, memo, isFriend, group);

  @JsonKey(ignore: true)
  @override
  _$MonsterCopyWith<_Monster> get copyWith =>
      __$MonsterCopyWithImpl<_Monster>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MonsterToJson(this);
  }
}

abstract class _Monster implements Monster {
  factory _Monster(int skill, HistoricalPoint stamina,
      {String? name, String? memo, bool isFriend, String? group}) = _$_Monster;

  factory _Monster.fromJson(Map<String, dynamic> json) = _$_Monster.fromJson;

  @override
  int get skill;
  @override
  HistoricalPoint get stamina;
  @override
  String? get name;
  @override
  String? get memo;
  @override
  bool get isFriend;
  @override
  String? get group;
  @override
  @JsonKey(ignore: true)
  _$MonsterCopyWith<_Monster> get copyWith =>
      throw _privateConstructorUsedError;
}
