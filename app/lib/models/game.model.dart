import 'package:five_wheel/models/platform.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game.model.freezed.dart';
part 'game.model.g.dart';

@freezed
class Game with _$Game {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Game({
    required String id,
    required String name,
    required String pictureUrl,
    required bool isCrossPlatform,
    required int maxCoopPlayers,
    // App specific fields
    @Default(false) bool isFavorite,
    @Default([]) List<Platform> platforms,
  }) = _Game;

  factory Game.fromJson(Map<String, Object?> json) => _$GameFromJson(json);
}
