// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Item _$$_ItemFromJson(Map<String, dynamic> json) => _$_Item(
      json['name'] as String,
      memo: json['memo'] as String?,
      paragraph: json['paragraph'] as int?,
      isDeleted: json['isDeleted'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'name': instance.name,
      'memo': instance.memo,
      'paragraph': instance.paragraph,
      'isDeleted': instance.isDeleted,
    };
