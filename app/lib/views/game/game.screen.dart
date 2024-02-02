import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:five_wheel/extensions/gorouter.extension.dart';
import 'package:five_wheel/models/game.model.dart';
import 'package:five_wheel/models/game_session.model.dart';
import 'package:five_wheel/providers/game.provider.dart';
import 'package:five_wheel/providers/user.provider.dart';
import 'package:five_wheel/router.dart';
import 'package:five_wheel/views/session/new_session.screen.dart';
import 'package:five_wheel/widgets/image_palette_gradient.widget.dart';
import 'package:five_wheel/widgets/platform_icon.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

class GameRoute extends ConsumerWidget {
  static const routeName = '/games/:id';

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
        ref.watch(gameInfoProvider(gameId: gameId, initialValue: game));
    return Scaffold(
      body: gameEntity.when(
        data: (g) {
          return GameView(
            game: g,
            onFavoriteTap: ref
                .read(
                  gameInfoProvider(gameId: gameId, initialValue: game).notifier,
                )
                .toggleFavorite,
            onStartSessionTap: () {
              ref.read(routerProvider).push(
                    NewSessionRoute.routeName,
                    extra: GameSession(
                      id: const Uuid().v4(),
                      ownerId: ref.read(currentUserProvider)!.id,
                      game: g,
                      maxPlayersCount: g.maxCoopPlayers - 1,
                    ),
                  );
            },
            onBackTap: () => ref.read(routerProvider).maybePop(),
          );
        },
        error: (error, stackTrace) {
          debugPrintStack(stackTrace: stackTrace);
          return Text(error.toString());
        },
        loading: () {
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}

class GameView extends StatelessWidget {
  final Game game;
  final Function(bool isFavorite)? onFavoriteTap;
  final VoidCallback? onBackTap;
  final VoidCallback? onStartSessionTap;

  const GameView({
    super.key,
    required this.game,
    this.onFavoriteTap,
    this.onBackTap,
    this.onStartSessionTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: constraints.maxHeight / 2.2,
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                imageUrl: game.pictureUrl,
                fit: BoxFit.cover,
              ),
            ),
            leading: Container(
              margin: const EdgeInsets.only(top: 8, left: 8),
              child: ClipOval(
                child: Material(
                  color: Colors.white.withOpacity(.7),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: onBackTap,
                  ),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: ImagePaletteGradient(
              imageProvider: CachedNetworkImageProvider(game.pictureUrl),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  margin: const EdgeInsets.only(right: 16),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(.2),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Text(
                                      game.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge,
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  game.isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_outline,
                                ),
                                tooltip: game.isFavorite
                                    ? 'Retirer des favoris'
                                    : 'Ajouter aux favoris',
                                onPressed: () =>
                                    onFavoriteTap?.call(!game.isFavorite),
                              ),
                            ],
                          ),
                          // Platforms row
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 16),
                            child: Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: game.platforms
                                  .map(
                                    (p) => ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaX: 8,
                                          sigmaY: 8,
                                        ),
                                        child: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(.35),
                                          ),
                                          child: PlatformIcon(platform: p),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                          const Divider(),
                          // Max players
                          Text(
                            '${game.maxCoopPlayers} joueurs maximum en session',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: List.generate(
                                game.maxCoopPlayers,
                                (index) => const Padding(
                                  padding: EdgeInsets.only(right: 8),
                                  child: CircleAvatar(
                                    child: Icon(Icons.people_alt_outlined),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 48,
                      margin: const EdgeInsets.all(16),
                      child: ElevatedButton.icon(
                        onPressed: onStartSessionTap,
                        icon: const Icon(Icons.play_arrow_outlined),
                        label: const Text('Lancer une session'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
