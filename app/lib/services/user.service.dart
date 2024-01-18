import 'package:five_wheel/models/game.model.dart';
import 'package:five_wheel/models/user.model.dart';

abstract class UserService {
  Future<User> getMe();

  Future<List<Game>> getGames({required String userId});
}
