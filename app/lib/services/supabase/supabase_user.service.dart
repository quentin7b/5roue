import 'package:collection/collection.dart';
import 'package:five_wheel/models/game.model.dart';
import 'package:five_wheel/models/user.model.dart' as f_w;
import 'package:five_wheel/services/user.service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseUserService implements UserService {
  final SupabaseClient client;

  SupabaseUserService(this.client);

  @override
  Future<f_w.User> getMe() async {
    // Get session's user
    final sessionUser = client.auth.currentUser!;
    final r = await client
        .from('user')
        .select()
        .eq('id', sessionUser.id)
        .limit(1)
        .single();
    return f_w.User.fromJson({
      'id': r['id'],
      ...r,
    });
  }

  @override
  Future<List<Game>> getGames({required String userId}) async {
    final r = await client
        .from('user_game')
        .select('id, platform, game(*)')
        .eq('user_id', userId);
    // One row per game per platform
    final groupedGames = r.groupListsBy((e) => e['game']['id']).values;
    return groupedGames
        .map(
          (e) => Game.fromJson({
            ...e.first['game'],
            'platforms': e.map((e) => e['platform']).toList(),
          }),
        )
        .toList();
  }
}
