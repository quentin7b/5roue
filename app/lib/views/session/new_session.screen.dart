import 'package:five_wheel/models/game_session.model.dart';
import 'package:five_wheel/providers/games.provider.dart';
import 'package:five_wheel/providers/new_session.provider.dart';
import 'package:five_wheel/router.dart';
import 'package:five_wheel/views/session/session.screen.dart';
import 'package:five_wheel/widgets/available_games_list.widget.dart';
import 'package:five_wheel/widgets/search_field.widget.dart';
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
    late Widget formWidget;
    if (createSession.game == null) {
      formWidget = NewSessionGamePickerStep();
    } else if (createSession.maxPlayersCount == 0) {
      formWidget = NewSessionPlayerCountStep();
    } // TODO:criterias
    else if (createSession.languagesCriteria.isEmpty) {
      formWidget = NewSessionLanguageCriteriaStep();
    } else {
      formWidget = NewSessionCreationLoader(
        onSessionCreated: (session) => ref.read(routerProvider).go(
              SessionRoute.getRouteName(session.id),
              extra: session,
            ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Démarrer une session'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: formWidget,
        ),
      ),
    );
  }
}

class NewSessionGamePickerStep extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SearchField(
          onSearch: (search) {
            ref.read(gamesProvider.notifier).filter(search);
          },
        ),
        Expanded(
          child: AvailableGamesList(
            onGameTap: (game) {
              // Update
              ref.read(newSessionProvider.notifier).setGame(game);
            },
          ),
        ),
      ],
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
