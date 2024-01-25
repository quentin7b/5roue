import 'package:five_wheel/models/game.model.dart';
import 'package:five_wheel/models/game_session.model.dart';
import 'package:five_wheel/views/auth/auth.screen.dart';
import 'package:five_wheel/views/game/game.screen.dart';
import 'package:five_wheel/views/game/game_list.screen.dart';
import 'package:five_wheel/views/home/home.screen.dart';
import 'package:five_wheel/views/session/new_session.screen.dart';
import 'package:five_wheel/views/session/session.screen.dart';
import 'package:five_wheel/views/splash/splash.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      initialLocation: SplashRoute.routeName,
      routes: [
        GoRoute(
          path: AuthRoute.routeName,
          pageBuilder: (context, state) => const MaterialPage(
            child: AuthRoute(),
          ),
        ),
        GoRoute(
          path: SplashRoute.routeName,
          pageBuilder: (context, state) => const MaterialPage(
            child: SplashRoute(),
          ),
        ),
        GoRoute(
          path: HomeRoute.routeName,
          pageBuilder: (context, state) => const MaterialPage(
            child: HomeRoute(),
          ),
        ),
        GoRoute(
          path: GameListRoute.routeName,
          pageBuilder: (context, state) {
            debugPrint('GameListRoute: ${state.uri}');
            return const MaterialPage(
              child: GameListRoute(),
            );
          },
        ),
        GoRoute(
          path: GameRoute.routeName,
          pageBuilder: (context, state) {
            debugPrint('GameRoute: ${state.uri}');
            // Extract id
            final gameId = state.pathParameters['id']!;
            // Try to extract game
            final Game? game = state.extra as Game?;
            return MaterialPage(
              child: GameRoute(
                gameId: gameId,
                game: game,
              ),
            );
          },
        ),
        GoRoute(
          path: SessionRoute.routeName,
          pageBuilder: (context, state) {
            final sessionId =
                state.pathParameters['id']!; // Try to extract game
            final GameSession? session = state.extra as GameSession?;
            return MaterialPage(
              child: SessionRoute(
                sessionId: sessionId,
                session: session,
              ),
            );
          },
        ),
        GoRoute(
          path: NewSessionRoute.routeName,
          pageBuilder: (context, state) {
            final GameSession? initialSession = state.extra as GameSession?;
            return MaterialPage(
              child: NewSessionRoute(
                initialValue: initialSession,
              ),
            );
          },
        ),
      ],
    );
  },
);
