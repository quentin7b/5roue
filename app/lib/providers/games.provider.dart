import 'package:five_wheel/models/game.model.dart';
import 'package:five_wheel/providers/services.provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'games.provider.g.dart';

@Riverpod(keepAlive: true)
class Games extends _$Games {
  final List<Game> _games = [];

  @override
  FutureOr<List<Game>> build() {
    return ref.read(gameServiceProvider).getGames().then(
          (value) => _games
            ..clear()
            ..addAll(value),
        );
  }

  void filter(String filter) {
    if (filter.isEmpty) {
      state = AsyncData(_games);
    } else {
      state = AsyncData(
        _games
            .where(
              (game) => game.name.toLowerCase().contains(filter.toLowerCase()),
            )
            .toList(),
      );
    }
  }
}
