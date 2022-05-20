// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historical_point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HistoricalPoint _$$_HistoricalPointFromJson(Map<String, dynamic> json) =>
    _$_HistoricalPoint(
      json['point'] as int,
      max: json['max'] as int?,
      histories: (json['histories'] as List<dynamic>?)
              ?.map((e) => History.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_HistoricalPointToJson(_$_HistoricalPoint instance) =>
    <String, dynamic>{
      'point': instance.point,
      'max': instance.max,
      'histories': instance.histories,
    };
