import 'package:five_wheel/models/game_level.model.dart';
import 'package:five_wheel/widgets/selectable_game_levels_list.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_level_widget_builder.provider.g.dart';

const String _cs2 = 'c0188b30-e5fc-4689-958a-d8a1828d774e';

@riverpod
GameLevelItemBuilder? itemBuilderForGame(
  Ref ref, {
  required String gameId,
}) {
  switch (gameId) {
    // CS2
    case _cs2:
      return _cs2GameLevelWidgetBuilder;
    default:
      return null;
  }
}

final _cs2GameLevelWidgetBuilder = (GameLevel level) {
  var backColor = Colors.transparent;
  var frontColor = Colors.black;
  if (level.order < 5) {
    backColor = const Color(0xFF3C414B);
    frontColor = const Color(0xFFBBC6D7);
  } else if (level.order < 10) {
    backColor = const Color(0xFF334254);
    frontColor = const Color(0xFF95B8E5);
  } else if (level.order < 15) {
    backColor = const Color(0xFF242959);
    frontColor = const Color(0xFF6E7AE7);
  } else if (level.order < 20) {
    backColor = const Color(0xFF3C2256);
    frontColor = const Color(0xFFB06DF7);
  } else if (level.order < 25) {
    backColor = const Color(0xFF500D5C);
    frontColor = const Color(0xFFCD36ED);
  } else if (level.order < 30) {
    backColor = const Color(0xFF4D160E);
    frontColor = const Color(0xFFD65C4B);
  } else {
    backColor = const Color(0xFF403304);
    frontColor = const Color(0xFFF3D630);
  }
  return Container(
    decoration: BoxDecoration(
      color: backColor,
    ),
    child: IntrinsicHeight(
      child: Row(
        children: [
          Container(
            width: 5,
            color: frontColor,
          ),
          const SizedBox(width: 2),
          Container(
            width: 5,
            color: frontColor,
          ),
          Builder(
            builder: (context) {
              return Container(
                padding: const EdgeInsets.all(8),
                child: Text(
                  level.name,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: frontColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              );
            },
          ),
        ],
      ),
    ),
  );
};
