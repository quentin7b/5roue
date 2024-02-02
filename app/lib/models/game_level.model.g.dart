// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_level.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameLevelImpl _$$GameLevelImplFromJson(Map<String, dynamic> json) =>
    _$GameLevelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      order: json['game_order'] as int,
    );

Map<String, dynamic> _$$GameLevelImplToJson(_$GameLevelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'game_order': instance.order,
    };
