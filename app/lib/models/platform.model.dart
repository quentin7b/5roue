import 'package:freezed_annotation/freezed_annotation.dart';

enum Platform {
  @JsonValue('steam')
  steam,
  @JsonValue('psn')
  psn,
  @JsonValue('xbox')
  xbox,
  @JsonValue('windows')
  windows,
  @JsonValue('riot')
  riot,
  @JsonValue('epic')
  epic,
  @JsonValue('ea')
  ea,
  @JsonValue('nintendo')
  nintendo,
}
