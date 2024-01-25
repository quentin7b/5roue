// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_session.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SessionImpl _$$SessionImplFromJson(Map<String, dynamic> json) =>
    _$SessionImpl(
      id: json['id'] as String,
      game: json['game'] == null
          ? null
          : Game.fromJson(json['game'] as Map<String, dynamic>),
      ownerId: json['owner_id'] as String,
      maxPlayersCount: json['search_player_max_count'] as int,
      isOpen: json['is_open'] as bool? ?? true,
      isActive: json['is_active'] as bool? ?? true,
      languagesCriteria: (json['languages_criteria'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$LanguageEnumMap, e))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$SessionImplToJson(_$SessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'game': instance.game,
      'owner_id': instance.ownerId,
      'search_player_max_count': instance.maxPlayersCount,
      'is_open': instance.isOpen,
      'is_active': instance.isActive,
      'languages_criteria':
          instance.languagesCriteria.map((e) => _$LanguageEnumMap[e]!).toList(),
    };

const _$LanguageEnumMap = {
  Language.fr: 'fr',
  Language.en: 'en',
};
