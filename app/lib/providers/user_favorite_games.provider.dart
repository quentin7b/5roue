import 'package:five_wheel/models/game.model.dart';
import 'package:five_wheel/providers/services.provider.dart';
import 'package:five_wheel/providers/user.provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_favorite_games.provider.g.dart';

@Riverpod(keepAlive: true)
class UserFavoriteGames extends _$UserFavoriteGames {
  @override
  AsyncValue<List<Game>> build() {
    final user = ref.watch(currentUserProvider);
    if (user != null) {
      reloadGames();
      return const AsyncLoading();
    }
    return const AsyncData([]);
  }

  void reloadGames() async {
    final userId = ref.read(currentUserProvider)!.id;
    state = await AsyncValue.guard(
      () async {
        final games = await ref
            .read(userServiceProvider)
            .getFavoriteGames(userId: userId);
        return games;
      },
    );
  }
}
