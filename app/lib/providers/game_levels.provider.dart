import 'package:five_wheel/models/game_level.model.dart';
import 'package:five_wheel/providers/services.provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_levels.provider.g.dart';

@riverpod
Future<List<GameLevel>> levelsForGame(
  Ref ref, {
  required String gameId,
}) async {
  return ref.read(gameServiceProvider).getGameLevels(gameId: gameId);
}
