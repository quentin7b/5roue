import 'package:five_wheel/models/platform.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_game.model.freezed.dart';
part 'user_game.model.g.dart';

@freezed
class UserGame with _$UserGame {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UserGame({
    required String id,
    required String gameId,
    required String userId,
    required Platform platform,
  }) = _UserGame;

  factory UserGame.fromJson(Map<String, Object?> json) =>
      _$UserGameFromJson(json);
}
