import 'package:five_wheel/models/game_session.model.dart';
import 'package:five_wheel/models/language.model.dart';
import 'package:five_wheel/services/session.service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseSessionService implements SessionService {
  final SupabaseClient client;

  SupabaseSessionService(this.client);

  @override
  Future<GameSession> createOrUpdate({required GameSession session}) async {
    await client.from('session').upsert({
      'id': session.id,
      'game_id': session.game!.id,
      'owner_id': session.ownerId,
      'search_player_max_count': session.maxPlayersCount,
      'is_open': session.isOpen,
    });
    // Criterias ?
    await client
        .from('session_criteria_language')
        .delete()
        .eq('session_id', session.id);
    await client.from('session_criteria_language').upsert(
          session.languagesCriteria
              .map(
                (l) => {
                  'session_id': session.id,
                  'language': l.shortName,
                },
              )
              .toList(),
        );

    return session;
  }

  @override
  Future<GameSession> getSession({required String sessionId}) async {
    final baseSession = await client
        .from('session')
        .select('*, game(*)')
        .eq('id', sessionId)
        .limit(1)
        .single();
    final sessionLanguages = await client
        .from('session_criteria_language')
        .select('language')
        .eq('session_id', sessionId);
    return GameSession.fromJson({
      ...baseSession,
      'languages_criteria': sessionLanguages.map((e) => e['language']).toList(),
    });
  }
}
