import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:five_wheel/extensions/gorouter.extension.dart';
import 'package:five_wheel/models/game_session.model.dart';
import 'package:five_wheel/models/language.model.dart';
import 'package:five_wheel/providers/game_level_widget_builder.provider.dart';
import 'package:five_wheel/providers/game_levels.provider.dart';
import 'package:five_wheel/providers/new_session.provider.dart';
import 'package:five_wheel/router.dart';
import 'package:five_wheel/views/session/session.screen.dart';
import 'package:five_wheel/widgets/image_palette_gradient.widget.dart';
import 'package:five_wheel/widgets/mate_slider.widget.dart';
import 'package:five_wheel/widgets/rouded_back_button.widget.dart';
import 'package:five_wheel/widgets/selectable_game_levels_list.widget.dart';
import 'package:five_wheel/widgets/selectable_language_list.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 3 steps
/// - find the game
/// - specify criterias
/// - go to the session screen
class NewSessionRoute extends ConsumerStatefulWidget {
  static const routeName = '/sessions';
  final GameSession? initialValue;

  const NewSessionRoute({
    super.key,
    this.initialValue,
  });

  @override
  ConsumerState<NewSessionRoute> createState() => NewSessionRouteState();
}

class NewSessionRouteState extends ConsumerState<NewSessionRoute> {
  bool isCreating = false;

  @override
  void initState() {
    super.initState();
    Future(() {
      ref.read(newSessionProvider.notifier)
        ..setGame(widget.initialValue?.game)
        ..setLanguages(widget.initialValue?.languagesCriteria)
        ..setMaxPlayersCount(widget.initialValue?.maxPlayersCount);
    });
  }

  @override
  Widget build(BuildContext context) {
    final localSession = ref.watch(newSessionProvider);
    AsyncValue<GameSession>? createdSessionFuture;
    if (isCreating) {
      createdSessionFuture = ref.watch(newSessionCreatorProvider);
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: RoundedBackButton(
          onTap: () => ref.read(routerProvider).maybePop(),
        ),
      ),
      body: localSession.game == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: [
                ImagePaletteGradient(
                  imageProvider: CachedNetworkImageProvider(
                    localSession.game!.pictureUrl,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Hero(
                                tag: localSession.game!.id,
                                child: CachedNetworkImage(
                                  imageUrl: localSession.game!.pictureUrl,
                                  fit: BoxFit.cover,
                                  height: 300,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Text(
                                  'Tu recherches combien de joueurs ?',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: MateSlider(
                                        value: localSession.maxPlayersCount,
                                        min: 1,
                                        max: localSession.game!.maxCoopPlayers -
                                            1,
                                        onChanged: (newValue) {
                                          ref
                                              .read(newSessionProvider.notifier)
                                              .setMaxPlayersCount(
                                                newValue.toInt(),
                                              );
                                        },
                                      ),
                                    ),
                                    CircleAvatar(
                                      child: Text(
                                        '${localSession.maxPlayersCount}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Criterias
                              const Divider(),
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Text(
                                  'Quels niveaux ?',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ),
                              ref
                                  .watch(
                                    levelsForGameProvider(
                                      gameId: localSession.game!.id,
                                    ),
                                  )
                                  .when(
                                    data: (levels) => Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: SelectableGameLevelsList(
                                        levels: levels,
                                        itemBuilder: ref.watch(
                                          itemBuilderForGameProvider(
                                            gameId: localSession.game!.id,
                                          ),
                                        ),
                                        onChange: (levels) => ref
                                            .read(newSessionProvider.notifier)
                                            .setLevels(levels),
                                      ),
                                    ),
                                    error: (error, stackTrace) {
                                      debugPrintStack(stackTrace: stackTrace);
                                      return Text(error.toString());
                                    },
                                    loading: () =>
                                        const CircularProgressIndicator(),
                                  ),
                              const Divider(),
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Text(
                                  'Et quelles langues pour tes lasts ?',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SelectableLanguagesList(
                                  onChange: (languages) => ref
                                      .read(newSessionProvider.notifier)
                                      .setLanguages(languages),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(top: BorderSide(color: Colors.black)),
                        ),
                        child: Column(
                          children: [
                            NewSessionSummary(
                              session: localSession,
                            ),
                            Container(
                              width: double.infinity,
                              height: 48,
                              margin: const EdgeInsets.all(16),
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  setState(() {
                                    isCreating = true;
                                  });
                                },
                                icon: const Icon(Icons.play_arrow_outlined),
                                label: Text(
                                  'Lancer la session pour ${localSession.game!.name}',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                createdSessionFuture?.when(
                      data: (createdSession) {
                        Future(() {
                          ref.read(routerProvider).pushReplacement(
                                SessionRoute.getRouteName(createdSession.id),
                                extra: createdSession,
                              );
                        });
                        return null;
                      },
                      error: (error, stackTrace) {
                        return null;
                      },
                      loading: () => Container(
                        child: const Center(child: CircularProgressIndicator()),
                      ),
                    ) ??
                    const SizedBox.shrink(),
              ],
            ),
    );
  }
}

class NewSessionSummary extends ConsumerWidget {
  final GameSession session;

  const NewSessionSummary({
    super.key,
    required this.session,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        alignment: WrapAlignment.center,
        children: [
          Chip(
            label: Text(
              '${session.maxPlayersCount} joueurs',
            ),
          ),
          if (session.levelsCriteria.isNotEmpty)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('/'),
                ...session.levelsCriteria
                    .map(
                      (e) => ref
                          .read(
                            itemBuilderForGameProvider(
                              gameId: session.game!.id,
                            ),
                          )
                          ?.call(e),
                    )
                    .whereNotNull()
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                        ),
                        child: e,
                      ),
                    ),
              ],
            ),
          if (session.languagesCriteria.isNotEmpty)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('/'),
                ...session.languagesCriteria
                    .map(
                      (l) => l.icon(context),
                    )
                    .whereNotNull()
                    .map(
                      (e) => Container(
                        width: 42,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                        ),
                        child: e,
                      ),
                    ),
              ],
            ),
        ],
      ),
    );
  }
}

class NewSessionPlayerCountStep extends ConsumerStatefulWidget {
  @override
  ConsumerState<NewSessionPlayerCountStep> createState() =>
      NewSessionPlayerCountStepState();
}

class NewSessionPlayerCountStepState
    extends ConsumerState<NewSessionPlayerCountStep> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(
      children: [
        TextField(
          controller: _controller,
        ),
        ElevatedButton(
          onPressed: () {
            ref
                .read(newSessionProvider.notifier)
                .setMaxPlayersCount(int.parse(_controller.text));
          },
          child: const Text('Go'),
        ),
      ],
    );
  }
}

class NewSessionLanguageCriteriaStep extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SelectableLanguagesList(
      onChange: ref.read(newSessionProvider.notifier).setLanguages,
    );
  }
}

class NewSessionCreationLoader extends ConsumerWidget {
  final Function(GameSession session) onSessionCreated;

  NewSessionCreationLoader({
    super.key,
    required this.onSessionCreated,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(newSessionCreatorProvider).when(
      data: (session) {
        Future(() => onSessionCreated(session));
        // TODO beautiful screen ? + delay ?
        return const SizedBox.shrink();
      },
      error: (error, stackTrace) {
        debugPrintStack(stackTrace: stackTrace);
        return Text(error.toString());
      },
      loading: () {
        return const CircularProgressIndicator();
      },
    );
  }
}
