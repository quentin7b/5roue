import 'package:five_wheel/models/game.model.dart';
import 'package:five_wheel/views/auth/auth.screen.dart';
import 'package:five_wheel/views/game/game.screen.dart';
import 'package:five_wheel/views/game/game_list.screen.dart';
import 'package:five_wheel/views/home/home.screen.dart';
import 'package:five_wheel/views/splash/splash.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
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
        path: GameRoute.routeName,
        pageBuilder: (context, state) {
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
        path: GameListRoute.routeName,
        pageBuilder: (context, state) => const MaterialPage(
          child: GameListRoute(),
        ),
      ),
    ],
  );
});
