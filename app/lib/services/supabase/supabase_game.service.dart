import 'package:collection/collection.dart';
import 'package:five_wheel/models/game.model.dart';
import 'package:five_wheel/models/game_level.model.dart';
import 'package:five_wheel/models/user_game.model.dart';
import 'package:five_wheel/services/game.service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class SupabaseGameService implements GameService {
  final SupabaseClient client;

  SupabaseGameService(this.client);

  @override
  Future<List<Game>> getGames() async {
    final r = await client
        .from('game')
        .select('*, game_platform(platform), user_game(id)');
    // One row per game per platform
    final groupedGames = r.groupListsBy((e) => e['id']).values;
    return groupedGames
        .map(
          (e) => e.first,
        )
        .map(
          (e) => Game.fromJson({
            ...e,
            'is_favorite': e['user_game'].isNotEmpty,
            'platforms':
                e['game_platform'].map((ee) => ee['platform']).toList(),
          }),
        )
        .toList();
  }

  @override
  Future<Game> getGame({required String gameId}) async {
    final r = await client
        .from('game')
        .select('*, game_platform(platform)')
        .eq('id', gameId);
    // One row per platform
    final platforms = r.map((e) => e['game_platform'][0]['platform']).toList();
    final firstRow = r.first;
    firstRow.remove('game_platform');
    return Game.fromJson({
      ...firstRow,
      'platforms': platforms,
    });
  }

  @override
  Future<List<GameLevel>> getGameLevels({required String gameId}) {
    return client
        .from('game_level')
        .select('id, name')
        .eq('game_id', gameId)
        .then((value) => value.map((row) => GameLevel.fromJson(row)).toList());
  }

  @override
  Future<void> updateGameForUser(Game game) async {
    if (game.isFavorite) {
      // Add game to user_game
      return client.from('user_game').insert(
            UserGame(
              id: const Uuid().v4(),
              gameId: game.id,
              userId: client.auth.currentUser!.id,
              platform: game.platforms.first,
            ),
          );
    } else {
      // Remove game from user_game
      return client
          .from('user_game')
          .delete()
          .eq('game_id', game.id)
          .eq('user_id', client.auth.currentUser!.id);
    }
  }
}
