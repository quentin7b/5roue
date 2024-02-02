import 'package:five_wheel/models/game_session.model.dart';
import 'package:five_wheel/models/language.model.dart';
import 'package:five_wheel/providers/game_levels.provider.dart';
import 'package:five_wheel/providers/new_session.provider.dart';
import 'package:five_wheel/widgets/game_card.widget.dart';
import 'package:five_wheel/widgets/mate_slider.widget.dart';
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
    final createSession = ref.watch(newSessionProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Démarrer une session'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: createSession.game == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  // Game list card
                  GameCard(
                    game: createSession.game!,
                    type: GameCardType.line,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      alignment: WrapAlignment.center,
                      children: [
                        Chip(
                          label: Text(
                            '${createSession.maxPlayersCount} joueurs',
                          ),
                        ),
                        Chip(
                          label: Text(
                            createSession.levelsCriteria
                                .map((e) => e.name)
                                .join(' ,'),
                          ),
                        ),
                        Chip(
                          label: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: createSession.languagesCriteria
                                .map((e) => e.icon(context))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Divider(),
                          // Palyer count
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Tu recherches combien de joueurs ?',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: MateSlider(
                                  value: createSession.maxPlayersCount,
                                  min: 1,
                                  max: createSession.game!.maxCoopPlayers - 1,
                                  onChanged: (newValue) {
                                    ref
                                        .read(newSessionProvider.notifier)
                                        .setMaxPlayersCount(newValue.toInt());
                                  },
                                ),
                              ),
                              CircleAvatar(
                                child: Text(
                                  '${createSession.maxPlayersCount}',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                            ],
                          ),
                          // Criterias
                          const Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Quels niveaux ?',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          ref
                              .watch(
                                levelsForGameProvider(
                                  gameId: createSession.game!.id,
                                ),
                              )
                              .when(
                                data: (levels) => SelectableGameLevelsList(
                                  levels: levels,
                                  onChange: (levels) => ref
                                      .read(newSessionProvider.notifier)
                                      .setLevels(levels),
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
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Et quelles langues pour tes lasts ?',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          SelectableLanguagesList(
                            onChange: (languages) => ref
                                .read(newSessionProvider.notifier)
                                .setLanguages(languages),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 48,
                    margin: const EdgeInsets.all(16),
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.play_arrow_outlined),
                      label: const Text('Lancer la session'),
                    ),
                  ),
                ],
              ),
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
