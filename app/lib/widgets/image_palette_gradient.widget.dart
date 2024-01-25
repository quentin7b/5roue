import 'package:five_wheel/extensions/palettegenerator.extension.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class ImagePaletteGradient extends StatelessWidget {
  final ImageProvider? imageProvider;
  final Widget? child;

  const ImagePaletteGradient({
    super.key,
    this.imageProvider,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PaletteGenerator>(
      future: imageProvider != null
          ? PaletteGenerator.fromImageProvider(imageProvider!)
          : Future.error('No image provided'),
      builder: (context, paletteValueSnapshot) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: paletteValueSnapshot.toGradientColors(),
            ),
          ),
          child: child,
        );
      },
    );
  }
}
