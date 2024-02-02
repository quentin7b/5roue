// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_game.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserGameImpl _$$UserGameImplFromJson(Map<String, dynamic> json) =>
    _$UserGameImpl(
      id: json['id'] as String,
      gameId: json['game_id'] as String,
      userId: json['user_id'] as String,
      platform: $enumDecode(_$PlatformEnumMap, json['platform']),
    );

Map<String, dynamic> _$$UserGameImplToJson(_$UserGameImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'game_id': instance.gameId,
      'user_id': instance.userId,
      'platform': _$PlatformEnumMap[instance.platform]!,
    };

const _$PlatformEnumMap = {
  Platform.steam: 'steam',
  Platform.psn: 'psn',
  Platform.xbox: 'xbox',
  Platform.windows: 'windows',
  Platform.riot: 'riot',
  Platform.epic: 'epic',
  Platform.ea: 'ea',
  Platform.nintendo: 'nintendo',
};
