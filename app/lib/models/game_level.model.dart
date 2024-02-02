// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_level.model.freezed.dart';
part 'game_level.model.g.dart';

@freezed
class GameLevel with _$GameLevel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory GameLevel({
    required String id,
    required String name,
    @JsonKey(name: 'game_order') required int order,
  }) = _GameLevel;

  factory GameLevel.fromJson(Map<String, Object?> json) =>
      _$GameLevelFromJson(json);
}
