import 'dart:async';

import 'package:five_wheel/models/game_session.model.dart';
import 'package:five_wheel/providers/services.provider.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'session.provider.g.dart';

@riverpod
class Session extends _$Session {
  late String sessionId;
  final StreamController<GameSession> _controller = StreamController();

  @override
  Stream<GameSession> build({
    required String sessionId,
    GameSession? initialValue,
  }) {
    this.sessionId = sessionId;
    _loadSession(initial: initialValue);
    return _controller.stream;
  }

  void _loadSession({GameSession? initial}) {
    debugPrint('Loading session');
    if (initialValue != null) {
      _controller.sink.add(initialValue!);
    }
    ref
        .read(sessionServiceProvider)
        .getSession(sessionId: sessionId)
        .then((session) => _controller.sink.add(session));
    ;
  }

  void startListening() {
    debugPrint('Starting session listener');
    final timer = Timer.periodic(
      const Duration(seconds: 30),
      (timer) {
        _loadSession();
      },
    );
    ref.onDispose(() {
      debugPrint('Stopping session listener');
      timer.cancel();
      _controller.close();
    });
  }

  void playPause() async {
    GameSession? session = state.asData?.valueOrNull;
    if (session == null) {
      return;
    }
    if (session.isActive == true) {
      await ref.read(sessionServiceProvider).pause(sessionId: sessionId);
    } else {
      await ref.read(sessionServiceProvider).play(sessionId: sessionId);
    }
    _controller.sink.add(session.copyWith(isActive: !session.isActive));
  }
}
