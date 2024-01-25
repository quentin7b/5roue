import 'package:five_wheel/models/game.model.dart';
import 'package:five_wheel/models/game_session.model.dart';
import 'package:five_wheel/models/user.model.dart';

abstract class UserService {
  Future<User> getMe();

  Future<List<Game>> getFavoriteGames({required String userId});

  Future<List<GameSession>> getSessions({required String ownerId});
}
