import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

extension PaletteGeneratorToGradient on AsyncSnapshot<PaletteGenerator> {
  List<Color> toGradientColors() {
    if (hasData) {
      return [
        data!.dominantColor!.color,
        ...data!.paletteColors.map((e) => e.color).take(5),
      ];
    } else {
      return [
        Colors.transparent,
        Colors.transparent,
      ];
    }
  }
}
