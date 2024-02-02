import 'package:five_wheel/models/game.model.dart';
import 'package:five_wheel/widgets/game_card.widget.dart';
import 'package:flutter/material.dart';

class GamesGrid extends StatelessWidget {
  final List<Game> games;
  final Function(Game game)? onGameTap;

  const GamesGrid({
    super.key,
    required this.games,
    this.onGameTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columnCout = constraints.maxWidth ~/ 150;
        return GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          primary: false,
          crossAxisCount: columnCout,
          children: games
              .map(
                (game) => MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    child: GameCard(game: game),
                    onTap: onGameTap != null ? () => onGameTap!(game) : null,
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
