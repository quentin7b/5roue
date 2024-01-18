import 'package:five_wheel/models/game.model.dart';
import 'package:five_wheel/providers/services.provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game.provider.g.dart';

@riverpod
Future<Game> game(
  Ref ref, {
  required String gameId,
  Game? initialValue,
}) async {
  if (initialValue != null) {
    return initialValue;
  }
  return ref.read(gameServiceProvider).getGame(gameId: gameId);
}
