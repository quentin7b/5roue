import 'package:five_wheel/models/game_session.model.dart';

abstract class SessionService {
  Future<GameSession> createOrUpdate({
    required GameSession session,
  });
  Future<GameSession> getSession({
    required String sessionId,
  });
}
