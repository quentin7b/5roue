// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameImpl _$$GameImplFromJson(Map<String, dynamic> json) => _$GameImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      pictureUrl: json['picture_url'] as String,
      isCrossPlatform: json['is_cross_platform'] as bool,
      maxCoopPlayers: json['max_coop_players'] as int,
      platforms: (json['platforms'] as List<dynamic>)
          .map((e) => $enumDecode(_$PlatformEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$$GameImplToJson(_$GameImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'picture_url': instance.pictureUrl,
      'is_cross_platform': instance.isCrossPlatform,
      'max_coop_players': instance.maxCoopPlayers,
      'platforms':
          instance.platforms.map((e) => _$PlatformEnumMap[e]!).toList(),
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
