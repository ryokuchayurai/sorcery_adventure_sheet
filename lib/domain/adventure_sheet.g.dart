// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adventure_sheet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AdventureSheet _$$_AdventureSheetFromJson(Map<String, dynamic> json) =>
    _$_AdventureSheet(
      sheetName: json['sheetName'] as String?,
      role: $enumDecodeNullable(_$RoleEnumMap, json['role']),
      skill: json['skill'] == null
          ? null
          : HistoricalPoint.fromJson(json['skill'] as Map<String, dynamic>),
      skillAdd: json['skillAdd'] as int?,
      stamina: json['stamina'] == null
          ? null
          : HistoricalPoint.fromJson(json['stamina'] as Map<String, dynamic>),
      luck: json['luck'] == null
          ? null
          : HistoricalPoint.fromJson(json['luck'] as Map<String, dynamic>),
      golds: json['golds'] == null
          ? null
          : HistoricalPoint.fromJson(json['golds'] as Map<String, dynamic>),
      provisions: json['provisions'] == null
          ? null
          : HistoricalPoint.fromJson(
              json['provisions'] as Map<String, dynamic>),
      libra: json['libra'] as bool?,
      equipments: (json['equipments'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      notes: (json['notes'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      monsters: (json['monsters'] as List<dynamic>?)
          ?.map((e) => Monster.fromJson(e as Map<String, dynamic>))
          .toList(),
      defeatedMonsters: (json['defeatedMonsters'] as List<dynamic>?)
          ?.map((e) => Monster.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AdventureSheetToJson(_$_AdventureSheet instance) =>
    <String, dynamic>{
      'sheetName': instance.sheetName,
      'role': _$RoleEnumMap[instance.role],
      'skill': instance.skill,
      'skillAdd': instance.skillAdd,
      'stamina': instance.stamina,
      'luck': instance.luck,
      'golds': instance.golds,
      'provisions': instance.provisions,
      'libra': instance.libra,
      'equipments': instance.equipments,
      'status': instance.status,
      'notes': instance.notes,
      'monsters': instance.monsters,
      'defeatedMonsters': instance.defeatedMonsters,
    };

const _$RoleEnumMap = {
  Role.warrior: 'warrior',
  Role.wizard: 'wizard',
};
