import 'package:five_wheel/models/game.model.dart';
import 'package:five_wheel/models/game_level.model.dart';
import 'package:five_wheel/models/game_session.model.dart';
import 'package:five_wheel/models/language.model.dart';
import 'package:five_wheel/providers/services.provider.dart';
import 'package:five_wheel/providers/user.provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'new_session.provider.g.dart';

@riverpod
class NewSession extends _$NewSession {
  @override
  GameSession build() {
    return GameSession(
      id: const Uuid().v4(),
      ownerId: ref.read(currentUserProvider)!.id,
      maxPlayersCount: 0,
      // Criterias
      languagesCriteria: [],
    );
  }

  void setGame(Game? game) {
    state = state.copyWith(game: game);
  }

  void setMaxPlayersCount(int? maxPlayersCount) {
    state = state.copyWith(maxPlayersCount: maxPlayersCount ?? 0);
  }

  void setLanguages(List<Language>? languages) {
    state = state.copyWith(languagesCriteria: languages ?? []);
  }

  void setLevels(List<GameLevel>? levels) {
    state = state.copyWith(levelsCriteria: levels ?? []);
  }
}

@riverpod
class NewSessionCreator extends _$NewSessionCreator {
  @override
  AsyncValue<GameSession> build() {
    _createSession();
    return const AsyncValue.loading();
  }

  void _createSession() async {
    final session = ref.read(newSessionProvider);
    state = await AsyncValue.guard(
      () => ref.read(sessionServiceProvider).createOrUpdate(session: session),
    );
  }
}
