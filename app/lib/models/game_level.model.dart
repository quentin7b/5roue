import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_level.model.freezed.dart';
part 'game_level.model.g.dart';

@freezed
class GameLevel with _$GameLevel {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory GameLevel({
    required String id,
    required String name,
  }) = _GameLevel;

  factory GameLevel.fromJson(Map<String, Object?> json) =>
      _$GameLevelFromJson(json);
}
