import 'package:collection/collection.dart';
import 'package:five_wheel/models/game.model.dart';
import 'package:five_wheel/services/game.service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseGameService implements GameService {
  final SupabaseClient client;

  SupabaseGameService(this.client);

  @override
  Future<List<Game>> getGames() async {
    final r = await client.from('game').select('*, game_platform(platform)');
    // One row per game per platform
    final groupedGames = r.groupListsBy((e) => e['id']).values;
    return groupedGames
        .map(
          (e) => e.first,
        )
        .map(
          (e) => Game.fromJson({
            ...e,
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
}
