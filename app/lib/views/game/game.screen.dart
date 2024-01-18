import 'package:cached_network_image/cached_network_image.dart';
import 'package:five_wheel/models/game.model.dart';
import 'package:five_wheel/providers/game.provider.dart';
import 'package:five_wheel/views/home/home.screen.dart';
import 'package:five_wheel/widgets/platform_icon.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameRoute extends ConsumerWidget {
  static const routeName = '/game/:id';

  static String getRouteName(String gameId) {
    return routeName.replaceAll(':id', gameId);
  }

  final String gameId;
  final Game? game;

  const GameRoute({
    super.key,
    required this.gameId,
    this.game,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameEntity =
        ref.watch(gameProvider(gameId: gameId, initialValue: game));
    return Scaffold(
      body: gameEntity.when(
        data: (g) {
          return SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Centered Image of the game
                        LayoutBuilder(
                          builder: (context, constraints) {
                            final imageSize = .6 * constraints.maxWidth;
                            return Container(
                              margin: const EdgeInsets.only(
                                top: 32,
                                bottom: 32,
                              ),
                              child: Center(
                                child: CachedNetworkImage(
                                  imageUrl: g.pictureUrl,
                                  height: imageSize,
                                  width: imageSize,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                        Text(
                          g.name,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Divider(),
                        // Platforms row
                        Container(
                          margin: const EdgeInsets.all(16),
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: g.platforms
                                .map(
                                  (p) => PlatformIcon(platform: p),
                                )
                                .toList(),
                          ),
                        ),
                        const Divider(),
                        Container(
                          margin: const EdgeInsets.all(16),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                HomeRoute.routeName,
                              );
                            },
                            child: const Text('Je possède ce jeu'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        HomeRoute.routeName,
                      );
                    },
                    child: const Text('Lancer une session'),
                  ),
                ),
              ],
            ),
          );
        },
        error: (error, stackTrace) {
          return Text(error.toString());
        },
        loading: () {
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
