import 'package:five_wheel/models/game_level.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef GameLevelItemBuilder = Widget Function(GameLevel level);

final _selectedLevelsProvider = StateProvider<List<GameLevel>>((ref) => []);

class SelectableGameLevelsList extends ConsumerWidget {
  final List<GameLevel> levels;
  final Function(List<GameLevel> levels) onChange;
  final GameLevelItemBuilder? itemBuilder;

  const SelectableGameLevelsList({
    super.key,
    required this.levels,
    required this.onChange,
    this.itemBuilder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sortedLevels = List.from(this.levels)
      ..sort(
        (a, b) => a.order.compareTo(b.order),
      );
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: levels.length,
      itemBuilder: (context, index) {
        final level = sortedLevels[index];
        return CheckboxListTile(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              itemBuilder?.call(level) ?? Text(level.name),
            ],
          ),
          value: ref.watch(_selectedLevelsProvider).contains(level),
          onChanged: (value) {
            final originalList =
                ref.read(_selectedLevelsProvider.notifier).state;
            if (value != null && value) {
              ref.read(_selectedLevelsProvider.notifier).state = [
                ...ref.watch(_selectedLevelsProvider),
                level,
              ];
            } else {
              ref.read(_selectedLevelsProvider.notifier).state =
                  originalList.where((element) => element != level).toList();
            }
            onChange(ref.read(_selectedLevelsProvider));
          },
        );
      },
    );
  }
}
