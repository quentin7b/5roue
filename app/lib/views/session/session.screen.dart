import 'package:cached_network_image/cached_network_image.dart';
import 'package:five_wheel/models/game_session.model.dart';
import 'package:five_wheel/models/language.model.dart';
import 'package:five_wheel/providers/session.provider.dart';
import 'package:five_wheel/widgets/game_card.widget.dart';
import 'package:five_wheel/widgets/image_palette_gradient.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SessionRoute extends ConsumerWidget {
  static const routeName = '/sessions/:id';

  static String getRouteName(String sessionId) {
    return routeName.replaceAll(':id', sessionId);
  }

  final String sessionId;
  final GameSession? session;

  const SessionRoute({
    super.key,
    required this.sessionId,
    this.session,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(
      sessionProvider(
        sessionId: sessionId,
        initialValue: session,
      ),
    );
    debugPrint('Rebuilding session screen');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: s.when(
        data: (data) => SessionView(session: data),
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

class SessionView extends ConsumerWidget {
  final GameSession session;

  const SessionView({
    super.key,
    required this.session,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ImagePaletteGradient(
      imageProvider: session.game?.pictureUrl != null
          ? CachedNetworkImageProvider(session.game!.pictureUrl)
          : null,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 32),
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: GameCard(
                        game: session.game!,
                        showTitle: false,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.3),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          session.game!.name,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Builder(
                      builder: (context) {
                        final playerCount =
                            (session.game?.maxCoopPlayers ?? 0) -
                                session.maxPlayersCount;
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            session.game?.maxCoopPlayers ?? 0,
                            (index) => Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: CircleAvatar(
                                backgroundColor: index < playerCount
                                    ? const Color(0xff90be6d)
                                    : const Color(0xfff3722c),
                                child: const Icon(Icons.people_alt_outlined),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Divider(),
                    ),
                    Text(
                      session.languagesCriteria.map((e) => e.icon).join(' / '),
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontSize: 32),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(
                  session.isOpen
                      ? Icons.pause_outlined
                      : Icons.play_arrow_outlined,
                ),
                label: Text(
                    '${session.isOpen ? 'Mettre en pause' : 'Lancer'} la recherche'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
