import 'package:five_wheel/router.dart';
import 'package:five_wheel/views/game/game.screen.dart';
import 'package:five_wheel/views/game/game_list.screen.dart';
import 'package:five_wheel/widgets/games_grid.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeRoute extends ConsumerWidget {
  static const routeName = '/';

  const HomeRoute({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Mes jeux'),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GamesGrid(
                  onGameTap: (game) => ref
                      .read(routerProvider)
                      .push(GameRoute.getRouteName(game.id), extra: game),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ref.read(routerProvider).push(GameListRoute.routeName);
        },
        // TODO: translations
        label: const Text('Add game'),
        icon: const Icon(Icons.add_outlined),
      ),
    );
  }
}
