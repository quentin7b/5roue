import 'package:five_wheel/models/game.model.dart';
import 'package:five_wheel/providers/user_favorite_games.provider.dart';
import 'package:five_wheel/widgets/game_card.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A horizontal list of games cards
class FavoriteGamesGrid extends ConsumerWidget {
  /// Callback when a game is tapped
  final Function(Game game)? onGameTap;

  const FavoriteGamesGrid({
    super.key,
    this.onGameTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final games = ref.watch(userFavoriteGamesProvider);
    return LayoutBuilder(
      builder: (context, constraints) {
        return games.when(
          data: (data) {
            final columnCout = constraints.maxWidth ~/ 150;
            return GridView.count(
              crossAxisSpacing: 10,
              primary: false,
              crossAxisCount: columnCout,
              children: data
                  .map(
                    (game) => MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        child: GameCard(game: game),
                        onTap:
                            onGameTap != null ? () => onGameTap!(game) : null,
                      ),
                    ),
                  )
                  .toList(),
            );
          },
          error: (error, stackTrace) {
            debugPrintStack(stackTrace: stackTrace);
            return Text(error.toString());
          },
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }
}