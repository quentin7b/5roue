import 'package:five_wheel/providers/games.provider.dart';
import 'package:five_wheel/router.dart';
import 'package:five_wheel/views/game/game.screen.dart';
import 'package:five_wheel/widgets/available_games_list.widget.dart';
import 'package:five_wheel/widgets/search_field.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameListRoute extends ConsumerWidget {
  static const routeName = '/games';

  const GameListRoute({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          // TODO: consts
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchField(
                onSearch: (search) {
                  ref.read(gamesProvider.notifier).filter(search);
                },
              ),
              Expanded(
                child: AvailableGamesList(
                  onGameTap: (game) => ref
                      .read(routerProvider)
                      .push(GameRoute.getRouteName(game.id), extra: game),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
