import 'package:five_wheel/models/platform.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlatformIcon extends StatelessWidget {
  final Platform platform;

  PlatformIcon({
    super.key,
    required this.platform,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 32,
        maxHeight: 32,
      ),
      child: SvgPicture.asset(
        switch (platform) {
          Platform.steam => 'assets/images/icons/ic_steam.svg',
          Platform.psn => 'assets/images/icons/ic_psn.svg',
          Platform.xbox => 'assets/images/icons/ic_xbox.svg',
          Platform.windows => 'assets/images/icons/ic_windows.svg',
          Platform.riot => 'assets/images/icons/ic_riot.svg',
          Platform.epic => 'assets/images/icons/ic_epic.svg',
          Platform.ea => 'assets/images/icons/ic_ea.svg',
          Platform.nintendo => 'assets/images/icons/ic_nintendo.svg',
        },
        semanticsLabel: platform.toString(),
      ),
    );
  }
}
