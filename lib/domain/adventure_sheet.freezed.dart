// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'adventure_sheet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AdventureSheet _$AdventureSheetFromJson(Map<String, dynamic> json) {
  return _AdventureSheet.fromJson(json);
}

/// @nodoc
class _$AdventureSheetTearOff {
  const _$AdventureSheetTearOff();

  _AdventureSheet call(
      {String? sheetName,
      Role? role,
      HistoricalPoint? skill,
      int? skillAdd,
      HistoricalPoint? stamina,
      HistoricalPoint? luck,
      HistoricalPoint? golds,
      HistoricalPoint? provisions,
      bool? libra,
      List<Item>? equipments,
      List<Item>? status,
      List<Item>? notes,
      List<Monster>? monsters,
      List<Monster>? defeatedMonsters}) {
    return _AdventureSheet(
      sheetName: sheetName,
      role: role,
      skill: skill,
      skillAdd: skillAdd,
      stamina: stamina,
      luck: luck,
      golds: golds,
      provisions: provisions,
      libra: libra,
      equipments: equipments,
      status: status,
      notes: notes,
      monsters: monsters,
      defeatedMonsters: defeatedMonsters,
    );
  }

  AdventureSheet fromJson(Map<String, Object?> json) {
    return AdventureSheet.fromJson(json);
  }
}

/// @nodoc
const $AdventureSheet = _$AdventureSheetTearOff();

/// @nodoc
mixin _$AdventureSheet {
  String? get sheetName => throw _privateConstructorUsedError;
  Role? get role => throw _privateConstructorUsedError;
  HistoricalPoint? get skill => throw _privateConstructorUsedError;
  int? get skillAdd => throw _privateConstructorUsedError;
  HistoricalPoint? get stamina => throw _privateConstructorUsedError;
  HistoricalPoint? get luck => throw _privateConstructorUsedError;
  HistoricalPoint? get golds => throw _privateConstructorUsedError;
  HistoricalPoint? get provisions => throw _privateConstructorUsedError;
  bool? get libra => throw _privateConstructorUsedError;
  List<Item>? get equipments => throw _privateConstructorUsedError;
  List<Item>? get status => throw _privateConstructorUsedError;
  List<Item>? get notes => throw _privateConstructorUsedError;
  List<Monster>? get monsters => throw _privateConstructorUsedError;
  List<Monster>? get defeatedMonsters => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdventureSheetCopyWith<AdventureSheet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdventureSheetCopyWith<$Res> {
  factory $AdventureSheetCopyWith(
          AdventureSheet value, $Res Function(AdventureSheet) then) =
      _$AdventureSheetCopyWithImpl<$Res>;
  $Res call(
      {String? sheetName,
      Role? role,
      HistoricalPoint? skill,
      int? skillAdd,
      HistoricalPoint? stamina,
      HistoricalPoint? luck,
      HistoricalPoint? golds,
      HistoricalPoint? provisions,
      bool? libra,
      List<Item>? equipments,
      List<Item>? status,
      List<Item>? notes,
      List<Monster>? monsters,
      List<Monster>? defeatedMonsters});

  $HistoricalPointCopyWith<$Res>? get skill;
  $HistoricalPointCopyWith<$Res>? get stamina;
  $HistoricalPointCopyWith<$Res>? get luck;
  $HistoricalPointCopyWith<$Res>? get golds;
  $HistoricalPointCopyWith<$Res>? get provisions;
}

/// @nodoc
class _$AdventureSheetCopyWithImpl<$Res>
    implements $AdventureSheetCopyWith<$Res> {
  _$AdventureSheetCopyWithImpl(this._value, this._then);

  final AdventureSheet _value;
  // ignore: unused_field
  final $Res Function(AdventureSheet) _then;

  @override
  $Res call({
    Object? sheetName = freezed,
    Object? role = freezed,
    Object? skill = freezed,
    Object? skillAdd = freezed,
    Object? stamina = freezed,
    Object? luck = freezed,
    Object? golds = freezed,
    Object? provisions = freezed,
    Object? libra = freezed,
    Object? equipments = freezed,
    Object? status = freezed,
    Object? notes = freezed,
    Object? monsters = freezed,
    Object? defeatedMonsters = freezed,
  }) {
    return _then(_value.copyWith(
      sheetName: sheetName == freezed
          ? _value.sheetName
          : sheetName // ignore: cast_nullable_to_non_nullable
              as String?,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role?,
      skill: skill == freezed
          ? _value.skill
          : skill // ignore: cast_nullable_to_non_nullable
              as HistoricalPoint?,
      skillAdd: skillAdd == freezed
          ? _value.skillAdd
          : skillAdd // ignore: cast_nullable_to_non_nullable
              as int?,
      stamina: stamina == freezed
          ? _value.stamina
          : stamina // ignore: cast_nullable_to_non_nullable
              as HistoricalPoint?,
      luck: luck == freezed
          ? _value.luck
          : luck // ignore: cast_nullable_to_non_nullable
              as HistoricalPoint?,
      golds: golds == freezed
          ? _value.golds
          : golds // ignore: cast_nullable_to_non_nullable
              as HistoricalPoint?,
      provisions: provisions == freezed
          ? _value.provisions
          : provisions // ignore: cast_nullable_to_non_nullable
              as HistoricalPoint?,
      libra: libra == freezed
          ? _value.libra
          : libra // ignore: cast_nullable_to_non_nullable
              as bool?,
      equipments: equipments == freezed
          ? _value.equipments
          : equipments // ignore: cast_nullable_to_non_nullable
              as List<Item>?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as List<Item>?,
      notes: notes == freezed
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Item>?,
      monsters: monsters == freezed
          ? _value.monsters
          : monsters // ignore: cast_nullable_to_non_nullable
              as List<Monster>?,
      defeatedMonsters: defeatedMonsters == freezed
          ? _value.defeatedMonsters
          : defeatedMonsters // ignore: cast_nullable_to_non_nullable
              as List<Monster>?,
    ));
  }

  @override
  $HistoricalPointCopyWith<$Res>? get skill {
    if (_value.skill == null) {
      return null;
    }

    return $HistoricalPointCopyWith<$Res>(_value.skill!, (value) {
      return _then(_value.copyWith(skill: value));
    });
  }

  @override
  $HistoricalPointCopyWith<$Res>? get stamina {
    if (_value.stamina == null) {
      return null;
    }

    return $HistoricalPointCopyWith<$Res>(_value.stamina!, (value) {
      return _then(_value.copyWith(stamina: value));
    });
  }

  @override
  $HistoricalPointCopyWith<$Res>? get luck {
    if (_value.luck == null) {
      return null;
    }

    return $HistoricalPointCopyWith<$Res>(_value.luck!, (value) {
      return _then(_value.copyWith(luck: value));
    });
  }

  @override
  $HistoricalPointCopyWith<$Res>? get golds {
    if (_value.golds == null) {
      return null;
    }

    return $HistoricalPointCopyWith<$Res>(_value.golds!, (value) {
      return _then(_value.copyWith(golds: value));
    });
  }

  @override
  $HistoricalPointCopyWith<$Res>? get provisions {
    if (_value.provisions == null) {
      return null;
    }

    return $HistoricalPointCopyWith<$Res>(_value.provisions!, (value) {
      return _then(_value.copyWith(provisions: value));
    });
  }
}

/// @nodoc
abstract class _$AdventureSheetCopyWith<$Res>
    implements $AdventureSheetCopyWith<$Res> {
  factory _$AdventureSheetCopyWith(
          _AdventureSheet value, $Res Function(_AdventureSheet) then) =
      __$AdventureSheetCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? sheetName,
      Role? role,
      HistoricalPoint? skill,
      int? skillAdd,
      HistoricalPoint? stamina,
      HistoricalPoint? luck,
      HistoricalPoint? golds,
      HistoricalPoint? provisions,
      bool? libra,
      List<Item>? equipments,
      List<Item>? status,
      List<Item>? notes,
      List<Monster>? monsters,
      List<Monster>? defeatedMonsters});

  @override
  $HistoricalPointCopyWith<$Res>? get skill;
  @override
  $HistoricalPointCopyWith<$Res>? get stamina;
  @override
  $HistoricalPointCopyWith<$Res>? get luck;
  @override
  $HistoricalPointCopyWith<$Res>? get golds;
  @override
  $HistoricalPointCopyWith<$Res>? get provisions;
}

/// @nodoc
class __$AdventureSheetCopyWithImpl<$Res>
    extends _$AdventureSheetCopyWithImpl<$Res>
    implements _$AdventureSheetCopyWith<$Res> {
  __$AdventureSheetCopyWithImpl(
      _AdventureSheet _value, $Res Function(_AdventureSheet) _then)
      : super(_value, (v) => _then(v as _AdventureSheet));

  @override
  _AdventureSheet get _value => super._value as _AdventureSheet;

  @override
  $Res call({
    Object? sheetName = freezed,
    Object? role = freezed,
    Object? skill = freezed,
    Object? skillAdd = freezed,
    Object? stamina = freezed,
    Object? luck = freezed,
    Object? golds = freezed,
    Object? provisions = freezed,
    Object? libra = freezed,
    Object? equipments = freezed,
    Object? status = freezed,
    Object? notes = freezed,
    Object? monsters = freezed,
    Object? defeatedMonsters = freezed,
  }) {
    return _then(_AdventureSheet(
      sheetName: sheetName == freezed
          ? _value.sheetName
          : sheetName // ignore: cast_nullable_to_non_nullable
              as String?,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role?,
      skill: skill == freezed
          ? _value.skill
          : skill // ignore: cast_nullable_to_non_nullable
              as HistoricalPoint?,
      skillAdd: skillAdd == freezed
          ? _value.skillAdd
          : skillAdd // ignore: cast_nullable_to_non_nullable
              as int?,
      stamina: stamina == freezed
          ? _value.stamina
          : stamina // ignore: cast_nullable_to_non_nullable
              as HistoricalPoint?,
      luck: luck == freezed
          ? _value.luck
          : luck // ignore: cast_nullable_to_non_nullable
              as HistoricalPoint?,
      golds: golds == freezed
          ? _value.golds
          : golds // ignore: cast_nullable_to_non_nullable
              as HistoricalPoint?,
      provisions: provisions == freezed
          ? _value.provisions
          : provisions // ignore: cast_nullable_to_non_nullable
              as HistoricalPoint?,
      libra: libra == freezed
          ? _value.libra
          : libra // ignore: cast_nullable_to_non_nullable
              as bool?,
      equipments: equipments == freezed
          ? _value.equipments
          : equipments // ignore: cast_nullable_to_non_nullable
              as List<Item>?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as List<Item>?,
      notes: notes == freezed
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Item>?,
      monsters: monsters == freezed
          ? _value.monsters
          : monsters // ignore: cast_nullable_to_non_nullable
              as List<Monster>?,
      defeatedMonsters: defeatedMonsters == freezed
          ? _value.defeatedMonsters
          : defeatedMonsters // ignore: cast_nullable_to_non_nullable
              as List<Monster>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AdventureSheet implements _AdventureSheet {
  _$_AdventureSheet(
      {this.sheetName,
      this.role,
      this.skill,
      this.skillAdd,
      this.stamina,
      this.luck,
      this.golds,
      this.provisions,
      this.libra,
      this.equipments,
      this.status,
      this.notes,
      this.monsters,
      this.defeatedMonsters});

  factory _$_AdventureSheet.fromJson(Map<String, dynamic> json) =>
      _$$_AdventureSheetFromJson(json);

  @override
  final String? sheetName;
  @override
  final Role? role;
  @override
  final HistoricalPoint? skill;
  @override
  final int? skillAdd;
  @override
  final HistoricalPoint? stamina;
  @override
  final HistoricalPoint? luck;
  @override
  final HistoricalPoint? golds;
  @override
  final HistoricalPoint? provisions;
  @override
  final bool? libra;
  @override
  final List<Item>? equipments;
  @override
  final List<Item>? status;
  @override
  final List<Item>? notes;
  @override
  final List<Monster>? monsters;
  @override
  final List<Monster>? defeatedMonsters;

  @override
  String toString() {
    return 'AdventureSheet(sheetName: $sheetName, role: $role, skill: $skill, skillAdd: $skillAdd, stamina: $stamina, luck: $luck, golds: $golds, provisions: $provisions, libra: $libra, equipments: $equipments, status: $status, notes: $notes, monsters: $monsters, defeatedMonsters: $defeatedMonsters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AdventureSheet &&
            (identical(other.sheetName, sheetName) ||
                other.sheetName == sheetName) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.skill, skill) || other.skill == skill) &&
            (identical(other.skillAdd, skillAdd) ||
                other.skillAdd == skillAdd) &&
            (identical(other.stamina, stamina) || other.stamina == stamina) &&
            (identical(other.luck, luck) || other.luck == luck) &&
            (identical(other.golds, golds) || other.golds == golds) &&
            (identical(other.provisions, provisions) ||
                other.provisions == provisions) &&
            (identical(other.libra, libra) || other.libra == libra) &&
            const DeepCollectionEquality()
                .equals(other.equipments, equipments) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.notes, notes) &&
            const DeepCollectionEquality().equals(other.monsters, monsters) &&
            const DeepCollectionEquality()
                .equals(other.defeatedMonsters, defeatedMonsters));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      sheetName,
      role,
      skill,
      skillAdd,
      stamina,
      luck,
      golds,
      provisions,
      libra,
      const DeepCollectionEquality().hash(equipments),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(notes),
      const DeepCollectionEquality().hash(monsters),
      const DeepCollectionEquality().hash(defeatedMonsters));

  @JsonKey(ignore: true)
  @override
  _$AdventureSheetCopyWith<_AdventureSheet> get copyWith =>
      __$AdventureSheetCopyWithImpl<_AdventureSheet>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AdventureSheetToJson(this);
  }
}

abstract class _AdventureSheet implements AdventureSheet {
  factory _AdventureSheet(
      {String? sheetName,
      Role? role,
      HistoricalPoint? skill,
      int? skillAdd,
      HistoricalPoint? stamina,
      HistoricalPoint? luck,
      HistoricalPoint? golds,
      HistoricalPoint? provisions,
      bool? libra,
      List<Item>? equipments,
      List<Item>? status,
      List<Item>? notes,
      List<Monster>? monsters,
      List<Monster>? defeatedMonsters}) = _$_AdventureSheet;

  factory _AdventureSheet.fromJson(Map<String, dynamic> json) =
      _$_AdventureSheet.fromJson;

  @override
  String? get sheetName;
  @override
  Role? get role;
  @override
  HistoricalPoint? get skill;
  @override
  int? get skillAdd;
  @override
  HistoricalPoint? get stamina;
  @override
  HistoricalPoint? get luck;
  @override
  HistoricalPoint? get golds;
  @override
  HistoricalPoint? get provisions;
  @override
  bool? get libra;
  @override
  List<Item>? get equipments;
  @override
  List<Item>? get status;
  @override
  List<Item>? get notes;
  @override
  List<Monster>? get monsters;
  @override
  List<Monster>? get defeatedMonsters;
  @override
  @JsonKey(ignore: true)
  _$AdventureSheetCopyWith<_AdventureSheet> get copyWith =>
      throw _privateConstructorUsedError;
}
