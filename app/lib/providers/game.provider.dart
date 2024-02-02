import 'package:five_wheel/models/game.model.dart';
import 'package:five_wheel/providers/games.provider.dart';
import 'package:five_wheel/providers/services.provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game.provider.g.dart';

@riverpod
class GameInfo extends _$GameInfo {
  @override
  FutureOr<Game> build({
    required String gameId,
    Game? initialValue,
  }) {
    if (initialValue != null) {
      return initialValue;
    }
    return ref.read(gameServiceProvider).getGame(gameId: gameId);
  }

  toggleFavorite(bool newFavorite) {
    final newGame = state.requireValue.copyWith(
      isFavorite: newFavorite,
    );
    ref.read(gameServiceProvider).updateGameForUser(newGame).then(
      (_) {
        ref.invalidate(gamesProvider);
        state = AsyncData(newGame);
      },
    );
  }
}
