import 'package:five_wheel/models/game_session.model.dart';
import 'package:five_wheel/providers/services.provider.dart';
import 'package:five_wheel/providers/user.provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_sessions.provider.g.dart';

@Riverpod(keepAlive: true)
class UserSessions extends _$UserSessions {
  @override
  AsyncValue<List<GameSession>> build() {
    final user = ref.watch(currentUserProvider);
    if (user != null) {
      reloadSessions();
      return const AsyncLoading();
    }
    return const AsyncData([]);
  }

  void reloadSessions() async {
    final userId = ref.read(currentUserProvider)!.id;
    state = await AsyncValue.guard(
      () async {
        final sessions =
            await ref.read(userServiceProvider).getSessions(ownerId: userId);
        return sessions;
      },
    );
  }
}
