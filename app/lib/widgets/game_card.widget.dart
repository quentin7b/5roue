import 'dart:math';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:five_wheel/models/game.model.dart';
import 'package:flutter/material.dart';

enum GameCardType {
  square,
  line,
}

class GameCard extends StatelessWidget {
  final bool showTitle;
  final Game game;
  final GameCardType type;

  const GameCard({
    super.key,
    required this.game,
    this.showTitle = true,
    this.type = GameCardType.square,
  });

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      GameCardType.square => SquareGameCard(game: game, showTitle: showTitle),
      GameCardType.line => LineGameCard(game: game, showTitle: showTitle),
    };
  }
}

class SquareGameCard extends StatelessWidget {
  final bool showTitle;
  final Game game;

  const SquareGameCard({
    super.key,
    required this.game,
    this.showTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = max(constraints.maxHeight, constraints.maxWidth);
        return SizedBox(
          width: size,
          height: size,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: CachedNetworkImage(
                    imageUrl: game.pictureUrl,
                    height: size,
                    width: size,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: CachedNetworkImageProvider(
                      game.pictureUrl,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (showTitle)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.white.withOpacity(.9),
                            ),
                            child: Text(
                              game.name,
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class LineGameCard extends StatelessWidget {
  final bool showTitle;
  final Game game;

  const LineGameCard({
    super.key,
    required this.game,
    this.showTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 150,
            width: 150,
            child: SquareGameCard(game: game, showTitle: false),
          ),
          Expanded(
            child: Text(
              game.name,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
