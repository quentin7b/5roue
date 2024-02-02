// ignore_for_file: invalid_annotation_target

import 'package:five_wheel/models/game.model.dart';
import 'package:five_wheel/models/game_level.model.dart';
import 'package:five_wheel/models/language.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_session.model.freezed.dart';
part 'game_session.model.g.dart';

@freezed
class GameSession with _$GameSession {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory GameSession({
    required String id,
    Game? game,
    required String ownerId,
    @JsonKey(name: 'search_player_max_count') required int maxPlayersCount,
    // Session is full or not
    @Default(true) bool isOpen,
    // User keep the session running
    @Default(true) bool isActive,
    // Criterias
    @Default([]) List<Language> languagesCriteria,
    @Default([]) List<GameLevel> levelsCriteria,
  }) = _GameSession;

  factory GameSession.fromJson(Map<String, Object?> json) =>
      _$GameSessionFromJson(json);
}
