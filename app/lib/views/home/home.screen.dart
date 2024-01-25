import 'package:five_wheel/router.dart';
import 'package:five_wheel/views/game/game.screen.dart';
import 'package:five_wheel/views/session/new_session.screen.dart';
import 'package:five_wheel/views/session/session.screen.dart';
import 'package:five_wheel/widgets/current_session_card.widget.dart';
import 'package:five_wheel/widgets/favorite_games_grid.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeRoute extends ConsumerWidget {
  static const routeName = '/';

  const HomeRoute({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff230c33),
                Color(0xff592e83),
                Color(0xffb27c66),
              ],
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CurrentSessionCard(
                onTap: (session) => ref.read(routerProvider).push(
                      SessionRoute.getRouteName(session.id),
                      extra: session,
                    ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          'Mes jeux favoris',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: FavoriteGamesGrid(
                          onGameTap: (game) => ref.read(routerProvider).push(
                                GameRoute.getRouteName(game.id),
                                extra: game,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ref.read(routerProvider).push(NewSessionRoute.routeName);
        },
        // TODO: translations
        label: const Text('Start session'),
        icon: const Icon(Icons.play_arrow_outlined),
      ),
    );
  }
}
