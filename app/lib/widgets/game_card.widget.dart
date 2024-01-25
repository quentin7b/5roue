import 'dart:math';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:five_wheel/models/game.model.dart';
import 'package:five_wheel/widgets/platform_icon.widget.dart';
import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  final bool showTitle;
  final Game game;

  const GameCard({
    super.key,
    required this.game,
    this.showTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = max(constraints.maxHeight, constraints.maxWidth);
        return SizedBox(
          width: size,
          height: size,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: CachedNetworkImage(
                    imageUrl: game.pictureUrl,
                    height: size,
                    width: size,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: CachedNetworkImageProvider(
                      game.pictureUrl,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (showTitle)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.white.withOpacity(.9),
                            ),
                            child: Text(
                              game.name,
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ),
                        ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: game.platforms
                              .map(
                                (p) => Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: PlatformIcon(
                                    platform: p,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
