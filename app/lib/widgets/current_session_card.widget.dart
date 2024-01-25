import 'package:cached_network_image/cached_network_image.dart';
import 'package:five_wheel/models/game_session.model.dart';
import 'package:five_wheel/providers/session.provider.dart';
import 'package:five_wheel/providers/user_sessions.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrentSessionCard extends ConsumerWidget {
  final Function(GameSession session) onTap;

  const CurrentSessionCard({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(userSessionsProvider).when(
          data: (sessions) {
            final activeSession = sessions.lastOrNull;
            if (activeSession == null) {
              return const SizedBox.shrink();
            }
            return ActiveSessionCard(
              initialSession: activeSession,
              onTap: () => onTap(activeSession),
            );
          },
          error: (error, stackTrace) {
            debugPrintStack(stackTrace: stackTrace);
            return Text(error.toString());
          },
          loading: () => const Center(child: CircularProgressIndicator()),
        );
  }
}

class ActiveSessionCard extends ConsumerStatefulWidget {
  final VoidCallback onTap;
  final GameSession initialSession;

  ActiveSessionCard({
    super.key,
    required this.initialSession,
    required this.onTap,
  });

  @override
  ConsumerState<ActiveSessionCard> createState() => ActiveSessionCardState();
}

class ActiveSessionCardState extends ConsumerState<ActiveSessionCard> {
  @override
  void initState() {
    super.initState();
    Future(() {
      ref
          .read(
            sessionProvider(
              sessionId: widget.initialSession.id,
              initialValue: widget.initialSession,
            ).notifier,
          )
          .startListening();
    });
  }

  @override
  void dispose() {
    ref.invalidate(
      sessionProvider(
        sessionId: widget.initialSession.id,
        initialValue: widget.initialSession,
      ),
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sessionSnapshot = ref.watch(
      sessionProvider(
        sessionId: widget.initialSession.id,
        initialValue: widget.initialSession,
      ),
    );
    debugPrint('Rebuilding session card');
    return sessionSnapshot.when(
      data: (session) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: widget.onTap,
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 72,
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: session.game?.pictureUrl != null
                          ? DecorationImage(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(
                                session.game!.pictureUrl,
                              ),
                            )
                          : null,
                      color: session.game?.pictureUrl == null
                          ? const Color(0xffb27c66)
                          : null,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.white.withOpacity(.68),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text('Session active'),
                              const SizedBox(width: 8),
                              Text(
                                session.isOpen
                                    ? 'Recherche en cours'
                                    : 'Recherche terminée',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            session.game!.name,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                    ),
                  ),
                  LinearProgressIndicator(
                    minHeight: 6,
                    color: session.isOpen
                        ? const Color(0xfff4a261)
                        : const Color(0xff40916c),
                    value: session.isOpen ? null : 1,
                  ),
                ],
              ),
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        debugPrintStack(stackTrace: stackTrace);
        return Text(error.toString());
      },
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
