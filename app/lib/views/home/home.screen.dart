import 'package:five_wheel/models/game.model.dart';
import 'package:five_wheel/providers/games.provider.dart';
import 'package:five_wheel/providers/user_favorite_games.provider.dart';
import 'package:five_wheel/providers/user_other_games.provider.dart';
import 'package:five_wheel/router.dart';
import 'package:five_wheel/views/game/game.screen.dart';
import 'package:five_wheel/views/session/session.screen.dart';
import 'package:five_wheel/widgets/current_session_card.widget.dart';
import 'package:five_wheel/widgets/games_grid.widget.dart';
import 'package:five_wheel/widgets/search_field.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeRoute extends ConsumerWidget {
  static const routeName = '/';

  const HomeRoute({super.key});

  void _onGameTap(WidgetRef ref, Game game) {
    ref.read(routerProvider).push(
          GameRoute.getRouteName(game.id),
          extra: game,
        );
  }

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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SearchField(
                  onSearch: (search) {
                    ref.read(gamesProvider.notifier).filter(search);
                  },
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GamesContainer(
                          gamesProvider: ref.watch(userFavoriteGamesProvider),
                          onGameTap: (game) => _onGameTap(ref, game),
                          title: 'Mes jeux favoris',
                        ),
                        const SizedBox(height: 16),
                        GamesContainer(
                          gamesProvider: ref.watch(userOtherGamesProvider),
                          onGameTap: (game) => _onGameTap(ref, game),
                          title: 'Jeux disponibles',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GamesContainer extends StatelessWidget {
  final AsyncValue<List<Game>> gamesProvider;
  final Function(Game game)? onGameTap;
  final String title;

  const GamesContainer({
    super.key,
    required this.gamesProvider,
    this.onGameTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return gamesProvider.when(
      data: (data) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(height: 8),
          GamesGrid(
            games: data,
            onGameTap: onGameTap,
          ),
        ],
      ),
      error: (error, stackTrace) {
        debugPrintStack(stackTrace: stackTrace);
        return Text(error.toString());
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
