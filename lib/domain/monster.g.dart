// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monster.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Monster _$$_MonsterFromJson(Map<String, dynamic> json) => _$_Monster(
      json['skill'] as int,
      HistoricalPoint.fromJson(json['stamina'] as Map<String, dynamic>),
      name: json['name'] as String?,
      memo: json['memo'] as String?,
      isFriend: json['isFriend'] as bool? ?? false,
      group: json['group'] as String?,
    );

Map<String, dynamic> _$$_MonsterToJson(_$_Monster instance) =>
    <String, dynamic>{
      'skill': instance.skill,
      'stamina': instance.stamina,
      'name': instance.name,
      'memo': instance.memo,
      'isFriend': instance.isFriend,
      'group': instance.group,
    };
