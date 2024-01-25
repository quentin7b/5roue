import 'package:five_wheel/models/game.model.dart';
import 'package:five_wheel/providers/services.provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'games.provider.g.dart';

@Riverpod(keepAlive: true)
class Games extends _$Games {
  List<Game> _games = [];

  @override
  AsyncValue<List<Game>> build() {
    ref.read(gameServiceProvider).getGames().then((value) {
      _games = value;
      state = AsyncData(_games);
    });
    return const AsyncLoading();
  }

  void filter(String filter) {
    state = AsyncData(
      _games
          .where(
            (game) => game.name.toLowerCase().contains(filter.toLowerCase()),
          )
          .toList(),
    );
  }
}
