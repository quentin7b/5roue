import 'package:cached_network_image/cached_network_image.dart';
import 'package:five_wheel/models/game.model.dart';
import 'package:five_wheel/providers/games.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AvailableGamesList extends ConsumerWidget {
  final Function(Game game) onGameTap;

  AvailableGamesList({
    super.key,
    required this.onGameTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final games = ref.watch(gamesProvider);
    return games.when(
      data: (g) {
        return ListView.builder(
          itemCount: g.length,
          itemBuilder: (context, index) {
            final game = g[index];
            return Container(
              margin: EdgeInsets.only(top: index == 0 ? 0 : 8),
              child: ListTile(
                leading: CachedNetworkImage(
                  imageUrl: game.pictureUrl,
                  height: 50,
                  width: 50,
                  fit: BoxFit.contain,
                ),
                title: Text(game.name),
                onTap: () => onGameTap(game),
              ),
            );
          },
        );
      },
      error: (error, stackTrace) {
        return Text(error.toString());
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
