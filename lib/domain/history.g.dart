// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_History _$$_HistoryFromJson(Map<String, dynamic> json) => _$_History(
      json['point'] as int,
      max: json['max'] as int?,
      memo: json['memo'] as String?,
    );

Map<String, dynamic> _$$_HistoryToJson(_$_History instance) =>
    <String, dynamic>{
      'point': instance.point,
      'max': instance.max,
      'memo': instance.memo,
    };
