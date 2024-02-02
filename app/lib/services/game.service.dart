import 'package:five_wheel/models/game.model.dart';
import 'package:five_wheel/models/game_level.model.dart';

abstract class GameService {
  Future<List<Game>> getGames();
  Future<Game> getGame({required String gameId});
  Future<List<GameLevel>> getGameLevels({required String gameId});
  Future<void> updateGameForUser(Game game);
}
