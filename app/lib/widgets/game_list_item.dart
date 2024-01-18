import 'package:cached_network_image/cached_network_image.dart';
import 'package:five_wheel/models/game.model.dart';
import 'package:flutter/material.dart';

class GameListItem extends StatelessWidget {
  final Game game;

  const GameListItem({
    super.key,
    required this.game,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CachedNetworkImage(
          imageUrl: game.pictureUrl,
          height: 50,
          width: 50,
          fit: BoxFit.cover,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(game.name),
              Text(game.platforms.firstOrNull?.name ?? ''),
            ],
          ),
        ),
      ],
    );
  }
}
