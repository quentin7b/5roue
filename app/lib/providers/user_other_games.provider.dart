import 'package:five_wheel/models/game.model.dart';
import 'package:five_wheel/providers/games.provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_other_games.provider.g.dart';

@riverpod
Future<List<Game>> userOtherGames(Ref ref) async {
  final games = ref.watch(gamesProvider.future);
  return (await games).where((game) => game.isFavorite == false).toList();
}
