import 'package:collection/collection.dart';
import 'package:five_wheel/models/game_session.model.dart';
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
  Future<List<GameSession>> getSessions({
    required String ownerId,
    bool onlyActive = true,
  }) async {
    final gameSessions = await client
        .from('session')
        .select(
          'id, owner_id, search_player_max_count, is_open, game(*)',
        )
        .eq('owner_id', ownerId)
        .eq('is_active', onlyActive);
    final gameSessionsLanguages = await client
        .from('session_criteria_language')
        .select('session_id, language')
        .inFilter('session_id', gameSessions.map((e) => e['id']).toList());

    List<Map<String, dynamic>> gameSessionsWithLanguages =
        gameSessions.toList();
    for (final l in gameSessionsLanguages) {
      final gameSession = gameSessionsWithLanguages
          .firstWhereOrNull((e) => e['id'] == l['session_id']);
      if (gameSession != null) {
        gameSession['language'] = l['language'];
      }
    }
    return gameSessionsWithLanguages
        .map((e) => GameSession.fromJson(e))
        .toList();
  }
}
