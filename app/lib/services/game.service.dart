import 'package:five_wheel/models/game.model.dart';

abstract class GameService {
  Future<List<Game>> getGames();
  Future<Game> getGame({required String gameId});
}
